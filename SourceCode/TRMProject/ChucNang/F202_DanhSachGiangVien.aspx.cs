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
            {
                load_cbo_don_vi_quan_ly();
                load_data_to_grid();              
            }
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
            throw v_e;

        }
    }
    private void load_cbo_don_vi_quan_ly()
    {
        try
        {
            m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.Clear();
            // Đổ dữ liệu vào DS 
            m_us_cm_dm_tu_dien.FillDataset(m_ds_cm_dm_tu_dien, " WHERE ID_LOAI_TU_DIEN = " + (int)e_loai_tu_dien.DON_VI_QUAN_LY_CHINH); // Đây là lấy theo điều kiện

            //TReo dữ liệu vào Dropdownlist loại hợp đồng
            // dây là giá trị hiển thị
            // Đây là giá trị thực
            m_cbo_dm_don_vi_quan_ly.DataValueField = CM_DM_TU_DIEN.ID;
            m_cbo_dm_don_vi_quan_ly.DataTextField = CM_DM_TU_DIEN.TEN;
            m_cbo_dm_don_vi_quan_ly.DataSource = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN;
            m_cbo_dm_don_vi_quan_ly.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }

    private void load_cbo_trang_thai_giang_vien()
    {
        try
        {
            m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN.Clear();
            // Đổ dữ liệu vào DS 
            m_us_cm_dm_tu_dien.FillDataset(m_ds_cm_dm_tu_dien, " WHERE ID_LOAI_TU_DIEN = " + (int)e_loai_tu_dien.TRANG_THAI_GIANG_VIEN); // Đây là lấy theo điều kiện

            //TReo dữ liệu vào Dropdownlist loại hợp đồng
            // dây là giá trị hiển thị
            // Đây là giá trị thực
            m_cbo_dm_trang_thai_giang_vien.DataValueField = CM_DM_TU_DIEN.MA_TU_DIEN    ;
            m_cbo_dm_trang_thai_giang_vien.DataTextField = CM_DM_TU_DIEN.TEN;
            m_cbo_dm_trang_thai_giang_vien.DataSource = m_ds_cm_dm_tu_dien.CM_DM_TU_DIEN;
            m_cbo_dm_trang_thai_giang_vien.DataBind();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }

    private void reset_control()
    {
        m_txt_name.Text = "";
        m_txt_chuc_vu_cao_nhat.Text = "";
        m_txt_chuc_vu_hien_tai.Text = "";
        m_txt_chuyen_nganh_chinh.Text = "";
        m_txt_email.Text = "";
        m_txt_co_quan_cong_tac.Text = "";
        m_txt_email_topica.Text = "";
        m_txt_hoc_ham.Text = "";
        m_txt_hoc_vi.Text = "";
        m_txt_ma_giang_vien.Text = "";
        m_txt_ma_so_thue.Text = "";
        m_txt_mobile_phone.Text = "";
        m_txt_noi_cap.Text = "";
        m_txt_so_cmnd.Text = "";
        m_txt_so_tai_khoan.Text = "";
        m_txt_tel_home.Text = "";
        m_txt_tel_office.Text = "";
        m_txt_ten_ngan_hang.Text = "";
        m_txt_truong_dao_tao.Text = "";
        m_txt_tu_khoa_tim_kiem.Text = "";
        rb_sex.Items[0].Selected = true;
        m_dat_ngay_cap.Text = "";
        m_dat_ngay_sinh_gv.Text = "";
    }
    private void form_2_us_object(US_V_DM_GIANG_VIEN ip_us_giang_vien)
    {
        ip_us_giang_vien.dcID_DON_VI_QUAN_LY =CIPConvert.ToDecimal(m_cbo_dm_don_vi_quan_ly.SelectedValue);
        ip_us_giang_vien.strCHUC_VU_CAO_NHAT = m_txt_chuc_vu_cao_nhat.Text;
        ip_us_giang_vien.strCHUC_VU_HIEN_TAI = m_txt_chuc_vu_hien_tai.Text;
        ip_us_giang_vien.strCHUYEN_NGANH_CHINH = m_txt_chuyen_nganh_chinh.Text;
        ip_us_giang_vien.strDESCRIPTION = m_txt_description.Text;
        ip_us_giang_vien.strEMAIL = m_txt_email.Text;
        ip_us_giang_vien.strEMAIL_TOPICA = m_txt_email_topica.Text;
        ip_us_giang_vien.strGIOI_TINH_YN = rb_sex.Items[0].Selected ? "Y" : "N";
        ip_us_giang_vien.strGV_DUYET_HL_YN = m_cbl_loai_hop_dong.Items[3].Selected ? "Y" : "N";
        ip_us_giang_vien.strGV_HDKH_YN = m_cbl_loai_hop_dong.Items[5].Selected ? "Y" : "N";
        ip_us_giang_vien.strGV_THAM_DINH_HL_YN = m_cbl_loai_hop_dong.Items[4].Selected ? "Y" : "N";
        ip_us_giang_vien.strGV_VIET_HL_YN = m_cbl_loai_hop_dong.Items[2].Selected ? "Y" : "N";
        ip_us_giang_vien.strGVCM_YN = m_cbl_loai_hop_dong.Items[1].Selected ? "Y" : "N";
        ip_us_giang_vien.strGVHD_YN = m_cbl_loai_hop_dong.Items[0].Selected ? "Y" : "N";
        ip_us_giang_vien.strHO_VA_TEN_DEM = m_txt_name.Text;
        ip_us_giang_vien.strHOC_HAM = m_txt_hoc_ham.Text;
        ip_us_giang_vien.strHOC_VI = m_txt_hoc_vi.Text;
        ip_us_giang_vien.strID_TRANG_THAI_GIANG_VIEN = m_cbo_dm_trang_thai_giang_vien.SelectedValue;
        ip_us_giang_vien.strMA_GIANG_VIEN = m_txt_ma_giang_vien.Text ;
        ip_us_giang_vien.strMA_SO_THUE = m_txt_ma_so_thue.Text;
        ip_us_giang_vien.strMOBILE_PHONE = m_txt_mobile_phone.Text;
        ip_us_giang_vien.strNOI_CAP = m_txt_noi_cap.Text;
        ip_us_giang_vien.strSO_CMTND = m_txt_so_cmnd.Text;
        ip_us_giang_vien.strSO_TAI_KHOAN= m_txt_so_tai_khoan.Text;
        ip_us_giang_vien.strTEL_HOME = m_txt_tel_home.Text;
        ip_us_giang_vien.strTEL_OFFICE = m_txt_tel_office.Text;
        ip_us_giang_vien.strTEN_CO_QUAN_CONG_TAC = m_txt_co_quan_cong_tac.Text;
        ip_us_giang_vien.strTEN_GIANG_VIEN = m_txt_name.Text;
        ip_us_giang_vien.strTEN_NGAN_HANG = m_txt_ten_ngan_hang.Text;
        ip_us_giang_vien.strTRUONG_DAO_TAO = m_txt_truong_dao_tao.Text;
    }

    private void us_object_2_form(US_V_DM_GIANG_VIEN ip_us_giang_vien)
    {
        m_cbo_dm_don_vi_quan_ly.SelectedValue =CIPConvert.ToStr(ip_us_giang_vien.dcID_DON_VI_QUAN_LY);
        m_txt_chuc_vu_cao_nhat.Text = ip_us_giang_vien.strCHUC_VU_CAO_NHAT;
        m_txt_chuc_vu_hien_tai.Text= ip_us_giang_vien.strCHUC_VU_HIEN_TAI;
        m_txt_chuyen_nganh_chinh.Text= ip_us_giang_vien.strCHUYEN_NGANH_CHINH;
        m_txt_description.Text= ip_us_giang_vien.strDESCRIPTION;
        m_txt_email.Text= ip_us_giang_vien.strEMAIL;
        m_txt_email_topica.Text= ip_us_giang_vien.strEMAIL_TOPICA;

        if (ip_us_giang_vien.strGIOI_TINH_YN == "Y") rb_sex.Items[0].Selected = true;
        else rb_sex.Items[1].Selected = true;
        if (ip_us_giang_vien.strGV_DUYET_HL_YN == "Y") m_cbl_loai_hop_dong.Items[3].Selected = true;
        else rb_sex.Items[0].Selected = false;
        if (ip_us_giang_vien.strGV_HDKH_YN == "Y") m_cbl_loai_hop_dong.Items[5].Selected = true;
        else rb_sex.Items[0].Selected = false;
        if (ip_us_giang_vien.strGV_THAM_DINH_HL_YN == "Y") m_cbl_loai_hop_dong.Items[4].Selected = true;
        else rb_sex.Items[0].Selected = false;
        if (ip_us_giang_vien.strGV_VIET_HL_YN == "Y") m_cbl_loai_hop_dong.Items[2].Selected = true;
        else rb_sex.Items[0].Selected = false;
        if (ip_us_giang_vien.strGVCM_YN == "Y") m_cbl_loai_hop_dong.Items[1].Selected = true;
        else rb_sex.Items[0].Selected = false;
        if (ip_us_giang_vien.strGVHD_YN == "Y") m_cbl_loai_hop_dong.Items[0].Selected = true;
        else rb_sex.Items[0].Selected = false;

        m_txt_name.Text= ip_us_giang_vien.strHO_VA_TEN_DEM;
        m_txt_hoc_ham.Text= ip_us_giang_vien.strHOC_HAM;
        m_txt_hoc_vi.Text= ip_us_giang_vien.strHOC_VI;
        m_cbo_dm_trang_thai_giang_vien.SelectedValue = ip_us_giang_vien.strID_TRANG_THAI_GIANG_VIEN;
        m_txt_ma_giang_vien.Text= ip_us_giang_vien.strMA_GIANG_VIEN;
        m_txt_ma_so_thue.Text= ip_us_giang_vien.strMA_SO_THUE;
        m_txt_mobile_phone.Text = ip_us_giang_vien.strMOBILE_PHONE;
        m_txt_noi_cap.Text = ip_us_giang_vien.strNOI_CAP;
        m_txt_so_cmnd.Text = ip_us_giang_vien.strSO_CMTND;
        m_txt_so_tai_khoan.Text = ip_us_giang_vien.strSO_TAI_KHOAN;
        m_txt_tel_home.Text = ip_us_giang_vien.strTEL_HOME;
        m_txt_tel_office.Text = ip_us_giang_vien.strTEL_OFFICE;
        m_txt_co_quan_cong_tac.Text = ip_us_giang_vien.strTEN_CO_QUAN_CONG_TAC;
        m_txt_name.Text =ip_us_giang_vien.strTEN_GIANG_VIEN;
        m_txt_ten_ngan_hang.Text = ip_us_giang_vien.strTEN_NGAN_HANG;
        m_txt_truong_dao_tao.Text = ip_us_giang_vien.strTRUONG_DAO_TAO;
    }

    private void delete_dm_mon_hoc(int ip_i_row_del)
    {
        decimal v_dc_id_ma_giang_vien = CIPConvert.ToDecimal(m_grv_dm_danh_sach_giang_vien.DataKeys[ip_i_row_del].Value);
        m_us_dm_giang_vien.dcID = v_dc_id_ma_giang_vien;
        m_us_dm_giang_vien.DeleteByID(v_dc_id_ma_giang_vien);
        m_lbl_mess.Text = "Xóa bản ghi thành công";
        load_data_to_grid();
    }
   
    private void load_data_2_us_by_id(int ip_i_id)
    {
        decimal v_dc_id_dm_giang_vien = CIPConvert.ToDecimal(m_grv_dm_danh_sach_giang_vien.DataKeys[ip_i_id].Value);
        hdf_id.Value = v_dc_id_dm_giang_vien.ToString();
        US_V_DM_GIANG_VIEN v_us_dm_giang_vien = new US_V_DM_GIANG_VIEN(v_dc_id_dm_giang_vien);
        // Đẩy us lên form
        us_object_2_form(v_us_dm_giang_vien);
    }

    private bool check_ma_giang_vien()
    {
        try
        {
            if (!m_us_dm_giang_vien.check_exist_ma_giang_vien(m_txt_ma_giang_vien.Text.TrimEnd())) return false;
            return true;
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
   
    private void save_data()
    {
        try
        {
            if (m_init_mode != DataEntryFormMode.UpdateDataState)
                m_us_dm_giang_vien.Insert();
            else m_us_dm_giang_vien.Update();
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
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
    protected void m_cmd_luu_du_lieu_Click(object sender, EventArgs e)
    {
        try
        {
            if (!check_ma_giang_vien())
            {
                m_lbl_mess.Text = "Mã giảng viên này đã tồn tại";
                return;
            }
            form_2_us_object(m_us_dm_giang_vien);
            if (m_init_mode == DataEntryFormMode.UpdateDataState) m_us_dm_giang_vien.dcID = CIPConvert.ToDecimal(hdf_id.Value);
            save_data();
            mtv_giang_vien.ActiveViewIndex = 1;
            load_data_to_grid();
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this,v_e);
        }
    }
    protected void m_cmd_thoat_Click(object sender, EventArgs e)
    {
        try
        {
            mtv_giang_vien.ActiveViewIndex = 1;
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void m_grv_dm_danh_sach_giang_vien_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            m_lbl_mess.Text = "";
            m_init_mode = DataEntryFormMode.UpdateDataState;
            mtv_giang_vien.ActiveViewIndex = 0;
            load_data_2_us_by_id(e.NewSelectedIndex);  
        }
        catch (Exception v_e)
        {
            CSystemLog_301.ExceptionHandle(this, v_e);
        }
    }
    protected void cmd_them_moi_Click(object sender, EventArgs e)
    {
        try
        {
            mtv_giang_vien.ActiveViewIndex = 0;
        }
        catch (Exception v_e)
        {
            throw v_e;
        }
    }
}