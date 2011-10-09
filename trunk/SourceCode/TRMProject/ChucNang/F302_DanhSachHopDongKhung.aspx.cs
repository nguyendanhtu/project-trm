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

public partial class ChucNang_F302_DanhSachHopDongKhung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            try
            {
                m_lbl_thong_bao.Text = "";
                if (!IsPostBack)
                {
                    if (Session["Snamekhung"] != null)
                    {
                        session_2_form();
                        search_using_session();
                    }
                    load_2_cbo_don_vi_quan_ly();
                    load_data_2_loai_hop_dong();
                    load_data_2_trang_thai_hop_dong();

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
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    #region Members
    US_V_DM_HOP_DONG_KHUNG m_us_dm_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG();
    DS_V_DM_HOP_DONG_KHUNG m_ds_hop_dong_khung = new DS_V_DM_HOP_DONG_KHUNG();

    US_CM_DM_TU_DIEN m_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_dm_tu_dien = new DS_CM_DM_TU_DIEN();

    US_V_DM_GIANG_VIEN m_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
    DS_V_DM_GIANG_VIEN m_ds_dm_giang_vien = new DS_V_DM_GIANG_VIEN();

    DataEntryFormMode m_init_mode = DataEntryFormMode.ViewDataState;
    #endregion

    #region Public Interfaces
    public string mapping_hl(string ip_str_hl_YN)
    {
        if (ip_str_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_vh(string ip_str_vh_YN)
    {
        if (ip_str_vh_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_cs(string ip_str_cs_YN)
    {
        if (ip_str_cs_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    #endregion

    #region Private Methods
    private void load_data_2_grid()
    {
        try
        {
            // Đổ dữ liệu từ US vào DS
            m_us_dm_hop_dong_khung.FillDataset(m_ds_hop_dong_khung);

            // Treo dữ liệu lên lưới
            m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;
            m_grv_dm_danh_sach_hop_dong_khung.DataBind();
        }
        catch (Exception v_e)
        {
            //nhớ using Ip.Common
            CSystemLog_301.ExceptionHandle(this, v_e);

        }
    }
    private void load_2_cbo_don_vi_quan_ly()
    {
        try
        {
            DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
            //v_ds_cm_tu_dien.Clear();
            //DataRow v_dr_all_dv_quan_ly = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
          
            ////add item Tat Ca          
            //v_dr_all_dv_quan_ly[CM_DM_TU_DIEN.ID] = 0;
            //v_dr_all_dv_quan_ly[CM_DM_TU_DIEN.TEN] = "Tất cả";

            //v_ds_cm_tu_dien.EnforceConstraints = false;
            //v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_all_dv_quan_ly, 0);

            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "
                                                + (int)e_loai_tu_dien.DON_VI_QUAN_LY_CHINH); // Đây là lấy theo điều kiện
            m_cbo_don_vi_quan_ly_search.Items.Add(new ListItem("Tất cả", "0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_don_vi_quan_ly_search.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }
          
            //for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            //{
            //    m_cbo_don_vi_q_ly.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            //}
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
    private void load_data_2_loai_hop_dong()
    {
        try
        {
             DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
            //v_ds_cm_tu_dien.Clear();
            //DataRow v_dr_all_loai_hdong = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
          
            ////add item Tat Ca          
            //v_dr_all_loai_hdong[CM_DM_TU_DIEN.ID] = 0;
            //v_dr_all_loai_hdong[CM_DM_TU_DIEN.TEN] = "Tất cả";

            //v_ds_cm_tu_dien.EnforceConstraints = false;
            //v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_all_loai_hdong, 0);

            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "
                                                + (int)e_loai_tu_dien.LOAI_HOP_DONG); // Đây là lấy theo điều kiện
            m_cbo_loai_hop_dong_search.Items.Add(new ListItem("Tất cả", "0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_loai_hop_dong_search.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }

            //m_cbo_loai_hop_dong_search.DataValueField = CM_DM_TU_DIEN.ID;
            //m_cbo_loai_hop_dong_search.DataTextField = CM_DM_TU_DIEN.TEN;

            //m_cbo_loai_hop_dong_search.DataSource = v_ds_cm_tu_dien.CM_DM_TU_DIEN;
            //m_cbo_loai_hop_dong_search.DataBind();
        }
        catch (Exception v_e)
        {
            
            throw v_e;
        }
    }
    private void delete_dm_hd_khung(int ip_i_row_del)
    {
        try
        {
            decimal v_dc_id_id_hd_khung = CIPConvert.ToDecimal(m_grv_dm_danh_sach_hop_dong_khung.DataKeys[ip_i_row_del].Value);
            m_us_dm_hop_dong_khung.dcID = v_dc_id_id_hd_khung;
            m_us_dm_hop_dong_khung.DeleteByID(v_dc_id_id_hd_khung);
            m_lbl_thong_bao.Text = "Xóa bản ghi thành công";
            get_form_search_data_and_load_to_grid();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }
    private void load_data_2_trang_thai_hop_dong()
    {
        try
        {
            DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
            //v_ds_cm_tu_dien.Clear();
            //DataRow v_dr_all_trang_thai_hdong = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();

            ////add item Tat Ca          
            //v_dr_all_trang_thai_hdong[CM_DM_TU_DIEN.ID] = 0;
            //v_dr_all_trang_thai_hdong[CM_DM_TU_DIEN.TEN] = "Tất cả";

            //v_ds_cm_tu_dien.EnforceConstraints = false;
            //v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_all_trang_thai_hdong, 0);

            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "
                                                + (int)e_loai_tu_dien.TRANG_THAI_HOP_DONG_KHUNG); // Đây là lấy theo điều kiện
            m_cbo_trang_thai_hop_dong_search.Items.Add(new ListItem("Tất cả", "0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_trang_thai_hop_dong_search.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }
            //m_cbo_trang_thai_hop_dong_search.DataValueField = CM_DM_TU_DIEN.ID;
            //m_cbo_trang_thai_hop_dong_search.DataTextField = CM_DM_TU_DIEN.TEN;

            //m_cbo_trang_thai_hop_dong_search.DataSource = v_ds_cm_tu_dien.CM_DM_TU_DIEN;
            //m_cbo_trang_thai_hop_dong_search.DataBind();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }

    private void session_2_form()
    {
        m_txt_ten_giang_vien.Text = CIPConvert.ToStr(Session["Snamekhung"]);
        m_txt_so_hd.Text = CIPConvert.ToStr(Session["Ssohdkhung"]);
        m_txt_tu_khoa_tim_kiem.Text = CIPConvert.ToStr(Session["Skeykhung"]);
        m_txt_ma_PO_quan_ly.Text = CIPConvert.ToStr(Session["Spokhung"]);

        m_cbo_loai_hop_dong_search.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Sloaihdkhung"]));
        m_cbo_don_vi_quan_ly_search.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Squanlykhung"]));
        if (CIPConvert.ToStr(Session["Sdatngaykykhung"]) != "")
            m_dat_ngay_ki.SelectedDate = CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatngaykykhung"]), "dd/MM/yyyy");
        if (CIPConvert.ToStr(Session["Sdathieuluckhung"]) != "")
            m_dat_ngay_hieu_luc.SelectedDate = CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdathieuluckhung"]), "dd/MM/yyyy");
        m_cbo_trang_thai_hop_dong_search.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Strangthaihdkhung"]));
    }

    private void collect_data_2_search(string ip_str_name, string ip_str_keyword
                                  , string ip_str_so_hd
                                  , decimal ip_dc_id_loai_hd
                                  , decimal ip_dc_id_trang_thai_hd
                                  , decimal ip_dc_don_vi_quan_ly
                                  , DateTime ip_dat_ngay_ky
                                  , DateTime ip_dat_ngay_hieu_luc
                                  , string ip_str_ma_po_quan_ly)
    {
        Session["Snamekhung"] = ip_str_name;
        Session["Skeykhung"] = ip_str_keyword;
        Session["Ssohdkhung"] = ip_str_so_hd;
        Session["Sloaihdkhung"] = ip_dc_id_loai_hd;
        Session["Squanlykhung"] = ip_dc_don_vi_quan_ly;
        Session["Strangthaihdkhung"] = ip_dc_id_trang_thai_hd;
        Session["Sdatngaykykhung"] = ip_dat_ngay_ky;
        Session["Sdathieuluckhung"] = ip_dat_ngay_hieu_luc;
        Session["Spokhung"] = ip_str_ma_po_quan_ly;
    }

    #region Public Interfaces
    public string get_ma_gv_form_id(decimal ip_dc_id)
    {
        try
        {
            US_V_DM_GIANG_VIEN v_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
            DS_V_DM_GIANG_VIEN v_ds_dm_gv = new DS_V_DM_GIANG_VIEN();

            v_us_dm_giang_vien.FillDataset(v_ds_dm_gv," WHERE ID="+ip_dc_id);
            return v_ds_dm_gv.V_DM_GIANG_VIEN.Rows[0][V_DM_GIANG_VIEN.MA_GIANG_VIEN].ToString();
        }
        catch (Exception v_e)
        {
            
            throw v_e;
        }
        
    }
    #endregion
    private void get_form_search_data_and_load_to_grid()
    {

        try
        {

            // thu thập dữ liệu

            string v_str_ten_giang_vien = m_txt_ten_giang_vien.Text.Trim();
            v_str_ten_giang_vien = Process_name_search(v_str_ten_giang_vien);

            string v_str_search_key_word = m_txt_tu_khoa_tim_kiem.Text.Trim();
            v_str_search_key_word = Process_name_search(v_str_search_key_word);

            decimal v_dc_id_loai_hop_dong = CIPConvert.ToDecimal(m_cbo_loai_hop_dong_search.SelectedValue);

            decimal v_dc_trang_thai_hop_dong = CIPConvert.ToDecimal(m_cbo_trang_thai_hop_dong_search.SelectedValue);

            decimal v_dc_don_vi_quan_li = CIPConvert.ToDecimal(m_cbo_don_vi_quan_ly_search.SelectedValue);
            string v_str_ma_po_quan_ly = m_txt_ma_PO_quan_ly.Text.Trim();
            string v_str_so_hop_dong = m_txt_so_hd.Text.Trim();
            DateTime v_dat_ngay_ki;
            if(m_dat_ngay_ki.Text !="" )
              v_dat_ngay_ki = m_dat_ngay_ki.SelectedDate;
            else v_dat_ngay_ki = CIPConvert.ToDatetime("01/01/1900");
            DateTime v_dat_ngay_hieu_luc;
            if (m_dat_ngay_hieu_luc.Text != "")
                v_dat_ngay_hieu_luc = m_dat_ngay_hieu_luc.SelectedDate;
            else v_dat_ngay_hieu_luc = CIPConvert.ToDatetime("01/01/1900");
            collect_data_2_search(v_str_ten_giang_vien
                                                        , v_str_search_key_word
                                                        , v_str_so_hop_dong
                                                        , v_dc_id_loai_hop_dong
                                                        , v_dc_trang_thai_hop_dong
                                                        , v_dc_don_vi_quan_li
                                                        , v_dat_ngay_ki
                                                        , v_dat_ngay_hieu_luc
                                                        , v_str_ma_po_quan_ly);

            // Search

            m_us_dm_hop_dong_khung.search_hop_dong_khung( v_str_ten_giang_vien
                                                        , v_str_search_key_word
                                                        , v_str_so_hop_dong
                                                        , v_dc_id_loai_hop_dong                                                        
                                                        , v_dc_trang_thai_hop_dong
                                                        , v_dc_don_vi_quan_li
                                                        , v_dat_ngay_ki
                                                        , v_dat_ngay_hieu_luc
                                                        , v_str_ma_po_quan_ly
                                                        , m_ds_hop_dong_khung);
            if (m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0)
            {
                m_lbl_thong_bao.Text = "Không có bản ghi nào phù hợp";
                if (m_grv_dm_danh_sach_hop_dong_khung.Visible == true) m_grv_dm_danh_sach_hop_dong_khung.Visible = false;
                return;
            }
            m_grv_dm_danh_sach_hop_dong_khung.Visible = true;
            m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;

            m_grv_dm_danh_sach_hop_dong_khung.DataBind();
            m_lbl_loc_du_lieu.Text = "Kết quả lọc dữ liệu: " + m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count + " bản ghi";

        }

        catch (Exception v_e)
        {
            throw v_e;

        }

    }
    /// <summary>
    /// Search sử dụng session
    /// </summary>
    private void search_using_session()
    {
        try
        {
            m_ds_hop_dong_khung.Clear();
            m_us_dm_hop_dong_khung.search_hop_dong_khung(CIPConvert.ToStr(Session["Snamekhung"])
                                               , CIPConvert.ToStr(Session["Skeykhung"])
                                               , CIPConvert.ToStr(Session["Ssohdkhung"])
                                               , CIPConvert.ToDecimal(Session["Sloaihdkhung"])
                                               , CIPConvert.ToDecimal(Session["Strangthaihdkhung"])
                                               , CIPConvert.ToDecimal(Session["Squanlykhung"])
                                               , CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatngaykykhung"]))
                                               ,  CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatngaykykhung"]))
                                               , CIPConvert.ToStr(Session["Spokhung"])
                                               , m_ds_hop_dong_khung);
            if (m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0)
            {
                m_lbl_thong_bao.Text = "Không có bản ghi nào phù hợp";
                if (m_grv_dm_danh_sach_hop_dong_khung.Visible == true) m_grv_dm_danh_sach_hop_dong_khung.Visible = false;
                return;
            }
            m_grv_dm_danh_sach_hop_dong_khung.Visible = true;
            m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;
            m_grv_dm_danh_sach_hop_dong_khung.DataBind();
            m_lbl_loc_du_lieu.Text = "Kết quả lọc dữ liệu: " + m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count + " bản ghi";
        }
        catch (Exception ve)
        {

            throw ve;
        }
    }
    #endregion
    protected void cmd_them_moi_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("/TRMProject/ChucNang/F301_GdHopDongKhung.aspx?mode=add", false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
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
            m_grv_dm_danh_sach_hop_dong_khung.PageSize = 50;
           get_form_search_data_and_load_to_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_dm_danh_sach_hop_dong_khung_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            delete_dm_hd_khung(e.RowIndex);
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_dm_danh_sach_hop_dong_khung_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            m_grv_dm_danh_sach_hop_dong_khung.PageIndex = e.NewPageIndex;
            get_form_search_data_and_load_to_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
}