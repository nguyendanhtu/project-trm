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


public partial class ChucNang_F602_DuToanHopDongHocLieu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
    private void load_data_2_cbo_trang_thai_thanh_toan()
    {
        m_us_cm_tu_dien.FillDataset(m_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN= " + (int)e_loai_tu_dien.TRANG_THAI_THANH_TOAN);

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
    private void load_data_2_grid(int ip_i_loai_trang_thai_dot_tt)
    {
        US_V_DM_DOT_THANH_TOAN v_us_dm_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN();
        DS_V_DM_DOT_THANH_TOAN v_ds_dm_dot_thanh_toan = new DS_V_DM_DOT_THANH_TOAN();
        string v_str_ma_trang_thai_dot_tt = "";
        v_str_ma_trang_thai_dot_tt = get_ma_trang_thai(ip_i_loai_trang_thai_dot_tt);
        decimal v_dc_id_trang_thai_dot_tt = get_id_trang_thai_dot_tt_by_ma(v_str_ma_trang_thai_dot_tt);
        // Thu thậ dữ liệu để search
        if (v_ds_dm_dot_thanh_toan.V_DM_DOT_THANH_TOAN.Rows.Count == 0)
        {
            m_lbl_thong_bao.Visible = true;
            m_lbl_thong_bao.Text = "Không có đợt thanh toán nào phù hợp";
            m_grv_danh_sach_du_toan.Visible = false;
        }
        else
        {
            m_grv_danh_sach_du_toan.Visible = true;
            m_lbl_thong_bao.Visible = false;
        }

        m_grv_danh_sach_du_toan.DataSource = v_ds_dm_dot_thanh_toan.V_DM_DOT_THANH_TOAN;
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
        m_txt_so_tien_thue.Text = "";
        m_txt_so_tien_thuc_nhan.Text = "";
    }
    private void when_cbo_dot_tt_changed()
    {
        decimal v_dc_id_dot_thanh_toan = CIPConvert.ToDecimal(m_cbo_dot_thanh_toan.SelectedValue);
        US_V_DM_DOT_THANH_TOAN v_us_dot_thanh_toan = new US_V_DM_DOT_THANH_TOAN(v_dc_id_dot_thanh_toan);
        m_dat_ngay_thanh_toan.SelectedDate = v_us_dot_thanh_toan.datNGAY_TT_DU_KIEN;
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
	#endregion


   
}