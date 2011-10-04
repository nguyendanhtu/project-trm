﻿using System;
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
        m_lbl_thong_bao.Text = "";
        if (!IsPostBack)
        {
            m_cmd_cap_nhat_pl.Enabled = true;
            m_cmd_luu_du_lieu.Enabled = true;
            // show on grid
            if (Request.QueryString["id_hd"] != null)
            {
                m_dc_id_hd = CIPConvert.ToDecimal(Request.QueryString["id_hd"]);
                load_data_2_grid(m_dc_id_hd);
                load_2_cbo_noi_dung_tt(get_id_loai_hd_hop_dong_id(m_dc_id_hd));
            }
        }
        load_data_2_basic_control();
    }

    #region Public Interface

    #endregion

    #region Data Structure

    #endregion

    #region Members
    DataEntryFormMode m_init_mode = DataEntryFormMode.ViewDataState;
    DS_V_GD_HOP_DONG_NOI_DUNG_TT m_ds_v_gd_gd_hop_dong_noi_dung_tt = new DS_V_GD_HOP_DONG_NOI_DUNG_TT();
    US_V_GD_HOP_DONG_NOI_DUNG_TT m_us_v_gd_hop_dong_noi_dung_tt = new US_V_GD_HOP_DONG_NOI_DUNG_TT();
    decimal m_dc_id_hd = 0;
    #endregion

    #region Private Method
    private void reset_control()
    {
        m_txt_so_luong_he_so.Text = "";
        m_txt_don_gia_hd.Text = "";
        m_cbo_noi_dung_tt.SelectedIndex = 0;
    }
 
    private void load_2_cbo_noi_dung_tt(decimal ip_dc_id_loai_hd)
    {
        US_DM_NOI_DUNG_THANH_TOAN v_us_noi_dung_thanh_toan = new US_DM_NOI_DUNG_THANH_TOAN();
        DS_DM_NOI_DUNG_THANH_TOAN v_ds_noi_dung_thanh_toan = new DS_DM_NOI_DUNG_THANH_TOAN();
        try
        {
            v_us_noi_dung_thanh_toan.FillDataset(v_ds_noi_dung_thanh_toan," WHERE ID_LOAI_HOP_DONG="+ip_dc_id_loai_hd);
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

    private void form_2_us_object(US_V_GD_HOP_DONG_NOI_DUNG_TT op_us_gd_hd_noi_dung_tt)
    {
        try
        {
            op_us_gd_hd_noi_dung_tt.dcID_NOI_DUNG_TT =CIPConvert.ToDecimal(m_cbo_noi_dung_tt.SelectedValue);
            op_us_gd_hd_noi_dung_tt.dcDON_GIA_HD =CIPConvert.ToDecimal(m_txt_don_gia_hd.Text.Trim());
            op_us_gd_hd_noi_dung_tt.dcSO_LUONG_HE_SO =CIPConvert.ToDecimal( m_txt_so_luong_he_so.Text.Trim());
            op_us_gd_hd_noi_dung_tt.dcID_HOP_DONG_KHUNG = CIPConvert.ToDecimal(Request.QueryString["id_hd"]);
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }

    private void us_object_2_form(US_V_GD_HOP_DONG_NOI_DUNG_TT ip_us_gd_hd_noi_dung_tt)
    {
        try
        {
            m_txt_so_hop_dong.Text = ip_us_gd_hd_noi_dung_tt.strSO_HOP_DONG;
            m_txt_ten_giang_vien.Text = ip_us_gd_hd_noi_dung_tt.strTEN_GIANG_VIEN;
            m_txt_so_luong_he_so.Text =CIPConvert.ToStr(ip_us_gd_hd_noi_dung_tt.dcSO_LUONG_HE_SO,"0");
            m_txt_don_gia_hd.Text =CIPConvert.ToStr(ip_us_gd_hd_noi_dung_tt.dcDON_GIA_HD,"0");
            m_cbo_noi_dung_tt.SelectedValue = CIPConvert.ToStr(ip_us_gd_hd_noi_dung_tt.dcID_NOI_DUNG_TT);
        }
        catch (Exception v_e)
        {

            throw v_e;
        }

    }
    // Load data và hiển thị lên form
    private void load_data_2_us_by_id_and_show_on_form(int ip_i_hop_dong_selected)
    {
        try
        {
            decimal v_dc_id_hop_dong_noi_dung_tt = CIPConvert.ToDecimal(m_grv_gd_hop_dong_noi_dung_tt.DataKeys[ip_i_hop_dong_selected].Value);
            hdf_id_gv.Value = CIPConvert.ToStr(v_dc_id_hop_dong_noi_dung_tt);
            US_V_GD_HOP_DONG_NOI_DUNG_TT v_us_gd_hop_dong_noi_dung_tt = new US_V_GD_HOP_DONG_NOI_DUNG_TT(v_dc_id_hop_dong_noi_dung_tt);

            // Load data to form 
            us_object_2_form(v_us_gd_hop_dong_noi_dung_tt);
        }
        catch (Exception v_e)
        {
            
            throw v_e;
        }
       
    }
    private void delete_row_hop_dong_noi_dung_tt(int ip_i_id_hop_dong_del)
    {
        decimal v_dc_id_hd_noi_dung =CIPConvert.ToDecimal(m_grv_gd_hop_dong_noi_dung_tt.DataKeys[ip_i_id_hop_dong_del].Value);
        m_us_v_gd_hop_dong_noi_dung_tt.dcID = v_dc_id_hd_noi_dung;
        m_us_v_gd_hop_dong_noi_dung_tt.DeleteByID(v_dc_id_hd_noi_dung);
        m_lbl_thong_bao.Text = "Xóa bản ghi thành công";
        load_data_2_grid(CIPConvert.ToDecimal(Request.QueryString["id_hd"]));
    }
    private void load_data_2_grid(decimal ip_dc_id_hd)
    {
        try
        {
            m_us_v_gd_hop_dong_noi_dung_tt.FillDataset(m_ds_v_gd_gd_hop_dong_noi_dung_tt, " WHERE ID_HOP_DONG_KHUNG=" + ip_dc_id_hd);
            
            // Nếu chưa có phụ lục nào ứng với hợp đồng khung này
            if (m_ds_v_gd_gd_hop_dong_noi_dung_tt.V_GD_HOP_DONG_NOI_DUNG_TT.Rows.Count == 0)
            {
                m_pnl_table.Visible = true;
            }
            else
            {
                // Load to grid
                m_grv_gd_hop_dong_noi_dung_tt.DataSource = m_ds_v_gd_gd_hop_dong_noi_dung_tt.V_GD_HOP_DONG_NOI_DUNG_TT;
                m_grv_gd_hop_dong_noi_dung_tt.DataBind();
            }
        }
        catch (Exception v_e)
        {
            
            throw v_e;
        }
        
    }
    // Load data to so hợp đồng và tên giảng viên
    private void load_data_2_basic_control()
    {
        try
        {
            US_V_DM_HOP_DONG_KHUNG v_us_dm_hd_khung = new US_V_DM_HOP_DONG_KHUNG(CIPConvert.ToDecimal(Request.QueryString["id_hd"]));
            if (!v_us_dm_hd_khung.IsIDNull())
            {
                m_txt_ten_giang_vien.Text = v_us_dm_hd_khung.strGIANG_VIEN;
                m_txt_so_hop_dong.Text = v_us_dm_hd_khung.strSO_HOP_DONG;
            }
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }
    private decimal get_id_loai_hd_hop_dong_id(decimal ip_dc_hd_id)
    {
        try
        {
            US_V_DM_HOP_DONG_KHUNG v_us_dm_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG(ip_dc_hd_id);
            if(v_us_dm_hop_dong_khung.IsIDNull()) return 0;
            return v_us_dm_hop_dong_khung.dcID_LOAI_HOP_DONG;
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }
    #endregion

    //
    //Events
    //

    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
             form_2_us_object(m_us_v_gd_hop_dong_noi_dung_tt);
             m_us_v_gd_hop_dong_noi_dung_tt.Insert();
             m_lbl_thong_bao.Text = "Thêm bản ghi thành công";
             reset_control();
             m_pnl_table.Visible = false;
             load_data_2_grid(CIPConvert.ToDecimal(Request.QueryString["id_hd"]));
             m_cmd_cap_nhat_pl.Enabled = true;
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
            m_pnl_table.Visible = true;
            m_cmd_cap_nhat_pl.Enabled = false;
            m_cmd_luu_du_lieu.Enabled = true;
        }
        catch (Exception v_e)
        {
            CSystemLog_301.Equals(this, v_e);
        }
    }
    protected void m_grv_dm_danh_sach_hop_dong_khung_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            m_init_mode = DataEntryFormMode.UpdateDataState;
            m_cmd_luu_du_lieu.Enabled = false;
            m_lbl_thong_bao.Text = "";
            m_pnl_table.Visible = true;
            load_data_2_us_by_id_and_show_on_form(e.NewSelectedIndex);
        }
        catch (Exception V_e)
        {
            CSystemLog_301.ExceptionHandle(this, V_e);
        }
    }
    protected void m_grv_gd_hop_dong_noi_dung_tt_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            m_lbl_thong_bao.Text ="";
            delete_row_hop_dong_noi_dung_tt(e.RowIndex);
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_cap_nhat_pl_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdf_id_gv.Value == "")
            {
                m_lbl_mess.Text = "Bạn phải chọn nội dung cần Cập nhật";
                return;
            }
            form_2_us_object(m_us_v_gd_hop_dong_noi_dung_tt);
            m_us_v_gd_hop_dong_noi_dung_tt.dcID =CIPConvert.ToDecimal(hdf_id_gv.Value);
            m_us_v_gd_hop_dong_noi_dung_tt.Update();
            m_lbl_thong_bao.Text = "Cập nhật bản ghi thành công";
            reset_control();
            m_pnl_table.Visible = false;
            m_cmd_luu_du_lieu.Enabled = true;
            load_data_2_grid(CIPConvert.ToDecimal(Request.QueryString["id_hd"]));
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
}