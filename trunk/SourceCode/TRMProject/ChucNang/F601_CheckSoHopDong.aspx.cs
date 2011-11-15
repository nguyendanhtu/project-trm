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

public partial class ChucNang_F601_CheckSoHopDong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string v_str_so_hd;
            if (Request.QueryString["sohd"] != null)
            {
                v_str_so_hd = CIPConvert.ToStr(Request.QueryString["sohd"]);
                if (v_str_so_hd.Equals(""))
                {
                    string someScript;
                    someScript = "<script language='javascript'>{ alert('Bạn chưa nhập số hợp đồng'); window.close(); }</script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", someScript);
                    return;
                }
                m_lbl_so_hd.Text = v_str_so_hd;
                // Đoạn này đã lấy được số hợp đồng, search và đổ lên lưới
                load_data_2_grid(v_str_so_hd);
            }

        }
    }

    #region Members
    
    #endregion

    #region Private Methods
    private void load_data_2_grid(string ip_str_ma_hop_dong)
    {
        US_V_DM_HOP_DONG_KHUNG v_us_hop_dong_khung = new US_V_DM_HOP_DONG_KHUNG();
        DS_V_DM_HOP_DONG_KHUNG v_ds_hop_dong_khung = new DS_V_DM_HOP_DONG_KHUNG();

        v_us_hop_dong_khung.FillDataset(v_ds_hop_dong_khung, " WHERE SO_HOP_DONG = '"+ip_str_ma_hop_dong+"'");
        if (v_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0)
        {
            string someScript;
            someScript = "<script language='javascript'>{ alert('Không có hợp đồng nào phù hợp!'); window.close(); }</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", someScript);
            return;
        }
        m_grv_dm_danh_sach_hop_dong_khung.DataSource = v_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;
        m_grv_dm_danh_sach_hop_dong_khung.DataBind();
    }
    #endregion

    #region Public Interfaces
    public string mapping_cs(string ip_str_cs_YN)
    {
        if (ip_str_cs_YN.Equals("Y"))
            return "Có";
        return "Không";
    } 
    #endregion
}