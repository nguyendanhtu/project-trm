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
    private void load_2_cbo_ten_giang_vien()
    {

        try
        {
        }
        catch (Exception)
        {

            throw;
        }
    }
        #endregion
}