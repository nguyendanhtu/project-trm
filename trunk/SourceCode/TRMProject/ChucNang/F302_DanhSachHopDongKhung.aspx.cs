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

public partial class ChucNang_F302_DanhSachHopDongKhung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            mtv_hop_dong_khung.ActiveViewIndex = 1;
            if (!Page.IsPostBack)
                load_data_2_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    #region Members
    US_V_DM_HOP_DONG_KHUNG m_us_dm_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG();
    DS_V_DM_HOP_DONG_KHUNG m_ds_hop_dong_khung = new DS_V_DM_HOP_DONG_KHUNG();

    US_CM_DM_TU_DIEN m_us_cm_dm_tu_dien = new US_CM_DM_TU_DIEN();
    DS_CM_DM_TU_DIEN m_ds_cm_dm_tu_dien = new DS_CM_DM_TU_DIEN();

    US_DM_DON_VI_THANH_TOAN m_us_dm_don_vi_thanh_toan = new US_DM_DON_VI_THANH_TOAN();
    DS_DM_DON_VI_THANH_TOAN m_ds_dm_don_vi_thanh_toan = new DS_DM_DON_VI_THANH_TOAN();

    US_V_DM_GIANG_VIEN m_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
    DS_V_DM_GIANG_VIEN m_ds_dm_giang_vien = new DS_V_DM_GIANG_VIEN();

    DataEntryFormMode m_init_mode = DataEntryFormMode.ViewDataState;
    #endregion

    #region Public Interfaces
    public string mapping_hl(string ip_str_hl_YN)
    {
        if (ip_str_hl_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    public string mapping_vh(string ip_str_vh_YN)
    {
        if (ip_str_vh_YN.Equals("Y"))
            return "Có";
        return "Không";
    }
    #endregion

    #region Private Methods
    private void load_data_2_grid()
    {
        try
        {
            // Đổ dữ liệu từ US vào DS
            m_us_dm_hop_dong_khung.FillDataset(m_ds_hop_dong_khung);

            // Treo dữ liệu lên lưới
            m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;
            m_grv_dm_danh_sach_hop_dong_khung.DataBind();
        }
        catch (Exception v_e)
        {
            //nhớ using Ip.Common
            CSystemLog_301.ExceptionHandle(this, v_e);

        }
    }

    private void load_data_2_don_vi_quan_ly()
    {
        try
        {
            
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }
    private void reset_control()
    {
      
    }
    #endregion
}