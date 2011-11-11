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

public partial class ChucNang_F402_DanhSachHopDongDuToan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Madot"] != null)
            {
                string m_str_ma_dot = CIPConvert.ToStr(Request.QueryString["Madot"]);
                fill_data_2_thong_tin_dot_tt(m_str_ma_dot);
                load_2_cbo_don_vi_quan_ly();
                load_data_2_loai_hop_dong();
                load_data_2_trang_thai_hop_dong();
                if (Session["Snamekhungtt"] != null)
                {
                    session_2_form();
                    search_using_session();
                }
            }
        }
    }

    #region Members
    US_V_DM_HOP_DONG_KHUNG m_us_dm_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG();
    DS_V_DM_HOP_DONG_KHUNG m_ds_hop_dong_khung = new DS_V_DM_HOP_DONG_KHUNG();

    US_CM_DM_TU_DIEN m_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_dm_tu_dien = new DS_CM_DM_TU_DIEN();

    US_V_DM_GIANG_VIEN m_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
    DS_V_DM_GIANG_VIEN m_ds_dm_giang_vien = new DS_V_DM_GIANG_VIEN();
    public string m_str_ma_dot;
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
    public string get_ma_gv_form_id(decimal ip_dc_id)
    {
        try
        {
            US_V_DM_GIANG_VIEN v_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
            DS_V_DM_GIANG_VIEN v_ds_dm_gv = new DS_V_DM_GIANG_VIEN();

            v_us_dm_giang_vien.FillDataset(v_ds_dm_gv, " WHERE ID=" + ip_dc_id);
            return v_ds_dm_gv.V_DM_GIANG_VIEN.Rows[0][V_DM_GIANG_VIEN.MA_GIANG_VIEN].ToString();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }
    #endregion

    #region Private Methods
    private decimal get_id_dot_tt_by_ma_dot(string ip_str_ma_dot)
    {
        DS_V_DM_DOT_THANH_TOAN v_ds_dot_tt= new DS_V_DM_DOT_THANH_TOAN();
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN();
        v_us_dot_thanh_toan.FillDataset(v_ds_dot_tt, " WHERE MA_DOT_TT = '"+ip_str_ma_dot+"'");
        if (v_ds_dot_tt.V_DM_DOT_THANH_TOAN.Rows.Count == 0) return 0;
        return CIPConvert.ToDecimal(v_ds_dot_tt.V_DM_DOT_THANH_TOAN.Rows[0][V_DM_DOT_THANH_TOAN.ID]);
    }

    // Thông tin đợt thanh toán
    private void fill_data_2_thong_tin_dot_tt(string ip_str_ma_dot)
    {
        if (get_id_dot_tt_by_ma_dot(ip_str_ma_dot) == 0)
        {
            string someScript;
            someScript = "<script language='javascript'>alert('Không có đợt thanh toán phù hợp');</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", someScript);
            return;
        }
        US_V_DM_DOT_THANH_TOAN v_us_dm_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN(get_id_dot_tt_by_ma_dot(ip_str_ma_dot));
        m_lbl_don_vi_thanh_toan.Text = v_us_dm_dot_thanh_toan.strDON_VI_THANH_TOAN;
        m_lbl_ma_dot_thanh_toan.Text = v_us_dm_dot_thanh_toan.strMA_DOT_TT;
        m_lbl_ngay_tt_du_kien.Text = CIPConvert.ToStr(v_us_dm_dot_thanh_toan.datNGAY_TT_DU_KIEN,"dd/MM/yyyy");
        m_lbl_ten_dot_thanh_toan.Text = v_us_dm_dot_thanh_toan.strTEN_DOT_TT;
        m_lbl_trang_thai_dot_tt.Text = v_us_dm_dot_thanh_toan.strTRANG_THAI_DOT_TT;
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
    private void session_2_form()
    {
        m_txt_ten_giang_vien.Text = CIPConvert.ToStr(Session["Snamekhungtt"]);
        m_txt_so_hd.Text = CIPConvert.ToStr(Session["Ssohdkhungtt"]);
        m_txt_tu_khoa_tim_kiem.Text = CIPConvert.ToStr(Session["Skeykhungtt"]);
        m_txt_ma_PO_quan_ly.Text = CIPConvert.ToStr(Session["Spokhungtt"]);

        m_cbo_loai_hop_dong_search.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Sloaihdkhungtt"]));
        m_cbo_don_vi_quan_ly_search.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Squanlykhungtt"]));
        if (CIPConvert.ToStr(Session["Sdatngaykykhungtt"]) != "" && CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatngaykykhungtt"]), "dd/MM/yyyy") != CIPConvert.ToDatetime("01/01/1900", "dd/MM/yyyy"))
            m_dat_ngay_ki.SelectedDate = CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatngaykykhungtt"]), "dd/MM/yyyy");
        if (CIPConvert.ToStr(Session["Sdathieuluckhungtt"]) != "" && CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdathieuluckhungtt"]), "dd/MM/yyyy") != CIPConvert.ToDatetime("01/01/1900", "dd/MM/yyyy"))
            m_dat_ngay_hieu_luc.SelectedDate = CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdathieuluckhungtt"]), "dd/MM/yyyy");
        if (CIPConvert.ToStr(Session["Sdatketthuctt"]) != "" && CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatketthuctt"]), "dd/MM/yyyy") != CIPConvert.ToDatetime("01/01/1900", "dd/MM/yyyy"))
            m_dat_date_ket_thuc.SelectedDate = CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatketthuctt"]), "dd/MM/yyyy");
        m_cbo_trang_thai_hop_dong_search.SelectedValue = CIPConvert.ToStr(CIPConvert.ToDecimal(Session["Strangthaihdkhungtt"]));
    }

    private void collect_data_2_search(string ip_str_name, string ip_str_keyword
                                  , string ip_str_so_hd
                                  , decimal ip_dc_id_loai_hd
                                  , decimal ip_dc_id_trang_thai_hd
                                  , decimal ip_dc_don_vi_quan_ly
                                  , DateTime ip_dat_ngay_ky
                                  , DateTime ip_dat_ngay_hieu_luc
                                  , DateTime ip_dat_ngay_ket_thuc
                                  , string ip_str_ma_po_quan_ly)
    {
        Session["Snamekhungtt"] = ip_str_name;
        Session["Skeykhungtt"] = ip_str_keyword;
        Session["Ssohdkhungtt"] = ip_str_so_hd;
        Session["Sloaihdkhungtt"] = ip_dc_id_loai_hd;
        Session["Squanlykhungtt"] = ip_dc_don_vi_quan_ly;
        Session["Strangthaihdkhungtt"] = ip_dc_id_trang_thai_hd;
        Session["Sdatngaykykhungtt"] = ip_dat_ngay_ky;
        Session["Sdathieuluckhungtt"] = ip_dat_ngay_hieu_luc;
        Session["Spokhungtt"] = ip_str_ma_po_quan_ly;
        Session["Sdatketthuctt"] = ip_dat_ngay_ket_thuc;
    }
    private void clear_session()
    {
        Session["Snamekhungtt"] = "";
        Session["Skeykhungtt"] = "";
        Session["Ssohdkhungtt"] = "";
        Session["Sloaihdkhungtt"] = "";
        Session["Squanlykhungtt"] = "";
        Session["Strangthaihdkhungtt"] = "";
        Session["Sdatngaykykhungtt"] = "";
        Session["Sdathieuluckhungtt"] = "";
        Session["Spokhungtt"] = "";
        Session["Sdatketthuctt"] = "";
    }

    private void get_form_search_data_and_load_to_grid()
    {

        try
        {
            System.Globalization.CultureInfo enUS = new System.Globalization.CultureInfo("en-US");
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
            // Nếu ngày ký đúng định dạng
            if (DateTime.TryParseExact(CIPConvert.ToStr(m_dat_ngay_ki.SelectedDate), "dd/MM/yyyy", enUS, System.Globalization.DateTimeStyles.None, out v_dat_ngay_ki))
            {
                if (m_dat_ngay_ki.SelectedDate != CIPConvert.ToDatetime("01/01/0001"))
                    v_dat_ngay_ki = m_dat_ngay_ki.SelectedDate;
                else v_dat_ngay_ki = CIPConvert.ToDatetime("01/01/1900");
            }
            DateTime v_dat_ngay_hieu_luc;
            if (DateTime.TryParseExact(CIPConvert.ToStr(m_dat_ngay_hieu_luc.SelectedDate), "dd/MM/yyyy", enUS, System.Globalization.DateTimeStyles.None, out v_dat_ngay_hieu_luc))
            {
                if (m_dat_ngay_hieu_luc.SelectedDate != CIPConvert.ToDatetime("01/01/0001"))
                    v_dat_ngay_hieu_luc = m_dat_ngay_hieu_luc.SelectedDate;
                else v_dat_ngay_hieu_luc = CIPConvert.ToDatetime("01/01/1900");
            }


            DateTime v_dat_ngay_ket_thuc;
            if (DateTime.TryParseExact(CIPConvert.ToStr(m_dat_date_ket_thuc.SelectedDate), "dd/MM/yyyy", enUS, System.Globalization.DateTimeStyles.None, out v_dat_ngay_ket_thuc))
            {
                if (m_dat_date_ket_thuc.SelectedDate != CIPConvert.ToDatetime("01/01/0001"))
                    v_dat_ngay_ket_thuc = m_dat_date_ket_thuc.SelectedDate;
                else v_dat_ngay_ket_thuc = CIPConvert.ToDatetime("01/01/1900");
            }


            collect_data_2_search(v_str_ten_giang_vien
                                                        , v_str_search_key_word
                                                        , v_str_so_hop_dong
                                                        , v_dc_id_loai_hop_dong
                                                        , v_dc_trang_thai_hop_dong
                                                        , v_dc_don_vi_quan_li
                                                        , v_dat_ngay_ki
                                                        , v_dat_ngay_hieu_luc
                                                        , v_dat_ngay_ket_thuc
                                                        , v_str_ma_po_quan_ly);

            // Search

            m_us_dm_hop_dong_khung.search_hop_dong_khung(v_str_ten_giang_vien
                                                        , v_str_search_key_word
                                                        , v_str_so_hop_dong
                                                        , v_dc_id_loai_hop_dong
                                                        , v_dc_trang_thai_hop_dong
                                                        , v_dc_don_vi_quan_li
                                                        , v_dat_ngay_ki
                                                        , v_dat_ngay_hieu_luc
                                                        , v_dat_ngay_ket_thuc
                                                        , v_str_ma_po_quan_ly
                                                        , m_ds_hop_dong_khung);
            m_lbl_loc_du_lieu.Text = "Danh sách Hợp đồng cần lập dự toán: " + m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count + " hợp đồng";
            if (m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0)
            {
                m_lbl_thong_bao.Text = "Không có bản ghi nào phù hợp";
                if (m_grv_dm_danh_sach_hop_dong_khung.Visible == true) m_grv_dm_danh_sach_hop_dong_khung.Visible = false;
                return;
            }
            m_lbl_thong_bao.Visible = false;
            m_grv_dm_danh_sach_hop_dong_khung.Visible = true;
            m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;

            m_grv_dm_danh_sach_hop_dong_khung.DataBind();
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
            m_us_dm_hop_dong_khung.search_hop_dong_khung(CIPConvert.ToStr(Session["Snamekhungtt"])
                                               , CIPConvert.ToStr(Session["Skeykhungtt"])
                                               , CIPConvert.ToStr(Session["Ssohdkhungtt"])
                                               , CIPConvert.ToDecimal(Session["Sloaihdkhungtt"])
                                               , CIPConvert.ToDecimal(Session["Strangthaihdkhungtt"])
                                               , CIPConvert.ToDecimal(Session["Squanlykhungtt"])
                                               , CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatngaykykhungtt"]))
                                               , CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdathieuluckhungtt"]))
                                               , CIPConvert.ToDatetime(CIPConvert.ToStr(Session["Sdatketthuctt"]))
                                               , CIPConvert.ToStr(Session["Spokhungtt"])
                                               , m_ds_hop_dong_khung);
            m_lbl_loc_du_lieu.Text = "Kết quả lọc dữ liệu: " + m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count + " bản ghi";
            if (m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0)
            {
                m_lbl_thong_bao.Text = "Không có bản ghi nào phù hợp";
                if (m_grv_dm_danh_sach_hop_dong_khung.Visible == true) m_grv_dm_danh_sach_hop_dong_khung.Visible = false;
                return;
            }
            m_grv_dm_danh_sach_hop_dong_khung.Visible = true;
            m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;
            m_grv_dm_danh_sach_hop_dong_khung.DataBind();
        }
        catch (Exception ve)
        {

            throw ve;
        }
    }

    private string convert_2_str(object ip_o_obj)
    {
        if (ip_o_obj == DBNull.Value)
            return "";
        return CIPConvert.ToStr(ip_o_obj);
    }
    private string convert_so_tien_2_str(object ip_o_obj)
    {
        if (ip_o_obj == DBNull.Value)
            return "";
        return CIPConvert.ToStr(ip_o_obj, "0");
    }
    private string convert_datetime_2_str(object ip_o_obj)
    {
        if (ip_o_obj == DBNull.Value)
            return "";
        return CIPConvert.ToStr(ip_o_obj, "dd/MM/yyyy");
    }
    public string mapping_YN(string ip_str_YN)
    {
        if (ip_str_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    #endregion

    #region Events
    protected void m_cmd_loc_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
            get_form_search_data_and_load_to_grid();
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
    #endregion
   
}