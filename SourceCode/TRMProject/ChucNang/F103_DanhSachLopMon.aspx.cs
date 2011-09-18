using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IP.Core.IPCommon;
using WebDS;
using WebDS.CDBNames;
using WebUS;
using IP.Core.IPUserService;
using System.Data;
public partial class ChuNang_F103_DanhSachLopMon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            if (!this.IsPostBack) {
                load_2_cbo_dm_mon_hoc();
            }
        }
        catch(Exception v_e) {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    #region Data Structures
    #endregion

    #region Members
    DS_GD_LOP_MON m_ds_gd_lop_mon = new DS_GD_LOP_MON();
    US_GD_LOP_MON m_us_gd_lop_mon = new US_GD_LOP_MON();
    #endregion

    #region Private Methods
    private void load_2_cbo_dm_mon_hoc()
    {
        US_DM_MON_HOC v_us_dm_mon_hoc = new US_DM_MON_HOC();
        DS_DM_MON_HOC v_ds_dm_mon_hoc = new DS_DM_MON_HOC();
        try
        {
            v_us_dm_mon_hoc.FillDataset(v_ds_dm_mon_hoc);

            //add item Tat Ca
            DataRow v_dr_all = v_ds_dm_mon_hoc.DM_MON_HOC.NewDM_MON_HOCRow();
            v_dr_all[DM_MON_HOC.ID] = 0;
            v_dr_all[DM_MON_HOC.TEN_MON_HOC] = "Tất cả";
            v_ds_dm_mon_hoc.EnforceConstraints = false;
            v_ds_dm_mon_hoc.DM_MON_HOC.Rows.InsertAt(v_dr_all, 0);

            m_cbo_dm_mon_hoc.DataSource = v_ds_dm_mon_hoc.DM_MON_HOC;
            m_cbo_dm_mon_hoc.DataValueField = DM_MON_HOC.ID;
            m_cbo_dm_mon_hoc.DataTextField = DM_MON_HOC.TEN_MON_HOC;
            m_cbo_dm_mon_hoc.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }

    public string get_mapping_ten_mon_hoc(decimal i_dc_id_mon_hoc) {
        try {
            string v_str_ten_mon_hoc = "";
            US_DM_MON_HOC v_us_dm_mon_hoc = new US_DM_MON_HOC(i_dc_id_mon_hoc);
            v_str_ten_mon_hoc = v_us_dm_mon_hoc.strTEN_MON_HOC;
            return v_str_ten_mon_hoc;
        }
        catch (Exception v_e) {
            throw v_e;
        }

    }
    public string get_mapping_yn(string i_str_yn)
    {
        try
        {
            if (i_str_yn == "Y")
                return "Có";
            else return "Không";
        }
        catch (Exception v_e)
        {
            throw v_e;
        }

    }
    private void load_data_2_grid() {
        m_ds_gd_lop_mon = new DS_GD_LOP_MON();
        try
        {
            string v_str_online_yn = "";
            string v_str_offline_yn = "";
            string v_str_bt_gky_yn = "";
            if (m_rbt_online_yn.SelectedIndex == 0) {
                v_str_online_yn = "Y";
            }else v_str_online_yn ="N";
            if (m_rbt_offline_yn.SelectedIndex == 0)
            {
                v_str_offline_yn = "Y";
            }else v_str_offline_yn ="N";

            if(m_rbt_bt_gky_yn.SelectedIndex==0){
                v_str_bt_gky_yn = "Y";
            }else v_str_bt_gky_yn="N";
            m_us_gd_lop_mon.fill_data_by_search(CIPConvert.ToDecimal(m_cbo_dm_mon_hoc.SelectedValue)
                            ,v_str_online_yn
                            ,v_str_offline_yn
                            ,v_str_bt_gky_yn
                            ,m_txt_tu_khoa_tim_kiem.Text, m_ds_gd_lop_mon);
            m_grv.DataSource = m_ds_gd_lop_mon.GD_LOP_MON;
            m_grv.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
    #endregion
    //
    //
    // Event Hanlder
    //
    //


    protected void m_cmd_loc_du_lieu_Click(object sender, EventArgs e)
    {
        
        try
        {
            load_data_2_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            //HyperLink v_lnk = (HyperLink)e.Row.FindControl("m_lnk_sua");
            //v_lnk.Attributes.Add("OnClick", "JavaScript:OpenWinCenter2(350, 800, '', '~/ChucNang/F102_CapNhatThongTinLopMon.aspx?id=");
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }

    protected void m_cmd_tao_moi(object sender, EventArgs e)
    {
        try
        {
            Response.Write("<script>");
            Response.Write("window.open('F102_CapNhatThongTinLopMon.aspx?mode=insert&id_lop_mon=0','_blank')");
            Response.Write("</script>");
            load_data_2_grid();
            //Response.Redirect("F102_CapNhatThongTinLopMon.aspx?mode=insert&id_lop_mon=0");
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
}