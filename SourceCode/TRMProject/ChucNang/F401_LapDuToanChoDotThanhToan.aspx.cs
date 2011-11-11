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

public partial class ChucNang_F401_LapDuToanChoDotThanhToan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_data_2_cbo_don_vi_thanh_toan();
            load_data_2_cbo_trang_thai_dot_thanh_toan();
            load_data_2_grid(int.Parse(CIPConvert.ToStr(Request.QueryString["id_trang_thai_dot_tt"])));
            m_cbo_trang_thai_dot_thanh_toan_search.SelectedValue =get_id_trang_thai_dot_tt_by_ma(get_ma_trang_thai(int.Parse(Request.QueryString["id_trang_thai_dot_tt"]))).ToString();
            m_cbo_trang_thai_dot_thanh_toan_search.Enabled = false;
        }
    }

    #region Members
    US_CM_DM_TU_DIEN m_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
    #endregion

    #region Public Interfaces
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
                v_str_return =string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Chỉnh sửa dự toán</a>",ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CHUYEN_KE_TOAN:
                v_str_return =string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Duyệt lại dự toán</a>",ip_str_ma_dot_tt);
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
        string v_str_ma_dot = get_ma_trang_thai_dot_tt_by_id(ip_dc_id_trang_thai_dot_thanh_toan);
        string v_str_return="";
        switch (v_str_ma_dot)
        {
            case TRANG_THAI_DOT_TT.DA_LAP_DOT:
                v_str_return = string.Format("<a href='F402_DanhSachHopDongDuToan.aspx?Madot={0}'>Lập dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_LEN_DU_TOAN:
                v_str_return = string.Format("<a href='F403_PheDuyetDuToan.aspx?Madot={0}'>Duyệt dự toán</a>", ip_str_ma_dot_tt);
                break;
            case TRANG_THAI_DOT_TT.DA_CHUYEN_KE_TOAN:
                v_str_return =string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Lên danh sách dự toán</a>",ip_str_ma_dot_tt); 
                break;
            case TRANG_THAI_DOT_TT.DA_CHUYEN_NGAN_HANG:
                v_str_return =string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Xác nhận ngân hàng</a>",ip_str_ma_dot_tt); 
                break;
            case TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_NGAN_HANG:
                v_str_return =string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Xác nhận giảng viên</a>",ip_str_ma_dot_tt); 
                break;
            case TRANG_THAI_DOT_TT.DA_CO_XAC_NHAN_CUA_GIANG_VIEN:
                v_str_return =string.Format("<a href='F402_PheDuyetDuToan.aspx?Madot={0}'>Đóng đợt thanh toán</a>",ip_str_ma_dot_tt);
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
    #endregion

    #region Private Methods
    private void load_data_2_cbo_trang_thai_dot_thanh_toan()
    {
        m_ds_cm_tu_dien.Clear();
        m_us_cm_tu_dien.FillDataset(m_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "+ (int)e_loai_tu_dien.DOT_THANH_TOAN);
        DataRow v_dr_none = m_ds_cm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
        v_dr_none[CM_DM_TU_DIEN.ID] = "0";
        v_dr_none[CM_DM_TU_DIEN.TEN] = "Tất cả";
        v_dr_none[CM_DM_TU_DIEN.TEN_NGAN] = "All";
        v_dr_none[CM_DM_TU_DIEN.MA_TU_DIEN] = "All";
        v_dr_none[CM_DM_TU_DIEN.ID_LOAI_TU_DIEN] = "14";
        m_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_none, 0);

        m_cbo_trang_thai_dot_thanh_toan_search.DataValueField = CM_DM_TU_DIEN.ID;
        m_cbo_trang_thai_dot_thanh_toan_search.DataTextField = CM_DM_TU_DIEN.TEN;
        m_cbo_trang_thai_dot_thanh_toan_search.DataSource = m_ds_cm_tu_dien.CM_DM_TU_DIEN;
        m_cbo_trang_thai_dot_thanh_toan_search.DataBind();
    }
    private void load_data_2_cbo_don_vi_thanh_toan()
    {
        DS_DM_DON_VI_THANH_TOAN v_ds_dv_thanh_toan = new DS_DM_DON_VI_THANH_TOAN();
        US_DM_DON_VI_THANH_TOAN v_us_dv_thanh_toan = new US_DM_DON_VI_THANH_TOAN();
        v_us_dv_thanh_toan.FillDataset(v_ds_dv_thanh_toan);

        DataRow v_dr_none = v_ds_dv_thanh_toan.DM_DON_VI_THANH_TOAN.NewDM_DON_VI_THANH_TOANRow();
        v_dr_none[DM_DON_VI_THANH_TOAN.ID] = "0";
        v_dr_none[DM_DON_VI_THANH_TOAN.TEN_DON_VI] = "Tất cả";
        v_dr_none[DM_DON_VI_THANH_TOAN.MA_DON_VI] = "All";
        v_ds_dv_thanh_toan.DM_DON_VI_THANH_TOAN.Rows.InsertAt(v_dr_none, 0);

        m_cbo_dm_loai_don_vi_thanh_toan_search.DataValueField = DM_DON_VI_THANH_TOAN.ID;
        m_cbo_dm_loai_don_vi_thanh_toan_search.DataTextField = DM_DON_VI_THANH_TOAN.TEN_DON_VI;
        m_cbo_dm_loai_don_vi_thanh_toan_search.DataSource = v_ds_dv_thanh_toan.DM_DON_VI_THANH_TOAN;
        m_cbo_dm_loai_don_vi_thanh_toan_search.DataBind();
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
    private void load_data_2_grid(int ip_i_loai_trang_thai_dot_tt)
    {
        US_V_DM_DOT_THANH_TOAN v_us_dm_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN();
        DS_V_DM_DOT_THANH_TOAN v_ds_dm_dot_thanh_toan = new DS_V_DM_DOT_THANH_TOAN();
        string v_str_ma_trang_thai_dot_tt = "";
        v_str_ma_trang_thai_dot_tt = get_ma_trang_thai(ip_i_loai_trang_thai_dot_tt);
        decimal v_dc_id_trang_thai_dot_tt = get_id_trang_thai_dot_tt_by_ma(v_str_ma_trang_thai_dot_tt);
        // Thu thậ dữ liệu để search
        string v_str_ma_dot_tt = m_txt_ma_dot_thanh_toan_search.Text.Trim();
       // decimal v_dc_id_trang_thai_dot_tt = CIPConvert.ToDecimal(m_cbo_trang_thai_dot_thanh_toan_search.SelectedValue);
        decimal v_dc_id_don_vi_tt = CIPConvert.ToDecimal(m_cbo_dm_loai_don_vi_thanh_toan_search.SelectedValue);
        v_us_dm_dot_thanh_toan.search_dot_tt(v_str_ma_dot_tt, v_dc_id_don_vi_tt, v_dc_id_trang_thai_dot_tt, v_ds_dm_dot_thanh_toan);
        if (v_ds_dm_dot_thanh_toan.V_DM_DOT_THANH_TOAN.Rows.Count == 0)
        {
            m_lbl_thong_bao.Visible = true;
            m_lbl_thong_bao.Text = "Không có đợt thanh toán nào phù hợp";
            m_grv_dm_dot_thanh_toan.Visible = false;
        }
        else
        {
            m_grv_dm_dot_thanh_toan.Visible = true;
            m_lbl_thong_bao.Visible = false;
        }

        m_grv_dm_dot_thanh_toan.DataSource = v_ds_dm_dot_thanh_toan.V_DM_DOT_THANH_TOAN;
        m_grv_dm_dot_thanh_toan.DataBind();
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
    #endregion

    #region Events

    #endregion
    protected void m_grv_dm_dot_thanh_toan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            m_grv_dm_dot_thanh_toan.PageIndex = e.NewPageIndex;
            load_data_2_grid(int.Parse(Request.QueryString["id_trang_thai_dot_tt"]));
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cbo_dm_loai_don_vi_thanh_toan_search_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            load_data_2_grid(int.Parse(Request.QueryString["id_trang_thai_dot_tt"]));
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this,v_e);
        }
    }
    protected void m_cbo_trang_thai_dot_thanh_toan_search_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            load_data_2_grid(int.Parse(Request.QueryString["id_trang_thai_dot_tt"]));
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
            load_data_2_grid(int.Parse(Request.QueryString["id_trang_thai_dot_tt"]));
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
}