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

public partial class DanhMuc_F500_DotThanhToan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
     {
        if (!IsPostBack)
        {
            load_data_2_cbo_don_vi_tt();
            load_data_2_cbo_trang_thai_dot_tt();
            load_data_2_grid();
        }
    }

    #region Members
    US_CM_DM_TU_DIEN m_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_dm_tu_dien = new DS_CM_DM_TU_DIEN();
    #endregion

    #region Public Interfaces

    #endregion

    #region Private Method
    private void load_data_2_cbo_trang_thai_dot_tt()
    {
        try
        {
            // Đổ dữ liệu vào DS 
            m_us_cm_dm_tu_dien.FillDataset(m_ds_cm_dm_tu_dien, " WHERE ID_LOAI_TU_DIEN = " + (int)e_loai_tu_dien.DOT_THANH_TOAN); // Đây là lấy theo điều kiện

            //TReo dữ liệu vào Dropdownlist loại hợp đồng
            // dây là giá trị hiển thị
            m_cbo_dm_trang_thai_dot_thanh_toan.DataTextField = CM_DM_TU_DIEN.TEN;
            m_cbo_dm_trang_thai_dot_thanh_toan_search.DataTextField = CM_DM_TU_DIEN.TEN;
            // Đây là giá trị thực
            m_cbo_dm_trang_thai_dot_thanh_toan.DataValueField = CM_DM_TU_DIEN.ID;
            m_cbo_dm_trang_thai_dot_thanh_toan_search.DataValueField = CM_DM_TU_DIEN.ID;

            m_cbo_dm_trang_thai_dot_thanh_toan.DataSource = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN;
            m_cbo_dm_trang_thai_dot_thanh_toan.DataBind();

            m_cbo_dm_trang_thai_dot_thanh_toan_search.DataSource = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN;
            m_cbo_dm_trang_thai_dot_thanh_toan_search.DataBind();

        }
        catch (Exception v_e)
        {
            throw v_e;

        }
    }
    private void load_data_2_cbo_don_vi_tt()
    {
        try
        {
            US_DM_DON_VI_THANH_TOAN v_us_dm_don_vi_tt = new US_DM_DON_VI_THANH_TOAN();
            DS_DM_DON_VI_THANH_TOAN v_ds_dm_don_vi_tt = new DS_DM_DON_VI_THANH_TOAN();
            // Đổ dữ liệu vào DS 
            v_us_dm_don_vi_tt.FillDataset(v_ds_dm_don_vi_tt);

            //TReo dữ liệu vào Dropdownlist loại hợp đồng
            // dây là giá trị hiển thị
            m_cbo_dm_loai_don_vi_thanh_toan.DataTextField = DM_DON_VI_THANH_TOAN.TEN_DON_VI;
            m_cbo_dm_loai_don_vi_thanh_toan_search.DataTextField = DM_DON_VI_THANH_TOAN.TEN_DON_VI;
            // Đây là giá trị thực
            m_cbo_dm_loai_don_vi_thanh_toan.DataValueField = DM_DON_VI_THANH_TOAN.ID;
            m_cbo_dm_loai_don_vi_thanh_toan_search.DataValueField = DM_DON_VI_THANH_TOAN.ID;

            m_cbo_dm_loai_don_vi_thanh_toan.DataSource = v_ds_dm_don_vi_tt.DM_DON_VI_THANH_TOAN;
            m_cbo_dm_loai_don_vi_thanh_toan.DataBind();

            m_cbo_dm_loai_don_vi_thanh_toan_search.DataSource = v_ds_dm_don_vi_tt.DM_DON_VI_THANH_TOAN;
            m_cbo_dm_loai_don_vi_thanh_toan_search.DataBind();

        }
        catch (Exception v_e)
        {
            throw v_e;

        }
    }
    private void load_data_2_grid()
    {
        decimal v_dc_id_trang_thai_dot_tt;
        decimal v_dc_id_don_vi_tt;
        v_dc_id_don_vi_tt = CIPConvert.ToDecimal(m_cbo_dm_loai_don_vi_thanh_toan_search.SelectedValue);
        v_dc_id_trang_thai_dot_tt = CIPConvert.ToDecimal(m_cbo_dm_trang_thai_dot_thanh_toan_search.SelectedValue);

        DS_V_DM_DOT_THANH_TOAN v_ds_v_dm_dot_tt = new DS_V_DM_DOT_THANH_TOAN();
        US_V_DM_DOT_THANH_TOAN v_us_v_dm_dot_tt = new US_V_DM_DOT_THANH_TOAN();

        v_us_v_dm_dot_tt.FillDataset(v_ds_v_dm_dot_tt, " WHERE ID_TRANG_THAI_DOT_TT = " + v_dc_id_trang_thai_dot_tt + " AND ID_DON_VI_THANH_TOAN = "+v_dc_id_don_vi_tt);

        if (v_ds_v_dm_dot_tt.V_DM_DOT_THANH_TOAN.Rows.Count == 0)
        {
            m_lbl_thong_bao.Text = "Không có đợt thanh toán nào phù hợp";
            m_lbl_thong_bao.Visible = true;
        }
        else 
        {
            m_lbl_thong_bao.Visible = false;
            m_grv_dm_dot_thanh_toan.DataSource = v_ds_v_dm_dot_tt.V_DM_DOT_THANH_TOAN;
            m_grv_dm_dot_thanh_toan.DataBind();
        }
    }
    #endregion

    #region Events
    protected void m_grv_dm_dot_thanh_toan_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {

        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_dm_dot_thanh_toan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
         try
        {

        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_dm_dot_thanh_toan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
         try
        {

        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_tao_moi_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_cap_nhat_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {

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
            load_data_2_grid();
        }
        catch (Exception v_e)
        {

            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cbo_dm_trang_thai_dot_thanh_toan_search_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            load_data_2_grid();
        }
        catch (Exception v_e)
        {

            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    #endregion
   
}