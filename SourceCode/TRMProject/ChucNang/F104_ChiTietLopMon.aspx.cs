using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IP.Core.IPCommon;
using WebDS;
using WebDS.CDBNames;
using WebUS;
public partial class ChucNang_F104_ChiTietLopMon : System.Web.UI.Page
{
    #region Public Interface
    public string get_mapping_so_hop_dong_khung(decimal i_dc_id_hop_dong_khung) {
        try
        {
            US_DM_HOP_DONG_KHUNG v_us_dm_hop_dong_khung = new US_DM_HOP_DONG_KHUNG(i_dc_id_hop_dong_khung);
            if (v_us_dm_hop_dong_khung.IsSO_HOP_DONGNull()) return "";
            return v_us_dm_hop_dong_khung.strSO_HOP_DONG;
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    public string get_mapping_ten_noi_dung_thanh_toan(decimal i_dc_id_noi_dung_thanh_toan)
    {
        try
        {
        US_DM_NOI_DUNG_THANH_TOAN v_us_dm_noi_dung_thanh_toan = new US_DM_NOI_DUNG_THANH_TOAN(i_dc_id_noi_dung_thanh_toan);
        if (v_us_dm_noi_dung_thanh_toan.IsTEN_NOI_DUNGNull()) return "";
        return v_us_dm_noi_dung_thanh_toan.strTEN_NOI_DUNG;
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    public string get_mapping_da_thanh_toan_yn(string i_str_yn)
    {
        try
        {
            return i_str_yn == "Y" ? "Có" : "Không";
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    #endregion

    #region Data Structures

    #endregion

    #region Members
    US_GD_LOP_MON_DETAIL m_us_gd_lop_mon_detail = new US_GD_LOP_MON_DETAIL();
    DS_GD_LOP_MON_DETAIL m_ds_gd_lop_mon_detail = new DS_GD_LOP_MON_DETAIL();
    #endregion

    #region Private Methods
    private void load_2_cbo_hop_dong_khung()
    {
        US_DM_HOP_DONG_KHUNG v_us = new US_DM_HOP_DONG_KHUNG();
        DS_DM_HOP_DONG_KHUNG v_ds = new DS_DM_HOP_DONG_KHUNG();
        try
        {
            v_us.FillDataset(v_ds);

            m_cbo_dm_hop_dong_khung.DataSource = v_ds.DM_HOP_DONG_KHUNG;
            m_cbo_dm_hop_dong_khung.DataValueField = DM_HOP_DONG_KHUNG.ID;
            m_cbo_dm_hop_dong_khung.DataTextField = DM_HOP_DONG_KHUNG.SO_HOP_DONG;
            m_cbo_dm_hop_dong_khung.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    private void load_2_cbo_noi_dung_thanh_toan()
    {
        if (m_cbo_dm_hop_dong_khung.SelectedItem == null) return;
        US_DM_NOI_DUNG_THANH_TOAN v_us = new US_DM_NOI_DUNG_THANH_TOAN();
        DS_DM_NOI_DUNG_THANH_TOAN v_ds = new DS_DM_NOI_DUNG_THANH_TOAN();
        try
        {
            v_us.FillDataset(v_ds, "WHERE ID_LOAI_HOP_DONG IN (SELECT ID_LOAI_HOP_DONG FROM DM_HOP_DONG_KHUNG WHERE ID="
                                        +CIPConvert.ToDecimal(m_cbo_dm_hop_dong_khung.SelectedValue)+")");

            m_cbo_noi_dung_thanh_toan.DataSource = v_ds.DM_NOI_DUNG_THANH_TOAN;
            m_cbo_noi_dung_thanh_toan.DataValueField = DM_NOI_DUNG_THANH_TOAN.ID;
            m_cbo_noi_dung_thanh_toan.DataTextField = DM_NOI_DUNG_THANH_TOAN.TEN_NOI_DUNG;
            m_cbo_noi_dung_thanh_toan.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    private void load_data_2_grid() {
        try
        {
            m_us_gd_lop_mon_detail.FillDataset(m_ds_gd_lop_mon_detail," WHERE ID_LOP_MON="+this.Request.QueryString["id_lop_mon"].ToString());
            m_grv.DataSource = m_ds_gd_lop_mon_detail.GD_LOP_MON_DETAIL;
            
            m_grv.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    #endregion
    //
    //
    // Events
    //
    //
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack) {
                load_2_cbo_hop_dong_khung();
                load_2_cbo_noi_dung_thanh_toan();
            }
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(v_e);
        }
    }
    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
           
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(v_e);
        }
    }
    protected void m_cmd_thoat_Click(object sender, EventArgs e)
    {
        try
        {
          
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(v_e);
        }
    }
    protected void m_cbo_dm_hop_dong_khung_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            load_2_cbo_noi_dung_thanh_toan();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(v_e);
        }
    }
}