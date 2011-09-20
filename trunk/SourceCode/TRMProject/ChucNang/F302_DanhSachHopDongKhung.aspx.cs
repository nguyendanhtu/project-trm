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
        m_grv_dm_danh_sach_hop_dong_khung.DataBind();
    }
    #endregion
}