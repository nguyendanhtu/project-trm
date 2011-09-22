using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebDS;
using WebUS;
using WebDS.CDBNames;
using IP.Core.IPCommon;
using IP.Core.IPUserService;
using IP.Core.IPData;



public partial class ChucNang_F301_GdHopDongKhung : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            m_cmd_thoat.Attributes.Add("onclick", "window.close();");
            if (this.Request.QueryString["mode"] != null && this.Request.QueryString["id_lop_mon"] != null)
            {
                if (this.Request.QueryString["mode"] == "update")
                    m_e_form_mode = DataEntryFormMode.UpdateDataState;
                else if (this.Request.QueryString["mode"] == "insert") m_e_form_mode = DataEntryFormMode.InsertDataState;
                else if (this.Request.QueryString["mode"] == "view") m_e_form_mode = DataEntryFormMode.ViewDataState;
                else return;
               
            }
            if (!this.IsPostBack)
            {
                load_2_cbo_don_vi_tt();
                load_2_cbo_trang_thai_hd();
                load_2_cbo_don_vi_quan_ly();
                load_2_cbo_loai_hop_dong();
                load_2_cbo_ten_giang_vien();
                load_2_cbo_mon_hoc_1();
                load_2_cbo_mon_hoc_2();
                load_2_cbo_mon_hoc_3();
                load_2_cbo_mon_hoc_4();
                load_2_cbo_mon_hoc_5();
                load_2_cbo_mon_hoc_6();
                switch (m_e_form_mode)
                {

                    case DataEntryFormMode.UpdateDataState:
                  
                        break;
                    case DataEntryFormMode.InsertDataState:

                        break;
                    case DataEntryFormMode.ViewDataState:

                        break;
                }

            }
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
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
 
     private void load_2_cbo_ten_giang_vien()
    {

        US_V_DM_GIANG_VIEN v_us_giang_vien_ten =new  US_V_DM_GIANG_VIEN();
        DS_V_DM_GIANG_VIEN v_ds_giang_vien_ten =new DS_V_DM_GIANG_VIEN();
        try 
        {
            v_us_giang_vien_ten.FillDataset(v_ds_giang_vien_ten);
            m_cbo_giang_vien_ten.DataSource = v_ds_giang_vien_ten.V_DM_GIANG_VIEN;
            m_cbo_giang_vien_ten.DataValueField = V_DM_GIANG_VIEN.ID;

            m_cbo_giang_vien_ten.DataTextField = V_DM_GIANG_VIEN.HO_VA_TEN_DEM;

            m_cbo_giang_vien_ten.DataBind();
        }
        catch (Exception v_e)
        {
		
            throw v_e;
        }
    }
     private void load_2_cbo_trang_thai_hd() {


        US_CM_DM_TU_DIEN v_us_trang_thai_hd = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_trang_thai_hd = new DS_CM_DM_TU_DIEN();
        try
        {
             v_us_trang_thai_hd.FillDataset(v_ds_trang_thai_hd, " WHERE ID_LOAI_TU_DIEN = 8 ");
            m_cbo_dm_loai_don_vi_quan_li.DataSource = v_ds_trang_thai_hd.CM_DM_TU_DIEN;
            m_cbo_dm_loai_don_vi_quan_li.DataValueField = CM_DM_TU_DIEN.ID;
            m_cbo_dm_loai_don_vi_quan_li.DataTextField = CM_DM_TU_DIEN.TEN;
            m_cbo_dm_loai_don_vi_quan_li.DataBind();
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
            m_cbo_dm_mon_hoc_2.SelectedIndex = 0;       
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
            m_cbo_dm_mon_hoc_2.SelectedIndex = 0;  
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
            m_cbo_dm_mon_hoc_2.SelectedIndex = 0;  
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
            m_cbo_dm_mon_hoc_2.SelectedIndex = 0;  
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
            m_cbo_dm_mon_hoc_2.SelectedIndex = 0;  
            m_cbo_dm_mon_hoc_6.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
     private void load_2_cbo_loai_hop_dong()
     {
         US_CM_DM_TU_DIEN v_us_dm_loai_hop_dong = new US_CM_DM_TU_DIEN();
         DS_CM_DM_TU_DIEN v_ds_dm_loai_hop_dong = new DS_CM_DM_TU_DIEN();
         try
         {
             v_us_dm_loai_hop_dong.FillDataset(v_ds_dm_loai_hop_dong, " WHERE ID_LOAI_TU_DIEN = 7 ");
             m_cbo_dm_loai_hop_dong.DataSource = v_ds_dm_loai_hop_dong.CM_DM_TU_DIEN;
             m_cbo_dm_loai_hop_dong.DataValueField = CM_DM_TU_DIEN.ID;
             m_cbo_dm_loai_hop_dong.DataTextField = CM_DM_TU_DIEN.TEN_NGAN;
             m_cbo_dm_loai_hop_dong.DataBind();
         }
         catch (Exception v_e)
         {
             
             throw v_e;
         }
     }
     private void load_2_cbo_don_vi_quan_ly()
     {
         US_CM_DM_TU_DIEN v_us_don_vi_quan_ly = new US_CM_DM_TU_DIEN();
         DS_CM_DM_TU_DIEN v_ds_don_vi_quan_ly = new DS_CM_DM_TU_DIEN();
         try
         {
             v_us_don_vi_quan_ly.FillDataset(v_ds_don_vi_quan_ly, " WHERE ID_LOAI_TU_DIEN = 3 ");
             m_cbo_dm_loai_don_vi_quan_li.DataSource = v_ds_don_vi_quan_ly.CM_DM_TU_DIEN;
             m_cbo_dm_loai_don_vi_quan_li.DataValueField = CM_DM_TU_DIEN.ID;
             m_cbo_dm_loai_don_vi_quan_li.DataTextField = CM_DM_TU_DIEN.TEN;
             m_cbo_dm_loai_don_vi_quan_li.DataBind();
         }
         catch (Exception v_e)
         {
             
             throw v_e;
         }
     
     }
     private void load_2_cbo_don_vi_tt()
     {
         US_CM_DM_TU_DIEN v_us_don_vi_tt = new US_CM_DM_TU_DIEN();
         DS_CM_DM_TU_DIEN v_ds_don_vi_tt = new DS_CM_DM_TU_DIEN();
         try
         {
             v_us_don_vi_tt.FillDataset(v_ds_don_vi_tt, " WHERE ID_LOAI_TU_DIEN = 7 ");
             m_cbo_dm_loai_don_vi_quan_li.DataSource = v_ds_don_vi_tt.CM_DM_TU_DIEN;
             m_cbo_dm_loai_don_vi_quan_li.DataValueField = CM_DM_TU_DIEN.ID;
             m_cbo_dm_loai_don_vi_quan_li.DataTextField = CM_DM_TU_DIEN.TEN;
             m_cbo_dm_loai_don_vi_quan_li.DataBind();
         }
         catch (Exception v_e)
         {

             throw v_e;
         }

     }
     private void form_2_us_object()
     { 
       
     }
     private void us_object_2_form() {

         m_txt_so_hop_dong.Text = m_us_v_hop_dong_khung.strSO_HOP_DONG;
         m_txt_gia_tri_hop_dong.Text = CIPConvert.ToStr(m_us_v_hop_dong_khung.dcGIA_TRI_HOP_DONG);
     }

    #endregion
    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {

    }
    protected void m_cmd_thoat_Click(object sender, EventArgs e)
    {

    }
}