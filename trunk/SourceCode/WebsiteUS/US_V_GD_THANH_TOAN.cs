﻿///************************************************
/// Generated by: linhdh
/// Date: 16/11/2011 11:47:16
/// Goal: Create User Service Class for V_GD_THANH_TOAN
///************************************************
/// <summary>
/// Create User Service Class for V_GD_THANH_TOAN
/// </summary>

using System;
using IP.Core.IPCommon;
using IP.Core.IPUserService;
using System.Data.SqlClient;
using System.Data;
using WebDS;


namespace WebUS{

public class US_V_GD_THANH_TOAN : US_Object
{
	private const string c_TableName = "V_GD_THANH_TOAN";

    #region "Public Properties"
    public decimal dcID
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID"] = value;
        }
    }

    public bool IsIDNull()
    {
        return pm_objDR.IsNull("ID");
    }

    public void SetIDNull()
    {
        pm_objDR["ID"] = System.Convert.DBNull;
    }

    public string strSO_PHIEU_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "SO_PHIEU_THANH_TOAN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["SO_PHIEU_THANH_TOAN"] = value;
        }
    }

    public bool IsSO_PHIEU_THANH_TOANNull()
    {
        return pm_objDR.IsNull("SO_PHIEU_THANH_TOAN");
    }

    public void SetSO_PHIEU_THANH_TOANNull()
    {
        pm_objDR["SO_PHIEU_THANH_TOAN"] = System.Convert.DBNull;
    }

    public decimal dcID_HOP_DONG_KHUNG
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_HOP_DONG_KHUNG", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_HOP_DONG_KHUNG"] = value;
        }
    }

    public bool IsID_HOP_DONG_KHUNGNull()
    {
        return pm_objDR.IsNull("ID_HOP_DONG_KHUNG");
    }

    public void SetID_HOP_DONG_KHUNGNull()
    {
        pm_objDR["ID_HOP_DONG_KHUNG"] = System.Convert.DBNull;
    }

    public string strLOAI_HOP_DONG
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "LOAI_HOP_DONG", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["LOAI_HOP_DONG"] = value;
        }
    }

    public bool IsLOAI_HOP_DONGNull()
    {
        return pm_objDR.IsNull("LOAI_HOP_DONG");
    }

    public void SetLOAI_HOP_DONGNull()
    {
        pm_objDR["LOAI_HOP_DONG"] = System.Convert.DBNull;
    }

    public decimal dcID_GIANG_VIEN
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_GIANG_VIEN", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_GIANG_VIEN"] = value;
        }
    }

    public bool IsID_GIANG_VIENNull()
    {
        return pm_objDR.IsNull("ID_GIANG_VIEN");
    }

    public void SetID_GIANG_VIENNull()
    {
        pm_objDR["ID_GIANG_VIEN"] = System.Convert.DBNull;
    }

    public string strTEN_GIANG_VIEN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "TEN_GIANG_VIEN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["TEN_GIANG_VIEN"] = value;
        }
    }

    public bool IsTEN_GIANG_VIENNull()
    {
        return pm_objDR.IsNull("TEN_GIANG_VIEN");
    }

    public void SetTEN_GIANG_VIENNull()
    {
        pm_objDR["TEN_GIANG_VIEN"] = System.Convert.DBNull;
    }

    public string strSO_TAI_KHOAN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "SO_TAI_KHOAN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["SO_TAI_KHOAN"] = value;
        }
    }

    public bool IsSO_TAI_KHOANNull()
    {
        return pm_objDR.IsNull("SO_TAI_KHOAN");
    }

    public void SetSO_TAI_KHOANNull()
    {
        pm_objDR["SO_TAI_KHOAN"] = System.Convert.DBNull;
    }

    public string strTEN_NGAN_HANG
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "TEN_NGAN_HANG", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["TEN_NGAN_HANG"] = value;
        }
    }

    public bool IsTEN_NGAN_HANGNull()
    {
        return pm_objDR.IsNull("TEN_NGAN_HANG");
    }

    public void SetTEN_NGAN_HANGNull()
    {
        pm_objDR["TEN_NGAN_HANG"] = System.Convert.DBNull;
    }

    public string strMA_SO_THUE
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "MA_SO_THUE", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["MA_SO_THUE"] = value;
        }
    }

    public bool IsMA_SO_THUENull()
    {
        return pm_objDR.IsNull("MA_SO_THUE");
    }

    public void SetMA_SO_THUENull()
    {
        pm_objDR["MA_SO_THUE"] = System.Convert.DBNull;
    }

    public string strREFERENCE_CODE
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "REFERENCE_CODE", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["REFERENCE_CODE"] = value;
        }
    }

    public bool IsREFERENCE_CODENull()
    {
        return pm_objDR.IsNull("REFERENCE_CODE");
    }

    public void SetREFERENCE_CODENull()
    {
        pm_objDR["REFERENCE_CODE"] = System.Convert.DBNull;
    }

    public decimal dcID_MON_HOC
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_MON_HOC", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_MON_HOC"] = value;
        }
    }

    public bool IsID_MON_HOCNull()
    {
        return pm_objDR.IsNull("ID_MON_HOC");
    }

    public void SetID_MON_HOCNull()
    {
        pm_objDR["ID_MON_HOC"] = System.Convert.DBNull;
    }

    public DateTime datNGAY_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLDate(pm_objDR, "NGAY_THANH_TOAN", IPConstants.c_DefaultDate);
        }
        set
        {
            pm_objDR["NGAY_THANH_TOAN"] = value;
        }
    }

    public bool IsNGAY_THANH_TOANNull()
    {
        return pm_objDR.IsNull("NGAY_THANH_TOAN");
    }

    public void SetNGAY_THANH_TOANNull()
    {
        pm_objDR["NGAY_THANH_TOAN"] = System.Convert.DBNull;
    }

    public string strDESCRIPTION
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "DESCRIPTION", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["DESCRIPTION"] = value;
        }
    }

    public bool IsDESCRIPTIONNull()
    {
        return pm_objDR.IsNull("DESCRIPTION");
    }

    public void SetDESCRIPTIONNull()
    {
        pm_objDR["DESCRIPTION"] = System.Convert.DBNull;
    }

    public decimal dcDA_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "DA_THANH_TOAN", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["DA_THANH_TOAN"] = value;
        }
    }

    public bool IsDA_THANH_TOANNull()
    {
        return pm_objDR.IsNull("DA_THANH_TOAN");
    }

    public void SetDA_THANH_TOANNull()
    {
        pm_objDR["DA_THANH_TOAN"] = System.Convert.DBNull;
    }

    public decimal dcCON_PHAI_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "CON_PHAI_THANH_TOAN", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["CON_PHAI_THANH_TOAN"] = value;
        }
    }

    public bool IsCON_PHAI_THANH_TOANNull()
    {
        return pm_objDR.IsNull("CON_PHAI_THANH_TOAN");
    }

    public void SetCON_PHAI_THANH_TOANNull()
    {
        pm_objDR["CON_PHAI_THANH_TOAN"] = System.Convert.DBNull;
    }

    public decimal dcTONG_TIEN_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "TONG_TIEN_THANH_TOAN", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["TONG_TIEN_THANH_TOAN"] = value;
        }
    }

    public bool IsTONG_TIEN_THANH_TOANNull()
    {
        return pm_objDR.IsNull("TONG_TIEN_THANH_TOAN");
    }

    public void SetTONG_TIEN_THANH_TOANNull()
    {
        pm_objDR["TONG_TIEN_THANH_TOAN"] = System.Convert.DBNull;
    }

    public decimal dcGIA_TRI_NGHIEM_THU_THUC_TE
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "GIA_TRI_NGHIEM_THU_THUC_TE", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["GIA_TRI_NGHIEM_THU_THUC_TE"] = value;
        }
    }

    public bool IsGIA_TRI_NGHIEM_THU_THUC_TENull()
    {
        return pm_objDR.IsNull("GIA_TRI_NGHIEM_THU_THUC_TE");
    }

    public void SetGIA_TRI_NGHIEM_THU_THUC_TENull()
    {
        pm_objDR["GIA_TRI_NGHIEM_THU_THUC_TE"] = System.Convert.DBNull;
    }

    public string strSO_HOP_DONG
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "SO_HOP_DONG", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["SO_HOP_DONG"] = value;
        }
    }

    public bool IsSO_HOP_DONGNull()
    {
        return pm_objDR.IsNull("SO_HOP_DONG");
    }

    public void SetSO_HOP_DONGNull()
    {
        pm_objDR["SO_HOP_DONG"] = System.Convert.DBNull;
    }

    public string strTHOI_GIAN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "THOI_GIAN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["THOI_GIAN"] = value;
        }
    }

    public bool IsTHOI_GIANNull()
    {
        return pm_objDR.IsNull("THOI_GIAN");
    }

    public void SetTHOI_GIANNull()
    {
        pm_objDR["THOI_GIAN"] = System.Convert.DBNull;
    }

    public decimal dcID_DON_VI_QUAN_LY
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_DON_VI_QUAN_LY", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_DON_VI_QUAN_LY"] = value;
        }
    }

    public bool IsID_DON_VI_QUAN_LYNull()
    {
        return pm_objDR.IsNull("ID_DON_VI_QUAN_LY");
    }

    public void SetID_DON_VI_QUAN_LYNull()
    {
        pm_objDR["ID_DON_VI_QUAN_LY"] = System.Convert.DBNull;
    }

    public decimal dcGIA_TRI_HOP_DONG
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "GIA_TRI_HOP_DONG", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["GIA_TRI_HOP_DONG"] = value;
        }
    }

    public bool IsGIA_TRI_HOP_DONGNull()
    {
        return pm_objDR.IsNull("GIA_TRI_HOP_DONG");
    }

    public void SetGIA_TRI_HOP_DONGNull()
    {
        pm_objDR["GIA_TRI_HOP_DONG"] = System.Convert.DBNull;
    }

    public string strPO_PHU_TRACH_CHINH
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "PO_PHU_TRACH_CHINH", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["PO_PHU_TRACH_CHINH"] = value;
        }
    }

    public bool IsPO_PHU_TRACH_CHINHNull()
    {
        return pm_objDR.IsNull("PO_PHU_TRACH_CHINH");
    }

    public void SetPO_PHU_TRACH_CHINHNull()
    {
        pm_objDR["PO_PHU_TRACH_CHINH"] = System.Convert.DBNull;
    }

    public string strPO_PHU_TRACH_PHU
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "PO_PHU_TRACH_PHU", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["PO_PHU_TRACH_PHU"] = value;
        }
    }

    public bool IsPO_PHU_TRACH_PHUNull()
    {
        return pm_objDR.IsNull("PO_PHU_TRACH_PHU");
    }

    public void SetPO_PHU_TRACH_PHUNull()
    {
        pm_objDR["PO_PHU_TRACH_PHU"] = System.Convert.DBNull;
    }

    public decimal dcSO_TIEN_THUE
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "SO_TIEN_THUE", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["SO_TIEN_THUE"] = value;
        }
    }

    public bool IsSO_TIEN_THUENull()
    {
        return pm_objDR.IsNull("SO_TIEN_THUE");
    }

    public void SetSO_TIEN_THUENull()
    {
        pm_objDR["SO_TIEN_THUE"] = System.Convert.DBNull;
    }

    public decimal dcTONG_TIEN_THUC_NHAN
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "TONG_TIEN_THUC_NHAN", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["TONG_TIEN_THUC_NHAN"] = value;
        }
    }

    public bool IsTONG_TIEN_THUC_NHANNull()
    {
        return pm_objDR.IsNull("TONG_TIEN_THUC_NHAN");
    }

    public void SetTONG_TIEN_THUC_NHANNull()
    {
        pm_objDR["TONG_TIEN_THUC_NHAN"] = System.Convert.DBNull;
    }

    public decimal dcID_TRANG_THAI_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_TRANG_THAI_THANH_TOAN", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_TRANG_THAI_THANH_TOAN"] = value;
        }
    }

    public bool IsID_TRANG_THAI_THANH_TOANNull()
    {
        return pm_objDR.IsNull("ID_TRANG_THAI_THANH_TOAN");
    }

    public void SetID_TRANG_THAI_THANH_TOANNull()
    {
        pm_objDR["ID_TRANG_THAI_THANH_TOAN"] = System.Convert.DBNull;
    }

    public string strPO_LAP_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "PO_LAP_THANH_TOAN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["PO_LAP_THANH_TOAN"] = value;
        }
    }

    public bool IsPO_LAP_THANH_TOANNull()
    {
        return pm_objDR.IsNull("PO_LAP_THANH_TOAN");
    }

    public void SetPO_LAP_THANH_TOANNull()
    {
        pm_objDR["PO_LAP_THANH_TOAN"] = System.Convert.DBNull;
    }

    public string strGHI_CHU_CAC_MON_PHU_TRACH
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU_CAC_MON_PHU_TRACH", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU_CAC_MON_PHU_TRACH"] = value;
        }
    }

    public bool IsGHI_CHU_CAC_MON_PHU_TRACHNull()
    {
        return pm_objDR.IsNull("GHI_CHU_CAC_MON_PHU_TRACH");
    }

    public void SetGHI_CHU_CAC_MON_PHU_TRACHNull()
    {
        pm_objDR["GHI_CHU_CAC_MON_PHU_TRACH"] = System.Convert.DBNull;
    }

    public string strGHI_CHU_THOI_GIAN_LOP_MON
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU_THOI_GIAN_LOP_MON", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU_THOI_GIAN_LOP_MON"] = value;
        }
    }

    public bool IsGHI_CHU_THOI_GIAN_LOP_MONNull()
    {
        return pm_objDR.IsNull("GHI_CHU_THOI_GIAN_LOP_MON");
    }

    public void SetGHI_CHU_THOI_GIAN_LOP_MONNull()
    {
        pm_objDR["GHI_CHU_THOI_GIAN_LOP_MON"] = System.Convert.DBNull;
    }

    public string strGHI_CHU_HE_SO_DON_GIA
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU_HE_SO_DON_GIA", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU_HE_SO_DON_GIA"] = value;
        }
    }

    public bool IsGHI_CHU_HE_SO_DON_GIANull()
    {
        return pm_objDR.IsNull("GHI_CHU_HE_SO_DON_GIA");
    }

    public void SetGHI_CHU_HE_SO_DON_GIANull()
    {
        pm_objDR["GHI_CHU_HE_SO_DON_GIA"] = System.Convert.DBNull;
    }

    public string strGHI_CHU_4
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU_4", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU_4"] = value;
        }
    }

    public bool IsGHI_CHU_4Null()
    {
        return pm_objDR.IsNull("GHI_CHU_4");
    }

    public void SetGHI_CHU_4Null()
    {
        pm_objDR["GHI_CHU_4"] = System.Convert.DBNull;
    }

    public string strGHI_CHU_5
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU_5", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU_5"] = value;
        }
    }

    public bool IsGHI_CHU_5Null()
    {
        return pm_objDR.IsNull("GHI_CHU_5");
    }

    public void SetGHI_CHU_5Null()
    {
        pm_objDR["GHI_CHU_5"] = System.Convert.DBNull;
    }
    #endregion
    
    #region "Init Functions"
	public US_V_GD_THANH_TOAN() 
	{
		pm_objDS = new DS_V_GD_THANH_TOAN();
		pm_strTableName = c_TableName;
		pm_objDR = pm_objDS.Tables[pm_strTableName].NewRow();
	}

	public US_V_GD_THANH_TOAN(DataRow i_objDR): this()
	{
		this.DataRow2Me(i_objDR);
	}

	public US_V_GD_THANH_TOAN(decimal i_dbID) 
	{
		pm_objDS = new DS_V_GD_THANH_TOAN();
		pm_strTableName = c_TableName;
		IMakeSelectCmd v_objMkCmd = new CMakeAndSelectCmd(pm_objDS, c_TableName);
		v_objMkCmd.AddCondition("ID", i_dbID, eKieuDuLieu.KieuNumber, eKieuSoSanh.Bang);
		SqlCommand v_cmdSQL;
		v_cmdSQL = v_objMkCmd.getSelectCmd();
		this.FillDatasetByCommand(pm_objDS, v_cmdSQL);
		pm_objDR = getRowClone(pm_objDS.Tables[pm_strTableName].Rows[0]);
	}
