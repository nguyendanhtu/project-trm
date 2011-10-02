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
        m_lbl_mess.Text = "";
        if (m_init_mode == DataEntryFormMode.UpdateDataState)
        {
          
        }
        if (!IsPostBack)
        {
            load_data_2_us_by_id_and_show_on_form(1);
        }
    }

    #region Public Interface

    #endregion

    #region Data Structure

    #endregion

    #region Members
    DataEntryFormMode m_init_mode;
    decimal m_dc_id = 0;
    #endregion

    #region Private Method
    private void reset_control()
    {
        m_txt_so_luong_he_so.Text = "";
        m_txt_thanh_tien.Text = "";
        m_cbo_noi_dung_tt.SelectedIndex = 0;
    }
  
    private void load_2_cbo_trang_thai_hd()
    {
        US_DM_NOI_DUNG_THANH_TOAN v_us_noi_dung_thanh_toan = new US_DM_NOI_DUNG_THANH_TOAN();
        DS_DM_NOI_DUNG_THANH_TOAN v_ds_noi_dung_thanh_toan = new DS_DM_NOI_DUNG_THANH_TOAN();
        try
        {
            v_us_noi_dung_thanh_toan.FillDataset(v_ds_noi_dung_thanh_toan);
            m_cbo_noi_dung_tt.DataSource = v_ds_noi_dung_thanh_toan.DM_NOI_DUNG_THANH_TOAN;
            m_cbo_noi_dung_tt.DataValueField = DM_NOI_DUNG_THANH_TOAN.ID;
            m_cbo_noi_dung_tt.DataTextField = DM_NOI_DUNG_THANH_TOAN.TEN_NOI_DUNG;
            m_cbo_noi_dung_tt.DataBind();
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
            //if (m_init_mode != DataEntryFormMode.UpdateDataState)
            //    m_us_v_hop_dong_khung.Insert();
            //else m_us_v_hop_dong_khung.Update();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    #endregion
    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
            //form_2_us_object(m_us_dm_mon_hoc);
            //if (m_init_mode == DataEntryFormMode.UpdateDataState) return;
           
            //m_us_dm_mon_hoc.Insert();
            //m_lbl_mess.Text = "Thêm bản ghi thành công";
            //reset_control();
            //load_data_to_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_thoat_Click(object sender, EventArgs e)
    {
        try
        {
            reset_control();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.Equals(this, v_e);
        }
    }
    protected void cmd_them_moi_Click(object sender, EventArgs e)
    {
        try
        {
            
        }
        catch (Exception v_e)
        {
            CSystemLog_301.Equals(this, v_e);
        }
    }
}