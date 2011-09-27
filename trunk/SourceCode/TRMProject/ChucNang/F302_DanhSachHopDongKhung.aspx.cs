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

    public string get_ma_gv_form_id(decimal ip_dc_gv_id)
    {
        try
        {
            m_ds_dm_giang_vien.Clear();
            m_us_dm_giang_vien.FillDataset(m_ds_dm_giang_vien, " WHERE ID=" + ip_dc_gv_id);
            return m_ds_dm_giang_vien.V_DM_GIANG_VIEN.Rows[0][V_DM_GIANG_VIEN.MA_GIANG_VIEN].ToString();
        }
        catch (Exception v_e)
        {
            
            throw v_e;
        }
    }

    //private void get_form_search_data_and_load_to_grid()
    //{

    //    try
    //    {

    //        // thu thập dữ liệu

    //        string v_str_ten_giang_vien = m_txt_ten_giang_vien.Text.Trim();

    //        string v_str_search_key_word = m_txt_tu_khoa_tim_kiem.Text.Trim();

    //        string v_str_so_hop_dong = m_txt_so_hop_dong.Text.Trim();

    //        decimal v_dc_loai_hop_dong = CIPConvert.ToDecimal(m_cbo_dm_loai_hop_dong.SelectedValue);

    //        decimal v_dc_trang_thai_hop_dong = CIPConvert.ToDecimal(m_cbo_dm_trang_thai_hop_dong.SelectedValue);

    //        decimal v_dc_don_vi_quan_li = CIPConvert.ToDecimal(m_cbo_dm_loai_don_vi_quan_li.SelectedValue);

    //        DateTime v_dat_ngay_ky = CIPConvert.ToDatetime(m_dat_ngay_ki.Text);

    //        DateTime v_dat_ngay_hieu_luc = CIPConvert.ToDatetime(m_dat_ngay_hieu_luc.Text);

    //        DateTime v_dat_ngay_ket_thuc = CIPConvert.ToDatetime(m_dat_ngay_ket_thuc.Text);

    //        // Search

    //        m_us_dm_hop_dong_khung.search_hop_dong_khung(v_str_ten_giang_vien

    //                                            , v_str_search_key_word

    //                                            , v_str_so_hop_dong

    //                                            , v_dc_loai_hop_dong

    //                                            , v_dc_trang_thai_hop_dong

    //                                            , v_dc_don_vi_quan_li

    //                                            , v_dat_ngay_ky

    //                                            , v_dat_ngay_hieu_luc

    //                                            , v_dat_ngay_ket_thuc

    //                                            , m_ds_hop_dong_khung);

    //        m_grv_dm_danh_sach_hop_dong_khung.DataSource = m_ds_hop_dong_khung.V_DM_HOP_DONG_KHUNG;

    //        m_grv_dm_danh_sach_hop_dong_khung.DataBind();

    //    }

    //    catch (Exception v_e)
    //    {
    //        throw v_e;

    //    }

    //}

    #endregion
}