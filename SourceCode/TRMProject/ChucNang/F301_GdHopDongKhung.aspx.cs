using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebDS;
using WebUS;
using WebDS.CDBNames;
using IP.Core.IPCommon;

public partial class ChucNang_F301_GdHopDongKhung : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region Public Interface

    #endregion
    #region Data Structure
    DataEntryFormMode m_e_form_mode;
    #endregion
    #region Members
    US_V_DM_GIANG_VIEN m_us_v_giang_vien = new US_V_DM_GIANG_VIEN();
    DS_V_DM_GIANG_VIEN m_ds_v_giang_vien = new DS_V_DM_GIANG_VIEN();
    decimal m_dc_id_giang_vien = 0;
    US_V_DM_HOP_DONG_KHUNG m_us_v_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG();
    DS_V_DM_HOP_DONG_KHUNG m_ds_v_hop_dong_khung = new DS_V_DM_HOP_DONG_KHUNG();
    decimal m_dc_id_hop_dong_khung = 0;


        #endregion


    #region Private Method
    private void load_2_cbo_ten_giang_vien_ten_dem()
    {

    }
    private void load_2_cbo_ten_giang_vien()
    {

        US_V_DM_GIANG_VIEN v_us_giang_vien_ten_dem =new  US_V_DM_GIANG_VIEN();
        DS_V_DM_GIANG_VIEN v_ds_giang_vien_ten_dem =new DS_V_DM_GIANG_VIEN();
        try 
        {	       
            //v_us_giang_vien_ten_dem.FillDataset(v_ds_giang_vien_ten_dem);
            //m_cbo_giang_vien_ten_dem.DataSource = v_ds_giang_vien_ten_dem.V_DM_GIANG_VIEN;
            //m_cbo_giang_vien_ten_dem.DataValueField = V_DM_GIANG_VIEN.ID;
             
            //m_cbo_giang_vien_ten_dem.DataTextField = V_DM_GIANG_VIEN.HO_VA_TEN_DEM;
          
            //m_cbo_giang_vien_ten_dem.DataBind();
        }
        catch (Exception v_e)
        {
		
            throw v_e;
        }
    }
     private void load_2_cbo_mon_hoc_1(){
        US_DM_MON_HOC v_us_dm_mon_hoc_1 = new US_DM_MON_HOC();
        DS_DM_MON_HOC v_ds_dm_mon_hoc_1 = new DS_DM_MON_HOC();
        try
        {
            v_us_dm_mon_hoc_1.FillDataset(v_ds_dm_mon_hoc_1);
            m_cbo_dm_mon_hoc_1.DataSource = v_ds_dm_mon_hoc_1.DM_MON_HOC;
            m_cbo_dm_mon_hoc_1.DataValueField = DM_MON_HOC.ID;
            m_cbo_dm_mon_hoc_1.DataTextField = DM_MON_HOC.TEN_MON_HOC;
            m_cbo_dm_mon_hoc_1.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
     private void load_2_cbo_mon_hoc_2(){
        US_DM_MON_HOC v_us_dm_mon_hoc_2 = new US_DM_MON_HOC();
        DS_DM_MON_HOC v_ds_dm_mon_hoc_2 = new DS_DM_MON_HOC();
        try
        {
            v_us_dm_mon_hoc_2.FillDataset(v_ds_dm_mon_hoc_2);
            m_cbo_dm_mon_hoc_2.DataSource = v_ds_dm_mon_hoc_2.DM_MON_HOC;
            m_cbo_dm_mon_hoc_2.DataValueField = DM_MON_HOC.ID;
            m_cbo_dm_mon_hoc_2.DataTextField = DM_MON_HOC.TEN_MON_HOC;
            m_cbo_dm_mon_hoc_2.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
     private void load_2_cbo_mon_hoc_3(){
        US_DM_MON_HOC v_us_dm_mon_hoc_3 = new US_DM_MON_HOC();
        DS_DM_MON_HOC v_ds_dm_mon_hoc_3 = new DS_DM_MON_HOC();
        try
        {
            v_us_dm_mon_hoc_3.FillDataset(v_ds_dm_mon_hoc_3);
            m_cbo_dm_mon_hoc_3.DataSource = v_ds_dm_mon_hoc_3.DM_MON_HOC;
            m_cbo_dm_mon_hoc_3.DataValueField = DM_MON_HOC.ID;
            m_cbo_dm_mon_hoc_3.DataTextField = DM_MON_HOC.TEN_MON_HOC;
            m_cbo_dm_mon_hoc_3.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
     private void load_2_cbo_mon_hoc_4(){
        US_DM_MON_HOC v_us_dm_mon_hoc_4 = new US_DM_MON_HOC();
        DS_DM_MON_HOC v_ds_dm_mon_hoc_4 = new DS_DM_MON_HOC();
        try
        {
            v_us_dm_mon_hoc_4.FillDataset(v_ds_dm_mon_hoc_4);
            m_cbo_dm_mon_hoc_4.DataSource = v_ds_dm_mon_hoc_4.DM_MON_HOC;
            m_cbo_dm_mon_hoc_4.DataValueField = DM_MON_HOC.ID;
            m_cbo_dm_mon_hoc_4.DataTextField = DM_MON_HOC.TEN_MON_HOC;
            m_cbo_dm_mon_hoc_4.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
     private void load_2_cbo_mon_hoc_5(){
        US_DM_MON_HOC v_us_dm_mon_hoc_5 = new US_DM_MON_HOC();
        DS_DM_MON_HOC v_ds_dm_mon_hoc_5 = new DS_DM_MON_HOC();
        try
        {
            v_us_dm_mon_hoc_5.FillDataset(v_ds_dm_mon_hoc_5);
            m_cbo_dm_mon_hoc_5.DataSource = v_ds_dm_mon_hoc_5.DM_MON_HOC;
            m_cbo_dm_mon_hoc_5.DataValueField = DM_MON_HOC.ID;
            m_cbo_dm_mon_hoc_5.DataTextField = DM_MON_HOC.TEN_MON_HOC;
            m_cbo_dm_mon_hoc_5.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
     private void load_2_cbo_mon_hoc_6(){
        US_DM_MON_HOC v_us_dm_mon_hoc_6 = new US_DM_MON_HOC();
        DS_DM_MON_HOC v_ds_dm_mon_hoc_6 = new DS_DM_MON_HOC();
        try
        {
            v_us_dm_mon_hoc_6.FillDataset(v_ds_dm_mon_hoc_6);
            m_cbo_dm_mon_hoc_6.DataSource = v_ds_dm_mon_hoc_6.DM_MON_HOC;
            m_cbo_dm_mon_hoc_6.DataValueField = DM_MON_HOC.ID;
            m_cbo_dm_mon_hoc_6.DataTextField = DM_MON_HOC.TEN_MON_HOC;
            m_cbo_dm_mon_hoc_6.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }

    #endregion
    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {

    }
    protected void m_cmd_thoat_Click(object sender, EventArgs e)
    {

    }
}