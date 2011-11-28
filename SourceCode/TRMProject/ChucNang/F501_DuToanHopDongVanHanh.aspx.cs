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

public partial class ChucNang_F501_DuToanHopDongVanHanh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        m_lbl_thong_bao.Text = "";
        if (!IsPostBack)
        {
            load_data_2_cbo_dot_thanh_toan();
            load_data_2_cbo_trang_thai_thanh_toan();
            when_cbo_dot_tt_changed();
        }
        m_cmd_check_so_hd.Attributes.Add("onclick", "openPopUp()");
    }

    #region Members
    US_CM_DM_TU_DIEN m_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
    US_V_GD_THANH_TOAN m_us_v_gd_thanh_toan = new US_V_GD_THANH_TOAN();
    DS_V_GD_THANH_TOAN m_v_ds_gd_thanh_toan = new DS_V_GD_THANH_TOAN();
    DataEntryFormMode m_init_mode = DataEntryFormMode.ViewDataState;
    #endregion

    #region Public Interfaces
    // Cái này cho phép cập nhật lại các bước trước nếu như cảm thấy lỗi
    public string mapping_ho_tro_with_trang_thai_dot_tt(decimal ip_dc_id_trang_thai_dot_thanh_toan, string ip_str_ma_dot_tt)
    {
        string v_str_ma_dot = get_ma_trang_thai_dot_tt_by_id(ip_dc_id_trang_thai_dot_thanh_toan);
        string v_str_return = "";
        switch (v_str_ma_dot)
        {
            case TRANG_THAI_DOT_TT.DA_LAP_DOT:
                v_str_return = "";
                break;
            case TRANG_THAI_DOT_TT.DA_LEN_DU_TOAN:
                v_str_return = string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Chỉnh sửa dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CHUYEN_KE_TOAN:
                v_str_return = string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Duyệt lại dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CHUYEN_NGAN_HANG:
                v_str_return = string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Lập lại DS dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_NGAN_HANG:
                v_str_return = "";
                break;
            case TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_GIANG_VIEN:
                v_str_return = "";
                break;
            case TRANG_THAI_DOT_TT.DA_KET_THUC:
                v_str_return = "";
                break;
        }
        return v_str_return;
    }
    public string mapping_action_with_trang_thai_dot_tt(decimal ip_dc_id_trang_thai_dot_thanh_toan, string ip_str_ma_dot_tt)
    {
        string v_str_ma_trang_thai_dot_tt = get_ma_trang_thai_dot_tt_by_id(ip_dc_id_trang_thai_dot_thanh_toan);
        string v_str_return = "";
        switch (v_str_ma_trang_thai_dot_tt)
        {
            case TRANG_THAI_DOT_TT.DA_LAP_DOT:
                v_str_return = string.Format("<a href='F402_DanhSachHopDongDuToan.aspx?Madot={0}'>Lập dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_LEN_DU_TOAN:
                // Chuyển sang bước duyệt dự toán, duyệt theo từng hợp đồng
                v_str_return = string.Format("<a href='F403_PheDuyetDuToan.aspx?Madot={0}'>Duyệt dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CHUYEN_KE_TOAN:
                //// Chuyển sang bước lên danh sách dự toán
                v_str_return = string.Format("<a href='F404_XuatDanhSachDuToan.aspx?Madot={0}'>Lên danh sách dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CHUYEN_NGAN_HANG:
                // Chuyển sang bước xác nhận ngân hàng(từng ngân hàng)
                v_str_return = string.Format("<a href='F405_XacNhanNganHang.aspx?Madot={0}'>Xác nhận ngân hàng</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_NGAN_HANG:
                // Chuyển sang bước xác nhận giảng viên (từng giảng viên)
                v_str_return = string.Format("<a href='F406_XacNhanGiangVien.aspx?Madot={0}'>Xác nhận giảng viên</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_GIANG_VIEN:
                // Đóng đợt thanh toán thì vào DM_DOT_THANH_TOAN chỉnh sửa trạng thái của đợt thanh toán
                v_str_return = string.Format("<a href='F500_DotThanhToan.aspx?Madot={0}'>Đóng đợt thanh toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_KET_THUC:
                v_str_return = "Đã kết thúc";
                break;
        }
        return v_str_return;
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
        v_us_dot_thanh_toan.FillDataset(v_ds_dot_thanh_toan, " WHERE ID_TRANG_THAI_DOT_TT != "+get_id_trang_thai_dot_tt_da_ket_thuc());
        m_cbo_dot_thanh_toan.DataTextField = V_DM_DOT_THANH_TOAN.TEN_DOT_TT;
        m_cbo_dot_thanh_toan.DataValueField = V_DM_DOT_THANH_TOAN.ID;
        m_cbo_dot_thanh_toan.DataSource = v_ds_dot_thanh_toan.V_DM_DOT_THANH_TOAN;
        m_cbo_dot_thanh_toan.DataBind();
    }
    private void load_data_2_cbo_trang_thai_thanh_toan()
    {
        m_us_cm_tu_dien.FillDataset(m_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN= "+ (int)e_loai_tu_dien.TRANG_THAI_THANH_TOAN);

        m_cbo_trang_thai_thanh_toan.DataTextField = CM_DM_TU_DIEN.TEN;
        m_cbo_trang_thai_thanh_toan.DataValueField = CM_DM_TU_DIEN.ID;
        m_cbo_trang_thai_thanh_toan.DataSource = m_ds_cm_tu_dien.CM_DM_TU_DIEN;
        m_cbo_trang_thai_thanh_toan.DataBind();
    }
    private string get_ma_trang_thai(int ip_i_ma_from_query_str)
    {
        string v_str_ma_trang_thai_dot_tt = "";
        switch (ip_i_ma_from_query_str)
        {
            case 1:
                v_str_ma_trang_thai_dot_tt = TRANG_THAI_DOT_TT.DA_LAP_DOT;
                break;
            case 2:
                v_str_ma_trang_thai_dot_tt = TRANG_THAI_DOT_TT.DA_LEN_DU_TOAN;
                break;
            case 3:
                v_str_ma_trang_thai_dot_tt = TRANG_THAI_DOT_TT.DA_CHUYEN_KE_TOAN;  // Đây nghĩa la đã duyệt dự toán
                break;
            case 4:
                v_str_ma_trang_thai_dot_tt = TRANG_THAI_DOT_TT.DA_CHUYEN_NGAN_HANG;
                break;
            case 5:
                v_str_ma_trang_thai_dot_tt = TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_NGAN_HANG;
                break;
            case 6:
                v_str_ma_trang_thai_dot_tt = TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_GIANG_VIEN; //Cái này chuyển trạng thái sang kết thúc đợt thanh toán
                break;
        }
        return v_str_ma_trang_thai_dot_tt;
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
            v_us_gd_thanh_toan.FillDataset(v_ds_gd_thanh_toan, " WHERE SO_PHIEU_THANH_TOAN = '" + ip_str_ma_dot_tt + "' AND LOAI_HOP_DONG= 'VH'");
            if (v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count == 0)
            {
                m_lbl_thong_bao.Visible = true;
                m_lbl_thong_bao.Text = "Chưa có Thanh toán nào ứng với Đợt thanh toán này";
            }
            m_grv_danh_sach_du_toan.DataSource = v_ds_gd_thanh_toan.V_GD_THANH_TOAN;
            m_grv_danh_sach_du_toan.DataBind();
        }
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
        m_txt_ma_lop_mon.Text = "";
        m_txt_mo_ta.Text = "";
    }
    private void when_cbo_dot_tt_changed()
    {
        if (m_cbo_dot_thanh_toan.Items.Count == 0)
            return;        
        decimal v_dc_id_dot_thanh_toan = CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue);
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN(v_dc_id_dot_thanh_toan);
        m_dat_ngay_thanh_toan.SelectedDate = v_us_dot_thanh_toan.datNGAY_TT_DU_KIEN;
        load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
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
        v_us_hd_khung.FillDataset(v_ds_hd_khung, " WHERE  SO_HOP_DONG = '" + ip_str_so_hd + "'");
        if (v_ds_hd_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0) return 0;
        return CIPConvert.ToDecimal(v_ds_hd_khung.V_DM_HOP_DONG_KHUNG.Rows[0][V_DM_HOP_DONG_KHUNG.ID]);
    }    
    private void us_obj_2_form(US_V_GD_THANH_TOAN ip_us_gd_thanh_toan)
    {
        m_cbo_dot_thanh_toan.SelectedValue =CIPConvert.ToStr(get_id_dot_tt_by_ma_dot(ip_us_gd_thanh_toan.strSO_PHIEU_THANH_TOAN));
        m_txt_so_hop_dong.Text = get_so_hd_khung_by_id_hd(ip_us_gd_thanh_toan.dcID_HOP_DONG_KHUNG);
        m_txt_ma_lop_mon.Text = ip_us_gd_thanh_toan.strREFERENCE_CODE;
        m_dat_ngay_thanh_toan.SelectedDate = ip_us_gd_thanh_toan.datNGAY_THANH_TOAN;
        m_txt_so_tien_thanh_toan.Text =CIPConvert.ToStr(ip_us_gd_thanh_toan.dcTONG_TIEN_THANH_TOAN,"#,###");
        m_txt_so_tien_thuc_nhan.Text = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcTONG_TIEN_THUC_NHAN,"#,###");
        m_txt_so_tien_thue1.Text = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcSO_TIEN_THUE,"#,###");
        m_cbo_trang_thai_thanh_toan.SelectedValue = CIPConvert.ToStr(ip_us_gd_thanh_toan.dcID_TRANG_THAI_THANH_TOAN);
        m_txt_mo_ta.Text = ip_us_gd_thanh_toan.strDESCRIPTION;
    }
    private void form_2_us_obj(US_V_GD_THANH_TOAN op_us_gd_thanh_toan)
    {
        op_us_gd_thanh_toan.strSO_PHIEU_THANH_TOAN =get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue));
        op_us_gd_thanh_toan.dcID_HOP_DONG_KHUNG =get_id_hd_khung_by_so_hd(m_txt_so_hop_dong.Text.Trim());
        op_us_gd_thanh_toan.strREFERENCE_CODE = m_txt_ma_lop_mon.Text.Trim();
        op_us_gd_thanh_toan.datNGAY_THANH_TOAN = m_dat_ngay_thanh_toan.SelectedDate;
        op_us_gd_thanh_toan.dcTONG_TIEN_THANH_TOAN =CIPConvert.ToDecimal(m_txt_so_tien_thanh_toan.Text);
        op_us_gd_thanh_toan.dcTONG_TIEN_THUC_NHAN =CIPConvert.ToDecimal(m_txt_so_tien_thuc_nhan.Text);
        op_us_gd_thanh_toan.dcSO_TIEN_THUE = CIPConvert.ToDecimal(m_txt_so_tien_thue1.Text);
        op_us_gd_thanh_toan.dcID_TRANG_THAI_THANH_TOAN =CIPConvert.ToDecimal(m_cbo_trang_thai_thanh_toan.SelectedValue);
        op_us_gd_thanh_toan.strDESCRIPTION = m_txt_mo_ta.Text.Trim();
    }
    private void load_data_2_us_by_id_and_show_on_form(int ip_i_thanh_toan_selected)
    {
        try
        {
            decimal v_dc_id_thanh_toan = CIPConvert.ToDecimal(m_grv_danh_sach_du_toan.DataKeys[ip_i_thanh_toan_selected].Value);
            hdf_id_gv.Value = CIPConvert.ToStr(v_dc_id_thanh_toan);
            US_V_GD_THANH_TOAN v_us_gd_thanh_toan = new US_V_GD_THANH_TOAN(v_dc_id_thanh_toan);

            // Load data to form 
            us_obj_2_form(v_us_gd_thanh_toan);
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }
    private void delete_row_thanh_toan(int ip_i_id_thanh_toan)
    {
        // Lấy được ID thanh tóan
        decimal v_dc_id_thanh_toan = CIPConvert.ToDecimal(m_grv_danh_sach_du_toan.DataKeys[ip_i_id_thanh_toan].Value);
        m_us_v_gd_thanh_toan.dcID = v_dc_id_thanh_toan;
        // Xóa GD_THANH_TOAN
        m_us_v_gd_thanh_toan.DeleteByID(v_dc_id_thanh_toan);
        m_lbl_thong_bao.Text = "Xóa bản ghi thành công";
        // Load lại dữ liệu
        load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
    }
    private decimal get_id_trang_thai_dot_tt_da_ket_thuc()
    {
        US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_tu_dien = new DS_CM_DM_TU_DIEN();
        v_us_cm_tu_dien.FillDataset(v_ds_tu_dien, " WHERE ID_LOAI_TU_DIEN = 14 AND MA_TU_DIEN LIKE N'%DA_KET_THUC%'");
        return CIPConvert.ToDecimal(v_ds_tu_dien.CM_DM_TU_DIEN.Rows[0][CM_DM_TU_DIEN.ID]);
    }
    #endregion

    #region Events
    protected void m_cmd_check_so_hd_Click(object sender, EventArgs e)
    {
        try
        {
          
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
            form_2_us_obj(m_us_v_gd_thanh_toan);
            m_us_v_gd_thanh_toan.Insert();
            load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
            reset_controls();
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
                someScript = "<script language='javascript'>alert('Bạn phải chọn thanh toán cần Cập nhật');</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", someScript);
                //m_lbl_mess.Text = "";
                return;
            }
            form_2_us_obj(m_us_v_gd_thanh_toan);
            m_us_v_gd_thanh_toan.dcID = CIPConvert.ToDecimal(hdf_id_gv.Value);
            m_us_v_gd_thanh_toan.Update();
            m_lbl_thong_bao.Visible = true;
            m_lbl_thong_bao.Text = "Cập nhật bản ghi thành công";            
            reset_controls();
            m_cmd_luu_du_lieu.Enabled = true;
            load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
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
            reset_controls();
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
    protected void m_grv_danh_sach_du_toan_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            m_init_mode = DataEntryFormMode.UpdateDataState;
            m_cmd_luu_du_lieu.Enabled = false;
            m_cmd_cap_nhat_du_toan.Enabled = true;
            load_data_2_us_by_id_and_show_on_form(e.NewSelectedIndex);
        }
        catch (Exception V_e)
        {
            CSystemLog_301.ExceptionHandle(this, V_e);
        }
    }
    protected void m_grv_danh_sach_du_toan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            m_lbl_thong_bao.Text = "";
            delete_row_thanh_toan(e.RowIndex);
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    #endregion   
}