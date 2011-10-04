using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using IP.Core.IPCommon;
using IP.Core.IPData;
using IP.Core.IPUserService;

using WebUS;
using WebDS;
using WebDS.CDBNames;
using System.Data;

public partial class ChuNang_F202_DanhSachGiangVien : System.Web.UI.Page
{

    #region Members
    US_V_DM_GIANG_VIEN m_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
    DS_V_DM_GIANG_VIEN m_ds_giang_vien = new DS_V_DM_GIANG_VIEN();

    US_CM_DM_TU_DIEN m_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_dm_tu_dien = new DS_CM_DM_TU_DIEN();
    #endregion

    // Cho phép nhìn lại lần cuối cùng ta search trên form giảng viên là gì?
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            m_lbl_thong_bao.Text = "";
            if (!IsPostBack)
            {
                // Nếu đã tồn tại session, ta load lại dữ liệu lên form và search theo session
                if (Session["Sname"] != null)
                {
                    session_2_form();
                    search_using_session();
                }
                load_2_cbo_don_vi_q_ly();
                load_2_cbo_trang_thai_giang_vien();
                if (Request.QueryString["edit"] != null)
                {
                    if (Request.QueryString["edit"].ToString().Equals("ok"))
                        m_lbl_thong_bao.Text = "Cập nhật dữ liệu thành công";
                    else m_lbl_thong_bao.Text = "Thêm dữ liệu thành công";
                }
            }
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }

    }

    #region Private Methods
    
    private void load_data_to_grid()
    {
        try
        {
            // Đổ dữ liệu từ US vào DS
            m_us_dm_giang_vien.FillDataset(m_ds_giang_vien);

            // Treo dữ liệu lên lưới
            m_grv_dm_danh_sach_giang_vien.DataSource = m_ds_giang_vien.V_DM_GIANG_VIEN;
            m_grv_dm_danh_sach_giang_vien.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;

        }
    }
   
    private string get_ma_from_id(string ip_dc_id_trang_thai_giang_vien)
    {
        try
        {
            US_CM_DM_TU_DIEN v_us_dm_tu_dien = new US_CM_DM_TU_DIEN();
            DS_CM_DM_TU_DIEN v_ds_dm_tu_dien = new DS_CM_DM_TU_DIEN();

            v_us_dm_tu_dien.FillDataset(v_ds_dm_tu_dien, " WHERE ID = " + ip_dc_id_trang_thai_giang_vien + "");
            return CIPConvert.ToStr(v_ds_dm_tu_dien.CM_DM_TU_DIEN[0][CM_DM_TU_DIEN.MA_TU_DIEN]);
        }

        catch (Exception v_e)
        {

            throw v_e;
        }
    }

    private void delete_dm_giang_vien(int ip_i_row_del)
    {
        try
        {
            decimal v_dc_id_ma_giang_vien = CIPConvert.ToDecimal(m_grv_dm_danh_sach_giang_vien.DataKeys[ip_i_row_del].Value);
            m_us_dm_giang_vien.dcID = v_dc_id_ma_giang_vien;
            m_us_dm_giang_vien.DeleteByID(v_dc_id_ma_giang_vien);
            m_lbl_thong_bao.Text = "Xóa bản ghi thành công";
            get_form_search_data_and_load_to_grid();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }

    //
    // Region for search
    //

    private void load_2_cbo_trang_thai_giang_vien()
    {
        try
        {
            DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
           // DataRow v_dr_all = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = " + (int)e_loai_tu_dien.TRANG_THAI_GIANG_VIEN); // Đây là lấy theo điều kiện
           
            m_cbo_trang_thai_g_vien.Items.Add(new ListItem("Tất cả","0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_trang_thai_g_vien.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }
        }

        catch (Exception v_e)
        {
            throw v_e;
        }
    }
   /// <summary>
   /// Load session và đổ lên form
   /// </summary>
    private void session_2_form()
    {
        m_txt_ten_giang_vien.Text = CIPConvert.ToStr(Session["Sname"]);
        if (CIPConvert.ToStr(Session["Sgender"]).Equals("N"))
            rdl_gender_check.Items[2].Selected = true;
        else if (CIPConvert.ToStr(Session["Sgender"]).Equals("Y"))
            rdl_gender_check.Items[1].Selected = true;
        else rdl_gender_check.Items[0].Selected = true;
        m_cbo_trang_thai_g_vien.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Sstatus"]));
        m_cbo_don_vi_q_ly.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Squanly"]));
        m_txt_tu_khoa_tim_kiem.Text = CIPConvert.ToStr(Session["Skey"]);
        if (CIPConvert.ToStr(Session["Sdathoptac"]) != "")
            m_dat_ngay_bd_hop_tac.SelectedDate = CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdathoptac"]), "dd/MM/yyyy");
        m_cbo_thang_sn_GV.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Smonth"]));
    }


    private void load_2_cbo_don_vi_q_ly()
    {
        try
        {
            DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
            //v_ds_cm_tu_dien.Clear();
            //DataRow v_dr_all_dv_quan_ly = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "
                                                + (int)e_loai_tu_dien.DON_VI_QUAN_LY_CHINH); // Đây là lấy theo điều kiện
            //add item Tat Ca          
            //v_dr_all_dv_quan_ly[CM_DM_TU_DIEN.ID] = 0;
            //v_dr_all_dv_quan_ly[CM_DM_TU_DIEN.TEN] = "Tất cả";

            //v_ds_cm_tu_dien.EnforceConstraints = false;
            //v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_all_dv_quan_ly, 0);

            //m_cbo_don_vi_q_ly.DataValueField = CM_DM_TU_DIEN.ID;
            //m_cbo_don_vi_q_ly.DataTextField = CM_DM_TU_DIEN.TEN;

            //m_cbo_don_vi_q_ly.DataSource = v_ds_cm_tu_dien.CM_DM_TU_DIEN;
            //m_cbo_don_vi_q_ly.DataBind();
              m_cbo_don_vi_q_ly.Items.Add(new ListItem("Tất cả","0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_don_vi_q_ly.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(),v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    //Thu thập dữ liệu và cho vào sesion
    /// <summary>
    /// Thu thập dữ liệu và gán cho các session
    /// </summary>
    /// <param name="ip_str_name"></param>
    /// <param name="ip_str_keyword"></param>
    /// <param name="ip_str_gender"></param>
    /// <param name="ip_dc_id_trang_thai_giang_vien"></param>
    /// <param name="ip_dc_id_don_vi_quan_ly"></param>
    /// <param name="ip_dat_ngay_bd_hop_tac"></param>
    /// <param name="ip_dc_month_birthday"></param>
    private void collect_data_2_search(string ip_str_name,string ip_str_keyword
                                    ,string ip_str_gender
                                    , decimal ip_dc_id_trang_thai_giang_vien
                                    , decimal ip_dc_id_don_vi_quan_ly
                                    , DateTime ip_dat_ngay_bd_hop_tac
                                    , decimal ip_dc_month_birthday)
    {
        Session["Sname"] = ip_str_name;
        Session["Skey"] = ip_str_keyword;
        Session["Sstatus"] = ip_dc_id_trang_thai_giang_vien;
        Session["Sgender"] = ip_str_gender;
        Session["Squanly"] = ip_dc_id_don_vi_quan_ly;
        Session["Sdathoptac"] = ip_dat_ngay_bd_hop_tac;
        Session["Smonth"] = ip_dc_month_birthday;
    }
    private void get_form_search_data_and_load_to_grid()
    {
        try
        {
            // thu thập dữ liệu và chuẩn hóa        
            string v_str_ten_giang_vien = m_txt_ten_giang_vien.Text.Trim();
            v_str_ten_giang_vien = Process_name_search(v_str_ten_giang_vien);

            string v_str_search_key_word = m_txt_tu_khoa_tim_kiem.Text.Trim();
            v_str_search_key_word = Process_name_search(v_str_search_key_word);

            string v_str_gender="";
            if (rdl_gender_check.Items[0].Selected) v_str_gender = "All";
            else if (rdl_gender_check.Items[1].Selected) v_str_gender = "Y";
            else v_str_gender = "N";

            DateTime v_dat_ngay_bd_hop_tac;
            if (m_dat_ngay_bd_hop_tac.SelectedDate != CIPConvert.ToDatetime("01/01/0001"))
                v_dat_ngay_bd_hop_tac = m_dat_ngay_bd_hop_tac.SelectedDate;
            else v_dat_ngay_bd_hop_tac = CIPConvert.ToDatetime("01/01/1900");
            string v_str_month = m_cbo_thang_sn_GV.SelectedValue;
                 
            decimal v_dc_id_trang_thai_giang_vien = CIPConvert.ToDecimal(m_cbo_trang_thai_g_vien.SelectedValue);
            decimal v_dc_id_don_vi_quan_ly= CIPConvert.ToDecimal(m_cbo_don_vi_q_ly.SelectedValue);

            collect_data_2_search(v_str_ten_giang_vien
                                                  , v_str_search_key_word
                                                  , v_str_gender
                                                  , v_dc_id_trang_thai_giang_vien
                                                  , v_dc_id_don_vi_quan_ly
                                                  , v_dat_ngay_bd_hop_tac
                                                  , CIPConvert.ToDecimal(v_str_month));
            // Thực hiện Search

            m_us_dm_giang_vien.search_giang_vien(v_str_ten_giang_vien
                                                ,v_str_search_key_word      
                                                ,v_str_gender   
                                                ,v_dc_id_trang_thai_giang_vien
                                                ,v_dc_id_don_vi_quan_ly
                                                ,m_ds_giang_vien
                                                ,v_dat_ngay_bd_hop_tac
                                                ,CIPConvert.ToDecimal(v_str_month));
            if (m_ds_giang_vien.V_DM_GIANG_VIEN.Rows.Count == 0)
            {
                m_lbl_thong_bao.Text = "Không có bản ghi nào phù hợp";
                if (m_grv_dm_danh_sach_giang_vien.Visible == true) m_grv_dm_danh_sach_giang_vien.Visible = false;
                return;
            }
            m_grv_dm_danh_sach_giang_vien.Visible = true;
            m_grv_dm_danh_sach_giang_vien.DataSource = m_ds_giang_vien.V_DM_GIANG_VIEN;
            m_grv_dm_danh_sach_giang_vien.DataBind();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }
   
    /// <summary>
    /// Xóa các khoảng trắng, chuyển về một dạng chuẩn "Đinh Hồng Lĩnh"
    /// </summary>
    /// <param name="ip_str_name_search"></param>
    /// <returns></returns>
    private string Process_name_search(string ip_str_name_search)
    {
        while (ip_str_name_search.Contains("  "))
        {
            ip_str_name_search = ip_str_name_search.Replace("  ", " ");
        }
        return ip_str_name_search;
    }
    /// <summary>
    /// Search sử dụng session
    /// </summary>
    private void search_using_session()
    {
        try
        {
            m_ds_giang_vien.Clear();
            m_us_dm_giang_vien.search_giang_vien(CIPConvert.ToStr(Session["Sname"])
                                               , CIPConvert.ToStr(Session["Skey"])
                                               , CIPConvert.ToStr(Session["Sgender"])
                                               , CIPConvert.ToDecimal(Session["Sstatus"])
                                               , CIPConvert.ToDecimal(Session["Squanly"])
                                               , m_ds_giang_vien
                                               , CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdathoptac"]))
                                               , CIPConvert.ToDecimal(Session["Smonth"]));
            if (m_ds_giang_vien.V_DM_GIANG_VIEN.Rows.Count == 0)
            {
                m_lbl_thong_bao.Text = "Không có bản ghi nào phù hợp";
                if (m_grv_dm_danh_sach_giang_vien.Visible == true) m_grv_dm_danh_sach_giang_vien.Visible = false;
                return;
            }
            m_grv_dm_danh_sach_giang_vien.Visible = true;
            m_grv_dm_danh_sach_giang_vien.DataSource = m_ds_giang_vien.V_DM_GIANG_VIEN;
            m_grv_dm_danh_sach_giang_vien.DataBind();
        }
        catch (Exception ve)
        {

            throw ve;
        }
    }
    #endregion

    #region Public Interfaces
    public string mapping_gender(string ip_str_gen)
    {
        if (ip_str_gen.Equals("Y"))
            return "Nam";
        return "Nữ";
    }
    public string mapping_hoc_vi(string ip_str_ma_hoc_vi)
    {
        if (ip_str_ma_hoc_vi.Equals("0_HOC_VI_CHUA_BIET")) return "Chưa biết";
        US_CM_DM_TU_DIEN v_us_tu_dien = new US_CM_DM_TU_DIEN("HOC_VI", ip_str_ma_hoc_vi);
        if (v_us_tu_dien.strTEN != "") return v_us_tu_dien.strTEN;
        return "Chưa biết";
    }
    public string mapping_hoc_ham(string ip_str_ma_hoc_ham)
    {
        if (ip_str_ma_hoc_ham.Equals("0_HOC_HAM_CHUA_BIET")) return "Chưa biết";
        US_CM_DM_TU_DIEN v_us_tu_dien = new US_CM_DM_TU_DIEN("HOC_HAM", ip_str_ma_hoc_ham);
        if (v_us_tu_dien.strTEN != "") return v_us_tu_dien.strTEN;
        return "Chưa biết";
    }
    public string mapping_hd(string ip_str_hd_YN)
    {
        if (ip_str_hd_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_cm(string ip_str_cm_YN)
    {
        if (ip_str_cm_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_viet_hl(string ip_str_viet_hl_YN)
    {
        if (ip_str_viet_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_duyet_hl(string ip_str_duyet_hl_YN)
    {
        if (ip_str_duyet_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_tham_dinh_hl(string ip_str_tham_dinh_hl_YN)
    {
        if (ip_str_tham_dinh_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_hdkh(string ip_str_hdkh_YN)
    {
        if (ip_str_hdkh_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    //public string mapping_datetime(string ip_str_datetime)
    //{
    //    if (ip_str_datetime.Equals("") ||CIPConvert.ToStr(ip_str_datetime,"dd/MM/yyyy").Contains("1/1/1900")) return "";
    //    return CIPConvert.ToStr(ip_str_datetime,"dd/MM/yyyy");
    //}
    public string mapping_format_datetime(string ip_str_date)
    {
        if (ip_str_date == "") return "";
        return String.Format(ip_str_date, "dd/MM/yyyy");
    }
    #endregion

    //
    //Events
    //

    protected void m_grv_dm_danh_sach_giang_vien_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            m_grv_dm_danh_sach_giang_vien.PageIndex = e.NewPageIndex;
              search_using_session();
            // get_form_search_data_and_load_to_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void cmd_them_moi_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("/TRMProject/ChucNang/F201_CapNhatThongTinGiangVien.aspx?mode=add");
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    protected void m_grv_dm_danh_sach_giang_vien_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            delete_dm_giang_vien(e.RowIndex);
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_loc_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
            m_grv_dm_danh_sach_giang_vien.PageSize = 30;
            get_form_search_data_and_load_to_grid();            
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
}