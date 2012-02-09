﻿using System;
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


public partial class ChucNang_F410_ChinhSuaXacNhanGV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
        {

        disable_controls();
        m_txt_tham_so.Visible = false;
        m_lbl_thong_bao.Text = "";
        m_grv_danh_sach_du_toan.Visible = true;
        if (!IsPostBack)
        {
            lblUser.ToolTip = CIPConvert.ToStr(get_id_trang_thai_da_co_xac_nhan_cua_giang_vien());
            m_lbl_thong_bao0.ToolTip = CIPConvert.ToStr(get_id_trang_thai_chua_co_xac_nhan_cua_giang_vien());
            m_cbo_dot_thanh_toan.Enabled = true;
            load_data_2_cbo_dot_thanh_toan();
            load_data_2_cbo_trang_thai_thanh_toan();
            if (Request.QueryString["id_tt"] == null)
                when_cbo_dot_tt_changed();
            // Cái này nghĩa là có chỉnh sửa thanh toán nhận từ bên ngoài
            else
            {
                decimal v_dc_id_thanh_toan = CIPConvert.ToDecimal(Request.QueryString["id_tt"]);
                US_V_GD_THANH_TOAN v_us_v_gd_thanh_toan = new US_V_GD_THANH_TOAN(v_dc_id_thanh_toan);
                // Nếu là các thanh toán tồn đọng trong KHO
                if (v_us_v_gd_thanh_toan.strSO_PHIEU_THANH_TOAN == "KHO")
                {
                    string v_str_ma_dot_tt = "";
                    cut_description_string(v_us_v_gd_thanh_toan.strDESCRIPTION, ref v_str_ma_dot_tt);
                    m_cbo_dot_thanh_toan.SelectedValue = CIPConvert.ToStr(get_id_dot_tt_by_ma_dot(v_str_ma_dot_tt));
                }
                // Nếu là thanh toán chưa được xác nhận giảng viên trong đợt thanh toán (không phải trong KHO)
                else m_cbo_dot_thanh_toan.SelectedValue = CIPConvert.ToStr(get_id_dot_tt_by_ma_dot(v_us_v_gd_thanh_toan.strSO_PHIEU_THANH_TOAN));
                
                us_obj_2_form(v_us_v_gd_thanh_toan);
                hdf_id_gv.Value = CIPConvert.ToStr(v_dc_id_thanh_toan);
            }
        }
    }           

    #region Members
    US_CM_DM_TU_DIEN m_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
    US_V_GD_THANH_TOAN m_us_v_gd_thanh_toan = new US_V_GD_THANH_TOAN();
    DS_V_GD_THANH_TOAN m_v_ds_gd_thanh_toan = new DS_V_GD_THANH_TOAN();
    //DataEntryFormMode m_init_mode = DataEntryFormMode.ViewDataState;
    #endregion

    #region Public Interfaces
    public string mapping_loai_hd(string ip_str_loai_hd)
    {
        if (ip_str_loai_hd.Equals("HL"))
            return "Học liệu";
        // Còn lại là hợp đồng vận hành
        return "Vận hành";
    }
    public string mapping_don_vi_thanh_toan(decimal ip_dc_id_don_vi_tt)
    {
        US_DM_DON_VI_THANH_TOAN v_us_dm_don_vi_tt = new US_DM_DON_VI_THANH_TOAN(ip_dc_id_don_vi_tt);
        if (!v_us_dm_don_vi_tt.IsIDNull()) return v_us_dm_don_vi_tt.strTEN_DON_VI;
        return "";
    }
    public string mapping_trang_thai_dot_thanh_toan(decimal ip_dc_id_trang_thai_dot_tt)
    {
        US_CM_DM_TU_DIEN v_us_dm_tu_dien = new US_CM_DM_TU_DIEN(ip_dc_id_trang_thai_dot_tt);
        return v_us_dm_tu_dien.strTEN;
    }
    public string mapping_trang_thai_thanh_toan(decimal ip_dc_id_trang_thai_tt)
    {
        US_CM_DM_TU_DIEN v_us_dm_tu_dien = new US_CM_DM_TU_DIEN(ip_dc_id_trang_thai_tt);
        return v_us_dm_tu_dien.strTEN;
    }
    public string get_so_hd_khung_by_id_hd(decimal ip_dc_so_hd)
    {
        DS_V_DM_HOP_DONG_KHUNG v_ds_hd_khung = new DS_V_DM_HOP_DONG_KHUNG();
        US_V_DM_HOP_DONG_KHUNG v_us_hd_khung = new US_V_DM_HOP_DONG_KHUNG();
        v_us_hd_khung.FillDataset(v_ds_hd_khung, " WHERE  ID = " + ip_dc_so_hd);
        if (v_ds_hd_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0) return "";
        return CIPConvert.ToStr(v_ds_hd_khung.V_DM_HOP_DONG_KHUNG.Rows[0][V_DM_HOP_DONG_KHUNG.SO_HOP_DONG]);
    }
    public string get_ma_dot_tt_by_id_dot(decimal ip_dc_ma_dot)
    {
        DS_V_DM_DOT_THANH_TOAN v_ds_dot_tt = new DS_V_DM_DOT_THANH_TOAN();
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN();
        v_us_dot_thanh_toan.FillDataset(v_ds_dot_tt, " WHERE ID = " + ip_dc_ma_dot);
        if (v_ds_dot_tt.V_DM_DOT_THANH_TOAN.Rows.Count == 0) return "";
        return CIPConvert.ToStr(v_ds_dot_tt.V_DM_DOT_THANH_TOAN.Rows[0][V_DM_DOT_THANH_TOAN.MA_DOT_TT]);
    }
    #endregion

    #region Private Methods
    private void load_data_2_cbo_dot_thanh_toan()
    {
        DS_V_DM_DOT_THANH_TOAN v_ds_dot_thanh_toan = new DS_V_DM_DOT_THANH_TOAN();
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN();
        v_us_dot_thanh_toan.FillDataset(v_ds_dot_thanh_toan, " WHERE ID_TRANG_THAI_DOT_TT=" + get_id_trang_thai_da_thanh_toan());
        m_cbo_dot_thanh_toan.DataTextField = V_DM_DOT_THANH_TOAN.TEN_DOT_TT;
        m_cbo_dot_thanh_toan.DataValueField = V_DM_DOT_THANH_TOAN.ID;
        m_cbo_dot_thanh_toan.DataSource = v_ds_dot_thanh_toan.V_DM_DOT_THANH_TOAN;
        m_cbo_dot_thanh_toan.DataBind();
    }
    private void load_data_2_cbo_trang_thai_thanh_toan()
    {
        m_us_cm_tu_dien.FillDataset(m_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN= " + (int)e_loai_tu_dien.TRANG_THAI_THANH_TOAN);

        m_cbo_trang_thai_thanh_toan.DataTextField = CM_DM_TU_DIEN.TEN;
        m_cbo_trang_thai_thanh_toan.DataValueField = CM_DM_TU_DIEN.ID;
        m_cbo_trang_thai_thanh_toan.DataSource = m_ds_cm_tu_dien.CM_DM_TU_DIEN;
        m_cbo_trang_thai_thanh_toan.DataBind();
    }
    private void load_data_2_grid(string ip_str_ma_dot_tt)
    {
        if (ip_str_ma_dot_tt == "")
        {
            m_lbl_thong_bao.Visible = true;
            m_lbl_thong_bao.Text = "Chưa tạo Đợt thanh toán";
            return;
        }
        else
        {
            US_V_GD_THANH_TOAN v_us_gd_thanh_toan = new US_V_GD_THANH_TOAN();
            DS_V_GD_THANH_TOAN v_ds_gd_thanh_toan = new DS_V_GD_THANH_TOAN();
            // Số phiếu thanh toán là mã đợt thanh toán
            v_us_gd_thanh_toan.FillDataset(v_ds_gd_thanh_toan, " WHERE SO_PHIEU_THANH_TOAN = N'" + ip_str_ma_dot_tt + "' AND (ID_TRANG_THAI_THANH_TOAN = " + lblUser.ToolTip + " OR ID_TRANG_THAI_THANH_TOAN = " + m_lbl_thong_bao0.ToolTip + ") ORDER BY ID");
            if (v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count == 0)
            {
                m_lbl_thong_bao.Visible = true;
                m_lbl_thong_bao.Text = "Chưa có Thanh toán nào ứng với Đợt thanh toán này";
            }
            m_grv_danh_sach_du_toan.DataSource = v_ds_gd_thanh_toan.V_GD_THANH_TOAN;
            m_grv_danh_sach_du_toan.DataBind();
            m_lbl_danh_sach_thanh_toan.Text = "Danh sách thanh toán: " + v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count + " thanh toán";
        }
    }
    private decimal get_id_by_so_hop_dong(string ip_str_so_hd)
    {
        US_DM_HOP_DONG_KHUNG v_us_dm_hd_khung = new US_DM_HOP_DONG_KHUNG();
        DS_DM_HOP_DONG_KHUNG v_ds_dm_hd_khung = new DS_DM_HOP_DONG_KHUNG();
        v_us_dm_hd_khung.FillDataset(v_ds_dm_hd_khung, " WHERE SO_HOP_DONG =N'" + ip_str_so_hd + "'");
        if (v_ds_dm_hd_khung.DM_HOP_DONG_KHUNG.Rows.Count > 0)
            return CIPConvert.ToDecimal(v_ds_dm_hd_khung.DM_HOP_DONG_KHUNG.Rows[0][DM_HOP_DONG_KHUNG.ID]);
        return 0;
    }
    private void load_data_2_grid_search(string ip_str_ma_dot_tt, string ip_str_so_hd)
    {
        US_V_GD_THANH_TOAN v_us_gd_thanh_toan = new US_V_GD_THANH_TOAN();
        DS_V_GD_THANH_TOAN v_ds_gd_thanh_toan = new DS_V_GD_THANH_TOAN();
        v_us_gd_thanh_toan.FillDataset(v_ds_gd_thanh_toan, " WHERE SO_PHIEU_THANH_TOAN = '" + ip_str_ma_dot_tt + "' AND SO_HOP_DONG LIKE '%" + ip_str_so_hd + "%' ORDER BY ID");
        if (v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count == 0)
        {
            m_lbl_thong_bao.Visible = true;
            m_lbl_thong_bao.Text = "Không có thanh toán nào phù hợp";
        }
        else
        {
            m_grv_danh_sach_du_toan.Visible = true;
            m_lbl_danh_sach_thanh_toan.Text = "Danh sách thanh toán: " + v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count + " thanh toán";
        }
        m_grv_danh_sach_du_toan.DataSource = v_ds_gd_thanh_toan.V_GD_THANH_TOAN;
        m_grv_danh_sach_du_toan.DataBind();
    }
    private string get_ma_trang_thai_dot_tt_by_id(decimal ip_dc_id_dot_tt)
    {
        US_CM_DM_TU_DIEN v_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN(ip_dc_id_dot_tt);
        return v_us_cm_dm_tu_dien.strMA_TU_DIEN;
    }
    private decimal get_id_trang_thai_dot_tt_by_ma(string ip_str_ma_dot_tt)
    {
        US_CM_DM_TU_DIEN v_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN("DOT_THANH_TOAN", ip_str_ma_dot_tt);
        return v_us_cm_dm_tu_dien.dcID;
    }
    private void reset_controls()
    {
        m_txt_so_hop_dong.Text = "";
        m_txt_so_tien_thanh_toan.Text = "";
        m_txt_so_tien_thue1.Text = "";
        m_txt_so_tien_thuc_nhan.Text = "";
        m_txt_tham_so.Text = "";
        m_txt_mo_ta.Text = "";
        m_txt_gia_tri_nghiem_thu_thuc_te.Text = "";
        m_cbo_trang_thai_thanh_toan.SelectedIndex = 0;
    }
    private void when_cbo_dot_tt_changed()
    {
        if (m_cbo_dot_thanh_toan.Items.Count == 0)
        {
            m_cmd_search.Enabled = false;
            m_lbl_thong_bao0.Text = "Chưa có đợt thanh toán nào";
            return;
        }
        m_cmd_search.Enabled = true;
        decimal v_dc_id_dot_thanh_toan = CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue);
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN(v_dc_id_dot_thanh_toan);
        m_dat_ngay_thanh_toan.SelectedDate = v_us_dot_thanh_toan.datNGAY_TT_DU_KIEN;
        if (m_txt_so_hd_search.Text.Trim() == "")
            load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
        else
            load_data_2_grid_search(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)), m_txt_so_hd_search.Text.Trim());
    }
    private decimal get_id_dot_tt_by_ma_dot(string ip_str_ma_dot)
    {
        DS_V_DM_DOT_THANH_TOAN v_ds_dot_tt = new DS_V_DM_DOT_THANH_TOAN();
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN();
        v_us_dot_thanh_toan.FillDataset(v_ds_dot_tt, " WHERE MA_DOT_TT = '" + ip_str_ma_dot + "'");
        if (v_ds_dot_tt.V_DM_DOT_THANH_TOAN.Rows.Count == 0) return 0;
        return CIPConvert.ToDecimal(v_ds_dot_tt.V_DM_DOT_THANH_TOAN.Rows[0][V_DM_DOT_THANH_TOAN.ID]);
    }
    private decimal get_id_hd_khung_by_so_hd(string ip_str_so_hd)
    {
        DS_V_DM_HOP_DONG_KHUNG v_ds_hd_khung = new DS_V_DM_HOP_DONG_KHUNG();
        US_V_DM_HOP_DONG_KHUNG v_us_hd_khung = new US_V_DM_HOP_DONG_KHUNG();
        v_us_hd_khung.FillDataset(v_ds_hd_khung, " WHERE  SO_HOP_DONG = N'" + ip_str_so_hd + "'");
        if (v_ds_hd_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0) return 0;
        return CIPConvert.ToDecimal(v_ds_hd_khung.V_DM_HOP_DONG_KHUNG.Rows[0][V_DM_HOP_DONG_KHUNG.ID]);
    }
    private string cut_string_tam_ung(string ip_str_tam_ung)
    {
        string[] v_str_result = ip_str_tam_ung.Split(' ');
        return (v_str_result[2] + " " + v_str_result[3]);
    }
    private string cut_description_string(string ip_str_description, ref string ip_str_old_ma_dot_tt)
    {
        string[] v_des = ip_str_description.Split(' ');
        string v_str_result = "";
        for (int v_i = 0; v_i < v_des.Length - 1; v_i++)
        {
            v_str_result += v_des[v_i];
            v_str_result += " ";
        }
        ip_str_old_ma_dot_tt = v_des[v_des.Length - 1];
        return v_str_result.Trim();
    }
    private void us_obj_2_form(US_V_GD_THANH_TOAN ip_us_gd_thanh_toan)
    {
        m_txt_tham_so.Visible = true;
        if (Request.QueryString["id_tt"] == null)
           m_cbo_dot_thanh_toan.SelectedValue = CIPConvert.ToStr(get_id_dot_tt_by_ma_dot(ip_us_gd_thanh_toan.strSO_PHIEU_THANH_TOAN));
        m_txt_so_hop_dong.Text = get_so_hd_khung_by_id_hd(ip_us_gd_thanh_toan.dcID_HOP_DONG_KHUNG);
        if (ip_us_gd_thanh_toan.strLOAI_HOP_DONG.Equals("VH"))
        {
            m_lbl_tham_so.Text = "Mã lớp";
            m_txt_tham_so.Text = ip_us_gd_thanh_toan.strREFERENCE_CODE;
        }
        else
        {
            m_lbl_tham_so.Text = "Nội dung thanh toán";
            if (!ip_us_gd_thanh_toan.IsREFERENCE_CODENull())
            {
                m_txt_tham_so.Text = "Tạm ứng " + ip_us_gd_thanh_toan.strREFERENCE_CODE;
            }
            else
            {
                m_txt_tham_so.Text = "Thanh lý hợp đồng";
                m_txt_gia_tri_nghiem_thu_thuc_te.Text = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcGIA_TRI_NGHIEM_THU_THUC_TE, "#,###");
            }
        }
        m_dat_ngay_thanh_toan.SelectedDate = ip_us_gd_thanh_toan.datNGAY_THANH_TOAN;
        m_txt_so_tien_thanh_toan.Text = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcTONG_TIEN_THANH_TOAN, "#,###");
        m_txt_so_tien_thuc_nhan.Text = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcTONG_TIEN_THUC_NHAN, "#,###");
        m_txt_so_tien_thue1.Text = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcSO_TIEN_THUE, "#,###");
        if (Request.QueryString["id_tt"] != null)
            m_cbo_trang_thai_thanh_toan.SelectedValue = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcID_TRANG_THAI_THANH_TOAN);
        else
            m_cbo_trang_thai_thanh_toan.SelectedValue = CIPConvert.ToStr(get_id_trang_thai_chua_co_xac_nhan_cua_giang_vien());
        // Lưu lại id_trang_thai_thanh_toan_cuc
        hdf_id_trang_thai_thanh_toan_cu.Value = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcID_TRANG_THAI_THANH_TOAN);
        m_txt_mo_ta.Text = ip_us_gd_thanh_toan.strDESCRIPTION;
    }
    private void form_2_us_obj(US_V_GD_THANH_TOAN op_us_gd_thanh_toan)
    {
        op_us_gd_thanh_toan.strSO_PHIEU_THANH_TOAN = get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue));
        op_us_gd_thanh_toan.dcID_HOP_DONG_KHUNG = get_id_hd_khung_by_so_hd(m_txt_so_hop_dong.Text.Trim());
        if (m_txt_tham_so.Text.Contains("Tạm ứng"))
            op_us_gd_thanh_toan.strREFERENCE_CODE = cut_string_tam_ung(m_txt_tham_so.Text.Trim());
        else if (m_lbl_tham_so.Text.Contains("Mã lớp")) op_us_gd_thanh_toan.strREFERENCE_CODE = m_txt_tham_so.Text;
        else op_us_gd_thanh_toan.SetREFERENCE_CODENull();
        op_us_gd_thanh_toan.dcID_TRANG_THAI_THANH_TOAN = CIPConvert.ToDecimal(m_cbo_trang_thai_thanh_toan.SelectedValue);
        //op_us_gd_thanh_toan.dcTONG_TIEN_THANH_TOAN = CIPConvert.ToDecimal(m_txt_so_tien_thanh_toan.Text);
    }
    private void load_data_2_us_by_id_and_show_on_form(int ip_i_thanh_toan_selected)
    {
        try
        {
            decimal v_dc_id_thanh_toan = CIPConvert.ToDecimal(m_grv_danh_sach_du_toan.DataKeys[ip_i_thanh_toan_selected].Value);
            hdf_id_gv.Value = CIPConvert.ToStr(v_dc_id_thanh_toan);
            US_V_GD_THANH_TOAN v_us_gd_thanh_toan = new US_V_GD_THANH_TOAN(v_dc_id_thanh_toan);
            m_cbo_dot_thanh_toan.Enabled = false;
            // Load data to form 
            us_obj_2_form(v_us_gd_thanh_toan);
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }   
    private decimal get_id_trang_thai_da_thanh_toan()
    {
        US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_tu_dien = new DS_CM_DM_TU_DIEN();
        v_us_cm_tu_dien.FillDataset(v_ds_tu_dien, " WHERE ID_LOAI_TU_DIEN = 14 AND MA_TU_DIEN LIKE N'%DA_THANH_TOAN%'");
        if (v_ds_tu_dien.CM_DM_TU_DIEN.Rows.Count == 0) return 505;
        return CIPConvert.ToDecimal(v_ds_tu_dien.CM_DM_TU_DIEN.Rows[0][CM_DM_TU_DIEN.ID]);
    }
    private decimal get_id_trang_thai_chua_co_xac_nhan_cua_giang_vien()
    {
        US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_tu_dien = new DS_CM_DM_TU_DIEN();
        v_us_cm_tu_dien.FillDataset(v_ds_tu_dien, " WHERE ID_LOAI_TU_DIEN = 15 AND MA_TU_DIEN LIKE N'%CHUA_CO_XAC_NHAN_CUA_GIANG_VIEN%'");
        if (v_ds_tu_dien.CM_DM_TU_DIEN.Rows.Count == 0) return 517;
        return CIPConvert.ToDecimal(v_ds_tu_dien.CM_DM_TU_DIEN.Rows[0][CM_DM_TU_DIEN.ID]);
    }
    private decimal get_id_trang_thai_da_co_xac_nhan_cua_giang_vien()
    {
        US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_tu_dien = new DS_CM_DM_TU_DIEN();
        v_us_cm_tu_dien.FillDataset(v_ds_tu_dien, " WHERE ID_LOAI_TU_DIEN = 15 AND MA_TU_DIEN LIKE N'%DA_CO_XAC_NHAN_CUA_GIANG_VIEN%'");
        if (v_ds_tu_dien.CM_DM_TU_DIEN.Rows.Count == 0) return 519;
        return CIPConvert.ToDecimal(v_ds_tu_dien.CM_DM_TU_DIEN.Rows[0][CM_DM_TU_DIEN.ID]);
    }
    private string get_ma_trang_thai_thanh_toan_by_id(decimal ip_dc_id_tt)
    {
        US_CM_DM_TU_DIEN v_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN(ip_dc_id_tt);
        return v_us_cm_dm_tu_dien.strMA_TU_DIEN;
    }
    private void disable_controls()
    {
        m_dat_ngay_thanh_toan.Enabled = false;
        m_txt_mo_ta.Enabled = false;
        m_txt_so_hop_dong.Enabled = false;
        m_txt_gia_tri_nghiem_thu_thuc_te.Enabled = false;
        m_txt_so_tien_thuc_nhan.Enabled = false;
        m_txt_so_tien_thanh_toan.Enabled = false;
        m_txt_so_tien_thue1.Enabled = false;
    }
    #endregion
    
    #region Events
    protected void m_grv_danh_sach_du_toan_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            load_data_2_us_by_id_and_show_on_form(e.NewSelectedIndex);
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cbo_dot_thanh_toan_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            when_cbo_dot_tt_changed();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_cap_nhat_du_toan_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdf_id_gv.Value == "")
            {
                string someScript;
                someScript = "<script language='javascript'>alert('Bạn phải chọn chứng từ cần chỉnh sửa');</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onedit", someScript);
                return;
            }
            form_2_us_obj(m_us_v_gd_thanh_toan);
            m_us_v_gd_thanh_toan.dcID = CIPConvert.ToDecimal(hdf_id_gv.Value);
            if (Request.QueryString["id_tt"] == null)
            {
                // Nếu đây là update thông tin bảng kê, kiểm tra trạng thái mới có phù hợp không?
                if (hdf_id_trang_thai_thanh_toan_cu.Value != "")
                {
                    CValidatePaymentStates v_cvalidate_state = new CValidatePaymentStates();
                    v_cvalidate_state.Trang_thai_thanh_toan_hien_tai = get_ma_trang_thai_thanh_toan_by_id(CIPConvert.ToDecimal(hdf_id_trang_thai_thanh_toan_cu.Value));
                    v_cvalidate_state.set_trang_thai();
                    if (!v_cvalidate_state.check_chuyen_trang_thai(get_ma_trang_thai_thanh_toan_by_id(m_us_v_gd_thanh_toan.dcID_TRANG_THAI_THANH_TOAN)))
                    {
                        string someScript;
                        someScript = "<script language='javascript'>alert('Không chuyển từ trạng thái ban đầu của thanh toán về trạng thái này được!');</script>";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload1", someScript);
                        return;
                    }
                }
                m_us_v_gd_thanh_toan.update_xac_nhan_giang_vien();
                if (m_txt_so_hd_search.Text == "")
                    load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
                else
                    load_data_2_grid_search(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)), m_txt_so_hd_search.Text.Trim());
            }
            // Cái này là làm ở popup
                // Cho phép chuyển tử trạng thái chưa có xác nhận của ngân hàng sang trạng thái đã có xác nhận của giảng viên
            else m_us_v_gd_thanh_toan.xu_ly_xac_nhan_ngan_hang();
            m_cmd_cap_nhat_du_toan.Enabled = true;
            m_cbo_dot_thanh_toan.Enabled = true;
            if (m_cbo_trang_thai_thanh_toan.SelectedValue.Equals(hdf_id_trang_thai_thanh_toan_cu.Value))
            {
                if (Request.QueryString["id_tt"] != null)
                {

                    string returnMessage = @"<script language='javascript'>{
                                                var mes= 'Trạng thái của chứng từ vẫn không thanh đổi';
                                                alert(mes);
                                                window.close(); }</script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "onreturn", returnMessage);
                }
                else
                    m_lbl_thong_bao.Text = "Trạng thái của chứng từ vẫn không thanh đổi";
            }

            else
            {
                if (Request.QueryString["id_tt"] != null)
                {
                    string returnMessage = @"<script language='javascript'>{
                                                var mes= 'Chỉnh sửa trạng thái thanh toán thành công !';
                                                alert(mes);
                                                window.close(); }</script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "onreturnMes", returnMessage);
                }
                else m_lbl_thong_bao.Text = "Chỉnh sửa trạng thái thanh toán thành công !";
            }
            reset_controls();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_bo_qua_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("/TRMProject/ChucNang/F410_ChinhSuaXacNhanGV.aspx", false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_xoa_trang_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("/TRMProject/Default.aspx", false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_search_Click(object sender, EventArgs e)
    {
        try
        {
            if (m_txt_so_hd_search.Text.Trim() == "")
                load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
            else
                load_data_2_grid_search(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)), m_txt_so_hd_search.Text.Trim());
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_danh_sach_du_toan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            m_grv_danh_sach_du_toan.PageIndex = e.NewPageIndex;
            if (m_txt_so_hd_search.Text.Trim() == "")
                load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
            else
                load_data_2_grid_search(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)), m_txt_so_hd_search.Text.Trim());
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    #endregion   
}