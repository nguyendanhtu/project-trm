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


public partial class ChucNang_F410_ChinhSuaXacNhanGV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    public string mapping_noi_dung_tt(decimal ip_dc_id_gd_thanh_toan, decimal ip_dc_id_hd_khung)
    {
        string v_str_noi_dung = "";
        // Lấy tên loại hợp đồng
        US_V_DM_HOP_DONG_KHUNG v_us_dm_hd_khung = new US_V_DM_HOP_DONG_KHUNG(ip_dc_id_hd_khung);
        US_V_GD_THANH_TOAN v_us_gd_thanh_toan = new US_V_GD_THANH_TOAN(ip_dc_id_gd_thanh_toan);
        v_str_noi_dung += v_us_dm_hd_khung.strLOAI_HOP_DONG.Trim();
        v_str_noi_dung += " môn ";
        if ((v_us_gd_thanh_toan.strREFERENCE_CODE.Contains("đợt") && v_us_gd_thanh_toan.dcID_MON_HOC == 1) || v_us_gd_thanh_toan.IsREFERENCE_CODENull())
            v_str_noi_dung += v_us_dm_hd_khung.strFIRST_MON;
        else
        {
            US_DM_MON_HOC v_us_dm_mon_hoc = new US_DM_MON_HOC(v_us_gd_thanh_toan.dcID_MON_HOC);
            v_str_noi_dung += v_us_dm_mon_hoc.strTEN_MON_HOC;
        }
        return v_str_noi_dung;
    }
    #endregion

    #region Private Methods
    private void load_data_2_cbo_dot_thanh_toan()
    {
        DS_V_DM_DOT_THANH_TOAN v_ds_dot_thanh_toan = new DS_V_DM_DOT_THANH_TOAN();
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN();
        v_us_dot_thanh_toan.FillDataset(v_ds_dot_thanh_toan);
        m_cbo_dot_thanh_toan.DataTextField = V_DM_DOT_THANH_TOAN.TEN_DOT_TT;
        m_cbo_dot_thanh_toan.DataValueField = V_DM_DOT_THANH_TOAN.ID;
        m_cbo_dot_thanh_toan.DataSource = v_ds_dot_thanh_toan.V_DM_DOT_THANH_TOAN;
        m_cbo_dot_thanh_toan.DataBind();
    }
    private void load_data_2_cbo_trang_thai_thanh_toan_search()
    {
        m_us_cm_tu_dien.FillDataset(m_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN= " + (int)e_loai_tu_dien.TRANG_THAI_THANH_TOAN);

        DataRow v_dr_none = m_ds_cm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
        v_dr_none[CM_DM_TU_DIEN.ID] = "0";
        v_dr_none[CM_DM_TU_DIEN.MA_TU_DIEN] = "ALL";
        v_dr_none[CM_DM_TU_DIEN.TEN] = "Tất cả";
        v_dr_none[CM_DM_TU_DIEN.TEN_NGAN] = "Tất cả";
        v_dr_none[CM_DM_TU_DIEN.ID_LOAI_TU_DIEN] = "0";

        m_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_none, 0);
        m_cbo_trang_thai_tt_search.DataTextField = CM_DM_TU_DIEN.TEN;
        m_cbo_trang_thai_tt_search.DataValueField = CM_DM_TU_DIEN.ID;
        m_cbo_trang_thai_tt_search.DataSource = m_ds_cm_tu_dien.CM_DM_TU_DIEN;
        m_cbo_trang_thai_tt_search.DataBind();
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
            v_us_gd_thanh_toan.FillDataset(v_ds_gd_thanh_toan, " WHERE SO_PHIEU_THANH_TOAN = '" + ip_str_ma_dot_tt + "'");
            if (v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count == 0)
            {
                m_lbl_thong_bao.Visible = true;
                m_lbl_thong_bao.Text = "Chưa có Thanh toán nào ứng với Đợt thanh toán này";
            }
            m_grv_danh_sach_thanh_toan.DataSource = v_ds_gd_thanh_toan.V_GD_THANH_TOAN;
            m_grv_danh_sach_thanh_toan.DataBind();
        }
    }
    private void load_data_2_grid_search_trang_thai(string ip_str_ma_dot_tt, decimal ip_dc_id_trang_thai_tt)
    {
        // Số phiếu thanh toán là mã đợt thanh toán
        if (ip_dc_id_trang_thai_tt == 0)
            load_data_2_grid(ip_str_ma_dot_tt);
        else
        {
            m_us_v_gd_thanh_toan.FillDataset(m_v_ds_gd_thanh_toan, " WHERE SO_PHIEU_THANH_TOAN = '" + ip_str_ma_dot_tt + "' AND ID_TRANG_THAI_THANH_TOAN=" + ip_dc_id_trang_thai_tt);
            if (m_v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count == 0)
            {
                m_lbl_thong_bao.Visible = true;
                m_lbl_thong_bao.Text = "Không có Thanh toán nào phù hợp";
            }
            m_grv_danh_sach_thanh_toan.DataSource = m_v_ds_gd_thanh_toan.V_GD_THANH_TOAN;
            m_grv_danh_sach_thanh_toan.DataBind();
        }
    }
    private decimal get_id_by_so_hop_dong(string ip_str_so_hd)
    {
        US_DM_HOP_DONG_KHUNG v_us_dm_hd_khung = new US_DM_HOP_DONG_KHUNG();
        DS_DM_HOP_DONG_KHUNG v_ds_dm_hd_khung = new DS_DM_HOP_DONG_KHUNG();
        v_us_dm_hd_khung.FillDataset(v_ds_dm_hd_khung, " WHERE SO_HOP_DONG ='" + ip_str_so_hd + "'");
        if (v_ds_dm_hd_khung.DM_HOP_DONG_KHUNG.Rows.Count > 0)
            return CIPConvert.ToDecimal(v_ds_dm_hd_khung.DM_HOP_DONG_KHUNG.Rows[0][DM_HOP_DONG_KHUNG.ID]);
        return 0;
    }
    private void load_data_2_grid_search(string ip_str_ma_dot_tt, string ip_str_so_hd, decimal ip_dc_id_trang_thai_tt)
    {
        US_V_GD_THANH_TOAN v_us_gd_thanh_toan = new US_V_GD_THANH_TOAN();
        DS_V_GD_THANH_TOAN v_ds_gd_thanh_toan = new DS_V_GD_THANH_TOAN();
        decimal v_dc_id_hdong = get_id_by_so_hop_dong(ip_str_so_hd);
        if (v_dc_id_hdong == 0)
        {
            m_lbl_thong_bao.Visible = true;
            m_lbl_thong_bao.Text = "Không có thanh toán nào phù hợp";
            m_grv_danh_sach_thanh_toan.Visible = false;
            return;
        }
        // Nếu ko search theo trạng thái thanh toán
        if (ip_dc_id_trang_thai_tt == 0)
            v_us_gd_thanh_toan.FillDataset(v_ds_gd_thanh_toan, " WHERE SO_PHIEU_THANH_TOAN = '" + ip_str_ma_dot_tt + "' AND ID_HOP_DONG_KHUNG = " + v_dc_id_hdong);
        else
            // Số phiếu thanh toán là mã đợt thanh toán
            v_us_gd_thanh_toan.FillDataset(v_ds_gd_thanh_toan, " WHERE SO_PHIEU_THANH_TOAN = '" + ip_str_ma_dot_tt + "' AND ID_HOP_DONG_KHUNG = " + v_dc_id_hdong + " AND ID_TRANG_THAI_THANH_TOAN = " + ip_dc_id_trang_thai_tt);

        if (v_ds_gd_thanh_toan.V_GD_THANH_TOAN.Rows.Count == 0)
        {
            m_lbl_thong_bao.Visible = true;
            m_lbl_thong_bao.Text = "Không có thanh toán nào phù hợp";
        }
        m_grv_danh_sach_thanh_toan.Visible = true;
        m_grv_danh_sach_thanh_toan.DataSource = v_ds_gd_thanh_toan.V_GD_THANH_TOAN;
        m_grv_danh_sach_thanh_toan.DataBind();
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
    private void when_cbo_dot_tt_changed()
    {
        if (m_cbo_dot_thanh_toan.Items.Count == 0)
            return;
        decimal v_dc_id_dot_thanh_toan = CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue);
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN(v_dc_id_dot_thanh_toan);
        m_lbl_ngay_thanh_toan.Text = CIPConvert.ToStr(v_us_dot_thanh_toan.datNGAY_TT_DU_KIEN, "dd/MM/yyyy");
        m_lbl_dv_thanh_toan.Text = mapping_don_vi_thanh_toan(v_us_dot_thanh_toan.dcID_DON_VI_THANH_TOAN);

        if (m_cbo_trang_thai_tt_search.SelectedIndex == 0)
            load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
        else
            load_data_2_grid_search_trang_thai(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)), CIPConvert.ToDecimal(m_cbo_trang_thai_tt_search.SelectedValue));
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
    private string cut_string_tam_ung(string ip_str_tam_ung)
    {
        string[] v_str_result = ip_str_tam_ung.Split(' ');
        return (v_str_result[2] + " " + v_str_result[3]);
    }
    private void cap_nhat_trang_thai_row_thanh_toan(int ip_i_id_thanh_toan)
    {
        // Lấy được ID thanh tóan
        decimal v_dc_id_thanh_toan = CIPConvert.ToDecimal(m_grv_danh_sach_thanh_toan.DataKeys[ip_i_id_thanh_toan].Value);
        m_us_v_gd_thanh_toan.dcID = v_dc_id_thanh_toan;
        m_us_v_gd_thanh_toan.dcID_TRANG_THAI_THANH_TOAN = get_id_trang_thai_da_xac_nhan_cua_giang_vien();
        // cập nhật GD_THANH_TOAN
        m_us_v_gd_thanh_toan.update_xac_nhan_giang_vien();
        m_lbl_thong_bao.Text = "Đã cập nhật trạng thái thành công";
        // Load lại dữ liệu
        load_data_2_grid(get_ma_dot_tt_by_id_dot(CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue)));
    }
    private decimal get_id_trang_thai_da_duyet()
    {
        US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_tu_dien = new DS_CM_DM_TU_DIEN();
        v_us_cm_tu_dien.FillDataset(v_ds_tu_dien, " WHERE ID_LOAI_TU_DIEN = 15 AND MA_TU_DIEN LIKE N'%DA_DUYET%'");
        // Nếu ko có giá trị phù hợp, ta dùng id_trang_thai hiện tại của cbo_trang_thai_thanh_toan
        if (v_ds_tu_dien.CM_DM_TU_DIEN.Rows.Count == 0)
            return CIPConvert.ToDecimal(m_cbo_trang_thai_tt_search.SelectedValue);
        return CIPConvert.ToDecimal(v_ds_tu_dien.CM_DM_TU_DIEN.Rows[0][CM_DM_TU_DIEN.ID]);
    }
    private decimal get_id_trang_thai_chua_duyet()
    {
        US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_tu_dien = new DS_CM_DM_TU_DIEN();
        v_us_cm_tu_dien.FillDataset(v_ds_tu_dien, " WHERE ID_LOAI_TU_DIEN = 15 AND MA_TU_DIEN LIKE N'%LEN_DU_TOAN%'");
        // Nếu ko có giá trị phù hợp, ta dùng id_trang_thai hiện tại của cbo_trang_thai_thanh_toan
        if (v_ds_tu_dien.CM_DM_TU_DIEN.Rows.Count == 0)
            return CIPConvert.ToDecimal(m_cbo_trang_thai_tt_search.SelectedValue);
        return CIPConvert.ToDecimal(v_ds_tu_dien.CM_DM_TU_DIEN.Rows[0][CM_DM_TU_DIEN.ID]);
    }
    private decimal get_id_trang_thai_da_xac_nhan_cua_giang_vien()
    {
        US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_tu_dien = new DS_CM_DM_TU_DIEN();
        v_us_cm_tu_dien.FillDataset(v_ds_tu_dien, " WHERE ID_LOAI_TU_DIEN = 15 AND MA_TU_DIEN LIKE N'%GIANG_VIEN%'");
        // Nếu ko có giá trị phù hợp, ta dùng id_trang_thai hiện tại của cbo_trang_thai_thanh_toan
        if (v_ds_tu_dien.CM_DM_TU_DIEN.Rows.Count == 0)
            return CIPConvert.ToDecimal(m_cbo_trang_thai_tt_search.SelectedValue);
        return CIPConvert.ToDecimal(v_ds_tu_dien.CM_DM_TU_DIEN.Rows[0][CM_DM_TU_DIEN.ID]);
    }
    #endregion
}