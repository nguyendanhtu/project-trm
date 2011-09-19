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

public partial class ChuNang_F202_DanhSachGiangVien : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            mtv_giang_vien.ActiveViewIndex = 1;
            if (!IsPostBack)
                load_data_to_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
       
    }

    #region Members
    US_V_DM_GIANG_VIEN m_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
    DS_V_DM_GIANG_VIEN m_ds_giang_vien = new DS_V_DM_GIANG_VIEN();

    US_CM_DM_TU_DIEN m_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_dm_tu_dien = new DS_CM_DM_TU_DIEN();
    DataEntryFormMode m_init_mode = DataEntryFormMode.ViewDataState;
    #endregion

    #region Private Methods
    //private bool check_validate()
    //{
    //    if (this.m_txt.Text.Trim().Equals(""))
    //    {
    //        this.m_ctv_ma_mon.IsValid = false;
    //        return false;
    //    }
    //    if (this.m_txt_ten_mon.Text.Trim().Equals(""))
    //    {
    //        this.m_ctv_ten_mon.IsValid = false;
    //        return false;
    //    }
    //    if (this.m_txt_don_vi_hoc_trinh.Text.Trim().Equals(""))
    //    {
    //        this.m_ctv_don_vi_hoc_trinh.IsValid = false;
    //        return false;
    //    }

    //    return true;
    //}
    private void load_data_to_grid()
    {
        try
        {
            // Đổ dữ liệu từ US vào DS
            m_us_dm_giang_vien.FillDataset(m_ds_giang_vien);

            // Treo dữ liệu lên lưới
            m_grv_dm_danh_sach_giang_vien.DataSource = m_ds_giang_vien.V_DM_GIANG_VIEN;
            m_grv_dm_danh_sach_giang_vien.DataBind();
        }
        catch (Exception v_e)
        {
            //nhớ using Ip.Common
            CSystemLog_301.ExceptionHandle(this, v_e);

        }
    }

    //private void reset_control()
    //{
    //    m_txt_ten_mon.Text = "";
    //    m_txt_ma_mon.Text = "";
    //    m_txt_don_vi_hoc_trinh.Text = "";
    //    m_txt_ghi_chu.Text = "";
    //}
    private void form_2_us_object(US_V_DM_GIANG_VIEN ip_us_giang_vien)
    {
       

    }
    /// <summary>
    /// Load dữ liệu từ US đổ vào form
    /// </summary>
    /// <param name="ip_dm_noi_dung_thanh_toan"></param>
    //private void us_obj_2_form(US_DM_MON_HOC ip_us_mon_hoc)
    //{
    //    m_txt_ten_mon.Text = ip_us_mon_hoc.strTEN_MON_HOC;
    //    m_txt_ma_mon.Text = ip_us_mon_hoc.strMA_MON_HOC;
    //    m_txt_don_vi_hoc_trinh.Text = CIPConvert.ToStr(ip_us_mon_hoc.dcSO_DVHT);
    //    m_txt_ghi_chu.Text = ip_us_mon_hoc.strGHI_CHU;
    //}
    //private void delete_dm_mon_hoc(int ip_i_row_del)
    //{
    //    decimal v_dc_id_mon_hoc = CIPConvert.ToDecimal(m_grv_dm_mon_hoc.DataKeys[ip_i_row_del].Value);
    //    m_us_dm_mon_hoc.dcID = v_dc_id_mon_hoc;
    //    m_us_dm_mon_hoc.DeleteByID(v_dc_id_mon_hoc);
    //    m_lbl_mess.Text = "Xóa bản ghi thành công";
    //    load_data_to_grid();
    //}
    //private void load_data_2_us_by_id(int ip_i_id)
    //{
    //    decimal v_dc_id_dm_mon_hoc = CIPConvert.ToDecimal(m_grv_dm_mon_hoc.DataKeys[ip_i_id].Value);
    //    hdf_id.Value = v_dc_id_dm_mon_hoc.ToString();
    //    US_DM_MON_HOC v_us_dm_mon_hoc = new US_DM_MON_HOC(v_dc_id_dm_mon_hoc);
    //    // Đẩy us lên form
    //    us_obj_2_form(v_us_dm_mon_hoc);
    //}

    //private bool check_ma_mon()
    //{
    //    try
    //    {
    //        if (!m_us_dm_mon_hoc.check_exist_ma_mon(m_txt_ma_mon.Text.TrimEnd())) return false;
    //        return true;
    //    }
    //    catch (Exception v_e)
    //    {
    //        throw v_e;
    //    }
    //}
    #endregion

    #region Public Interfaces
    public string mapping_gender(string ip_str_gen)
    {
        if (ip_str_gen.Equals("Y"))
            return "Nam";
        return "Nữ";
    }

    public string mapping_hd(string ip_str_hd_YN)
    {
        if (ip_str_hd_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_cm(string ip_str_cm_YN)
    {
        if (ip_str_cm_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_viet_hl(string ip_str_viet_hl_YN)
    {
        if (ip_str_viet_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_duyet_hl(string ip_str_duyet_hl_YN)
    {
        if (ip_str_duyet_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
         }
    public string mapping_tham_dinh_hl(string ip_str_tham_dinh_hl_YN)
    {
        if (ip_str_tham_dinh_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
       }
    public string mapping_hdkh(string ip_str_hdkh_YN)
    {
        if (ip_str_hdkh_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    
    #endregion

    //
    //Events
    //

    protected void cmd_them_moi_Click(object sender, EventArgs e)
    {
        try
        {
            mtv_giang_vien.ActiveViewIndex = 0;
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_dm_danh_sach_giang_vien_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            m_grv_dm_danh_sach_giang_vien.PageIndex = e.NewPageIndex;
            load_data_to_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this,v_e);
        }
    }
}