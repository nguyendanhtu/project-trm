using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IP.Core.IPCommon;
using WebDS;
using WebUS;
public partial class ChucNang_F104_ChiTietLopMon : System.Web.UI.Page
{
    #region Public Interface
    public string get_so_hop_dong_khung(decimal i_dc_id_hop_dong_khung) {
        US_DM_HOP_DONG_KHUNG v_us_dm_hop_dong_khung = new US_DM_HOP_DONG_KHUNG(i_dc_id_hop_dong_khung);
        if (v_us_dm_hop_dong_khung.IsSO_HOP_DONGNull()) return "";
        return v_us_dm_hop_dong_khung.strSO_HOP_DONG;
        
    }
    public string get_ten_noi_dung_thanh_toan(decimal i_dc_id_noi_dung_thanh_toan)
    {
        US_DM_NOI_DUNG_THANH_TOAN v_us_dm_noi_dung_thanh_toan = new US_DM_NOI_DUNG_THANH_TOAN(i_dc_id_noi_dung_thanh_toan);
        if (v_us_dm_noi_dung_thanh_toan.IsTEN_NOI_DUNGNull()) return "";
        return v_us_dm_noi_dung_thanh_toan.strTEN_NOI_DUNG;

    }
    #endregion

    #region Data Structures

    #endregion

    #region Members

    #endregion

    #region Private Methods

    #endregion
    //
    //
    // Events
    //
    //
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {

    }
    protected void m_cmd_thoat_Click(object sender, EventArgs e)
    {

    }
}