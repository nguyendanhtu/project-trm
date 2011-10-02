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
using System.Data;

public partial class ChucNang_F307_PhuLucHopDong : System.Web.UI.Page
{
    // Mục đích là view phụ lục hợp đồng khung và sửa phụ lục
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Public Interface

    #endregion

    #region Data Structure

    #endregion

    #region Members
    US_V_DM_HOP_DONG_KHUNG m_us_v_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG();
    DS_V_DM_HOP_DONG_KHUNG m_ds_v_hop_dong_khung = new DS_V_DM_HOP_DONG_KHUNG();
    DataEntryFormMode m_init_mode;
    decimal m_dc_id = 0;
    #endregion

    #region Private Method
    private void reset_control()
    {

    }
    private bool check_so_hd()
    {
        try
        {
            if (m_us_v_hop_dong_khung.check_exist_so_hd(m_txt_so_hop_dong.Text.TrimEnd())) return false;
            return true;
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    private void load_2_cbo_trang_thai_hd()
    {
        US_CM_DM_TU_DIEN v_us_trang_thai_hd = new US_CM_DM_TU_DIEN();
        DS_CM_DM_TU_DIEN v_ds_trang_thai_hd = new DS_CM_DM_TU_DIEN();
        try
        {
            v_us_trang_thai_hd.FillDataset(v_ds_trang_thai_hd, " WHERE ID_LOAI_TU_DIEN =" + (int)e_loai_tu_dien.TRANG_THAI_HOP_DONG_KHUNG);
            //m_cbo_dm_trang_thai_hop_dong.DataSource = v_ds_trang_thai_hd.CM_DM_TU_DIEN;
            //m_cbo_dm_trang_thai_hop_dong.DataValueField = CM_DM_TU_DIEN.ID;
            //m_cbo_dm_trang_thai_hop_dong.DataTextField = CM_DM_TU_DIEN.TEN;
            //m_cbo_dm_trang_thai_hop_dong.DataBind();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }

    private void load_2_cbo_giang_vien()
    {
        US_V_DM_GIANG_VIEN v_us_giang_vien = new US_V_DM_GIANG_VIEN();
        DS_V_DM_GIANG_VIEN v_ds_giang_vien = new DS_V_DM_GIANG_VIEN();
        try
        {
            v_us_giang_vien.FillDataset(v_ds_giang_vien);
            //m_cbo_gvien.DataSource = v_ds_giang_vien.V_DM_GIANG_VIEN;
            //m_cbo_gvien.DataValueField = V_DM_GIANG_VIEN.ID;
            //m_cbo_gvien.DataTextField = V_DM_GIANG_VIEN.TEN_GIANG_VIEN;
            //m_cbo_gvien.DataBind();
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
            v_us_dm_loai_hop_dong.FillDataset(v_ds_dm_loai_hop_dong, " WHERE ID_LOAI_TU_DIEN = " + (int)e_loai_tu_dien.LOAI_HOP_DONG);
            //m_cbo_dm_loai_hop_dong.DataSource = v_ds_dm_loai_hop_dong.CM_DM_TU_DIEN;
            //m_cbo_dm_loai_hop_dong.DataValueField = CM_DM_TU_DIEN.ID;
            //m_cbo_dm_loai_hop_dong.DataTextField = CM_DM_TU_DIEN.TEN;
            //m_cbo_dm_loai_hop_dong.DataBind();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }

    private void form_2_us_object(US_V_DM_HOP_DONG_KHUNG ip_us_hd_khung)
    {
        try
        {
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }

    private void us_object_2_form(US_V_DM_HOP_DONG_KHUNG ip_us_hd_khung)
    {
        try
        {
           
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }
    private void load_data_2_us_by_id_and_show_on_form(decimal ip_i_id)
    {
        US_V_DM_HOP_DONG_KHUNG v_us_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG(ip_i_id);
        // Đẩy us lên form
        us_object_2_form(v_us_hop_dong_khung);
    }

    private void save_data()
    {
        try
        {
            if (m_init_mode != DataEntryFormMode.UpdateDataState)
                m_us_v_hop_dong_khung.Insert();
            else m_us_v_hop_dong_khung.Update();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    private void save_data_va_sinh_phu_luc()
    {
        try
        {
            if (m_init_mode != DataEntryFormMode.UpdateDataState)
                m_us_v_hop_dong_khung.insert_and_gen_phu_luc();

        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    #endregion
}