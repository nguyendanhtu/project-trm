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
            try
            {
                m_lbl_thong_bao.Text = "";
                if (!IsPostBack)
                {
                    load_2_cbo_don_vi_quan_ly();
                    load_data_2_loai_hop_dong();
                    load_data_2_trang_thai_hop_dong();

                    if (Request.QueryString["edit"] != null)
                    {
                        if (Request.QueryString["edit"].ToString().Equals("ok"))
                            m_lbl_thong_bao.Text = "Cập nhật dữ liệu thành công";
                        else m_lbl_thong_bao.Text = "Thêm dữ liệu thành công";
                    }
                }
            }
            catch (Exception v_e)
            {
                CSystemLog_301.ExceptionHandle(this, v_e);
            }
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
    public string mapping_cs(string ip_str_cs_YN)
    {
        if (ip_str_cs_YN.Equals("Y"))
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
    private void load_2_cbo_don_vi_quan_ly()
    {
        try
        {
            DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
            //v_ds_cm_tu_dien.Clear();
            //DataRow v_dr_all_dv_quan_ly = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
          
            ////add item Tat Ca          
            //v_dr_all_dv_quan_ly[CM_DM_TU_DIEN.ID] = 0;
            //v_dr_all_dv_quan_ly[CM_DM_TU_DIEN.TEN] = "Tất cả";

            //v_ds_cm_tu_dien.EnforceConstraints = false;
            //v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_all_dv_quan_ly, 0);

            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "
                                                + (int)e_loai_tu_dien.DON_VI_QUAN_LY_CHINH); // Đây là lấy theo điều kiện
            m_cbo_don_vi_quan_ly_search.Items.Add(new ListItem("Tất cả", "0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_don_vi_quan_ly_search.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }
          
            //for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            //{
            //    m_cbo_don_vi_q_ly.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            //}
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }

    private void load_data_2_loai_hop_dong()
    {
        try
        {
             DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
            //v_ds_cm_tu_dien.Clear();
            //DataRow v_dr_all_loai_hdong = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();
          
            ////add item Tat Ca          
            //v_dr_all_loai_hdong[CM_DM_TU_DIEN.ID] = 0;
            //v_dr_all_loai_hdong[CM_DM_TU_DIEN.TEN] = "Tất cả";

            //v_ds_cm_tu_dien.EnforceConstraints = false;
            //v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_all_loai_hdong, 0);

            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "
                                                + (int)e_loai_tu_dien.LOAI_HOP_DONG); // Đây là lấy theo điều kiện
            m_cbo_loai_hop_dong_search.Items.Add(new ListItem("Tất cả", "0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_loai_hop_dong_search.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }

            //m_cbo_loai_hop_dong_search.DataValueField = CM_DM_TU_DIEN.ID;
            //m_cbo_loai_hop_dong_search.DataTextField = CM_DM_TU_DIEN.TEN;

            //m_cbo_loai_hop_dong_search.DataSource = v_ds_cm_tu_dien.CM_DM_TU_DIEN;
            //m_cbo_loai_hop_dong_search.DataBind();
        }
        catch (Exception v_e)
        {
            
            throw v_e;
        }
    }

    private void load_data_2_trang_thai_hop_dong()
    {
        try
        {
            DS_CM_DM_TU_DIEN v_ds_cm_tu_dien = new DS_CM_DM_TU_DIEN();
            US_CM_DM_TU_DIEN v_us_cm_tu_dien = new US_CM_DM_TU_DIEN();
            //v_ds_cm_tu_dien.Clear();
            //DataRow v_dr_all_trang_thai_hdong = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.NewCM_DM_TU_DIENRow();

            ////add item Tat Ca          
            //v_dr_all_trang_thai_hdong[CM_DM_TU_DIEN.ID] = 0;
            //v_dr_all_trang_thai_hdong[CM_DM_TU_DIEN.TEN] = "Tất cả";

            //v_ds_cm_tu_dien.EnforceConstraints = false;
            //v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.InsertAt(v_dr_all_trang_thai_hdong, 0);

            // Đổ dữ liệu vào DS 
            v_us_cm_tu_dien.FillDataset(v_ds_cm_tu_dien, " WHERE ID_LOAI_TU_DIEN = "
                                                + (int)e_loai_tu_dien.TRANG_THAI_HOP_DONG_KHUNG); // Đây là lấy theo điều kiện
            m_cbo_trang_thai_hop_dong_search.Items.Add(new ListItem("Tất cả", "0"));
            for (int i = 0; i < v_ds_cm_tu_dien.CM_DM_TU_DIEN.Rows.Count; i++)
            {
                m_cbo_trang_thai_hop_dong_search.Items.Add(new ListItem(v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.TEN].ToString(), v_ds_cm_tu_dien.CM_DM_TU_DIEN[i][CM_DM_TU_DIEN.ID].ToString()));
            }
            //m_cbo_trang_thai_hop_dong_search.DataValueField = CM_DM_TU_DIEN.ID;
            //m_cbo_trang_thai_hop_dong_search.DataTextField = CM_DM_TU_DIEN.TEN;

            //m_cbo_trang_thai_hop_dong_search.DataSource = v_ds_cm_tu_dien.CM_DM_TU_DIEN;
            //m_cbo_trang_thai_hop_dong_search.DataBind();
        }
        catch (Exception v_e)
        {

            throw v_e;
        }
    }

    #region Public Interfaces
    public string get_ma_gv_form_id(decimal ip_dc_id)
    {
        try
        {
            US_V_DM_GIANG_VIEN v_us_dm_giang_vien = new US_V_DM_GIANG_VIEN();
            DS_V_DM_GIANG_VIEN v_ds_dm_gv = new DS_V_DM_GIANG_VIEN();

            v_us_dm_giang_vien.FillDataset(v_ds_dm_gv," WHERE ID="+ip_dc_id);
            return v_ds_dm_gv.V_DM_GIANG_VIEN.Rows[0][V_DM_GIANG_VIEN.MA_GIANG_VIEN].ToString();
        }
        catch (Exception v_e)
        {
            
            throw v_e;
        }
        
    }
    #endregion
    private void get_form_search_data_and_load_to_grid()
    {

        try
        {

            // thu thập dữ liệu

            string v_str_ten_giang_vien = m_txt_ten_giang_vien.Text.Trim();

            string v_str_search_key_word = m_txt_tu_khoa_tim_kiem.Text.Trim();

            decimal v_dc_id_loai_hop_dong = CIPConvert.ToDecimal(m_cbo_loai_hop_dong_search.SelectedValue);

            decimal v_dc_trang_thai_hop_dong = CIPConvert.ToDecimal(m_cbo_trang_thai_hop_dong_search.SelectedValue);

            decimal v_dc_don_vi_quan_li = CIPConvert.ToDecimal(m_cbo_don_vi_quan_ly_search.SelectedValue);
            string v_str_ma_po_quan_ly = m_txt_ma_PO_quan_ly.Text.Trim();
            string v_str_so_hop_dong = m_txt_so_hd.Text.Trim();
            DateTime v_dat_ngay_ki = m_dat_ngay_ki.SelectedDate;
            DateTime v_dat_ngay_hieu_luc = m_dat_ngay_hieu_luc.SelectedDate;

            // Search

            m_us_dm_hop_dong_khung.search_hop_dong_khung( v_str_ten_giang_vien
                                                        , v_str_search_key_word
                                                        , v_dc_id_loai_hop_dong
                                                        , v_str_so_hop_dong
                                                        , v_dc_trang_thai_hop_dong
                                                        , v_dc_don_vi_quan_li
                                                        , v_str_ma_po_quan_ly
                                                        , v_dat_ngay_ki
                                                        , v_dat_ngay_hieu_luc
                                                        , m_ds_hop_dong_khung);

            m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;

            m_grv_dm_danh_sach_hop_dong_khung.DataBind();

        }

        catch (Exception v_e)
        {
            throw v_e;

        }

    }

    #endregion
    protected void cmd_them_moi_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("/TRMProject/ChucNang/F301_GdHopDongKhung.aspx?mode=add", false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_cmd_loc_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
           
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
}