#endregion

    #region Additional Functions
    public void update_xac_nhan_ngan_hang()
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_Update_NganHang");
        v_cstore.addDecimalInputParam("@ID",this.dcID);
        v_cstore.addDecimalInputParam("@ID_TRANG_THAI_THANH_TOAN", this.dcID_TRANG_THAI_THANH_TOAN);
        // Cập nhật cả Mô tả của thanh toán chứa mã đợt thanh toán cũ của thanh toán
        v_cstore.addNVarcharInputParam("@DESCRIPTION", this.strDESCRIPTION);
        v_cstore.ExecuteCommand(this);
    }
    public void update_xac_nhan_giang_vien()
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_Update_GiangVien");
        v_cstore.addDecimalInputParam("@ID", this.dcID);
        v_cstore.addDecimalInputParam("@ID_TRANG_THAI_THANH_TOAN", this.dcID_TRANG_THAI_THANH_TOAN);
        v_cstore.ExecuteCommand(this);
    }
    public void duyet_xac_nhan_giang_vien()
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_Update_GiangVien");
        v_cstore.addDecimalInputParam("@ID", this.dcID);
        v_cstore.addDecimalInputParam("@ID_TRANG_THAI_THANH_TOAN", this.dcID_TRANG_THAI_THANH_TOAN);
        v_cstore.ExecuteCommand(this);
    }
    public void xu_ly_xac_nhan_ngan_hang()
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_Xac_Nhan_NganHang");
        v_cstore.addDecimalInputParam("@ID", this.dcID);
        v_cstore.ExecuteCommand(this);
    }
    public void chinh_sua_chung_tu()
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_Chinh_Sua_Chung_Tu");
        v_cstore.addDecimalInputParam("@ID", this.dcID);
        v_cstore.addDecimalInputParam("@ID_TRANG_THAI_THANH_TOAN", this.dcID_TRANG_THAI_THANH_TOAN);
        v_cstore.addNVarcharInputParam("@DESCRIPTION", this.strDESCRIPTION);
        v_cstore.ExecuteCommand(this);
    }
    public decimal get_so_tien_da_thanh_toan(DS_V_GD_THANH_TOAN op_v_ds_gd_tt)
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_Tinh_So_Tien_Da_Thanh_Toan");
        v_cstore.addDecimalInputParam("@ID_HOP_DONG_KHUNG", this.dcID_HOP_DONG_KHUNG);
        v_cstore.fillDataSetByCommand(this, op_v_ds_gd_tt);
        if (op_v_ds_gd_tt.V_GD_THANH_TOAN.Rows[0][0] == null)
            return 0;
        return CIPConvert.ToDecimal(op_v_ds_gd_tt.V_GD_THANH_TOAN.Rows[0][0]);
    }
    public void fill_dataset_by_dot_tt_va_loai_hd(string ip_str_ma_dot, string ip_str_loai_hd, decimal ip_dc_thang_tt, decimal ip_dc_nam_tt,decimal ip_dc_dv_thanh_toan, DS_V_GD_THANH_TOAN ip_ds_gd_thanh_toan)
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_GetThanhToanByDotAndLoaiHD");
        v_cstore.addNVarcharInputParam("@MA_DOT_TT", ip_str_ma_dot);
        v_cstore.addNVarcharInputParam("@LOAI_HOP_DONG", ip_str_loai_hd);
        v_cstore.addDecimalInputParam("@THANG_TT", ip_dc_thang_tt);
        v_cstore.addDecimalInputParam("@NAM_TT", ip_dc_nam_tt);
        v_cstore.addDecimalInputParam("@ID_DON_VI_TT", ip_dc_dv_thanh_toan);
        v_cstore.fillDataSetByCommand(this, ip_ds_gd_thanh_toan);
    }
    public void fill_dataset_by_giang_vien_va_dv_thanh_toan(decimal ip_dc_id_giang_vien, 
                                                            decimal ip_dc_dv_thanh_toan, 
                                                            string ip_str_loai_hop_dong, 
                                                            decimal ip_dc_thang_tt,
                                                            decimal ip_dc_nam_tt,
                                                            DS_V_GD_THANH_TOAN ip_ds_gd_thanh_toan)
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_GetThanhToanByGiangVienvaDVThanhToan");
        v_cstore.addDecimalInputParam("@ID_GIANG_VIEN", ip_dc_id_giang_vien);
        v_cstore.addDecimalInputParam("@ID_DON_VI_TT", ip_dc_dv_thanh_toan);
        v_cstore.addDecimalInputParam("@THANG_TT", ip_dc_thang_tt);
        v_cstore.addDecimalInputParam("@NAM_TT", ip_dc_nam_tt);
        v_cstore.addNVarcharInputParam("@LOAI_HOP_DONG", ip_str_loai_hop_dong);
        v_cstore.fillDataSetByCommand(this, ip_ds_gd_thanh_toan);
    }
    public void fill_dataset_by_so_hop_dong(string ip_str_loai_hop_dong,
                                            string ip_str_so_hop_dong,
                                            DS_V_GD_THANH_TOAN ip_ds_gd_thanh_toan)
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_GetThanhToanBySoHopDong");
        v_cstore.addNVarcharInputParam("@LOAI_HOP_DONG", ip_str_loai_hop_dong);
        v_cstore.addNVarcharInputParam("@SO_HOP_DONG", ip_str_so_hop_dong);
        v_cstore.fillDataSetByCommand(this, ip_ds_gd_thanh_toan);
    }
    public void fill_dataset_by_po_phu_trach_va_thoi_gian(string ip_str_po_phu_trach,
                                                            string ip_str_loai_hop_dong,
                                                            decimal ip_dc_thang_tt,
                                                            decimal ip_dc_nam_tt,
                                                            DS_V_GD_THANH_TOAN ip_ds_gd_thanh_toan)
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_GetThanhToanByPOPhuTrachvaThoiGian");
        v_cstore.addNVarcharInputParam("@PO_PHU_TRACH", ip_str_po_phu_trach);
        v_cstore.addDecimalInputParam("@THANG_TT", ip_dc_thang_tt);
        v_cstore.addDecimalInputParam("@NAM_TT", ip_dc_nam_tt);
        v_cstore.addNVarcharInputParam("@LOAI_HOP_DONG", ip_str_loai_hop_dong);
        v_cstore.fillDataSetByCommand(this, ip_ds_gd_thanh_toan);
    }
    #endregion
}
}
