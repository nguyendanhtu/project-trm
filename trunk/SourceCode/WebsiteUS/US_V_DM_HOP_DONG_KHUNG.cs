﻿///************************************************
/// Generated by: linhdh
/// Date: 23/09/2011 05:21:52
/// Goal: Create User Service Class for V_DM_HOP_DONG_KHUNG
///************************************************
/// <summary>
/// Create User Service Class for V_DM_HOP_DONG_KHUNG
/// </summary>

using System;
using IP.Core.IPCommon;
using IP.Core.IPUserService;
using System.Data.SqlClient;
using System.Data;
using WebDS;


namespace WebUS{

public class US_V_DM_HOP_DONG_KHUNG : US_Object
{
	private const string c_TableName = "V_DM_HOP_DONG_KHUNG";

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

    public string strGIANG_VIEN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GIANG_VIEN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GIANG_VIEN"] = value;
        }
    }

    public bool IsGIANG_VIENNull()
    {
        return pm_objDR.IsNull("GIANG_VIEN");
    }

    public void SetGIANG_VIENNull()
    {
        pm_objDR["GIANG_VIEN"] = System.Convert.DBNull;
    }

    public DateTime datNGAY_KY
    {
        get
        {
            return CNull.RowNVLDate(pm_objDR, "NGAY_KY", IPConstants.c_DefaultDate);
        }
        set
        {
            pm_objDR["NGAY_KY"] = value;
        }
    }

    public bool IsNGAY_KYNull()
    {
        return pm_objDR.IsNull("NGAY_KY");
    }

    public void SetNGAY_KYNull()
    {
        pm_objDR["NGAY_KY"] = System.Convert.DBNull;
    }

    public DateTime datNGAY_HIEU_LUC
    {
        get
        {
            return CNull.RowNVLDate(pm_objDR, "NGAY_HIEU_LUC", IPConstants.c_DefaultDate);
        }
        set
        {
            pm_objDR["NGAY_HIEU_LUC"] = value;
        }
    }

    public bool IsNGAY_HIEU_LUCNull()
    {
        return pm_objDR.IsNull("NGAY_HIEU_LUC");
    }

    public void SetNGAY_HIEU_LUCNull()
    {
        pm_objDR["NGAY_HIEU_LUC"] = System.Convert.DBNull;
    }

    public DateTime datNGAY_KET_THUC_DU_KIEN
    {
        get
        {
            return CNull.RowNVLDate(pm_objDR, "NGAY_KET_THUC_DU_KIEN", IPConstants.c_DefaultDate);
        }
        set
        {
            pm_objDR["NGAY_KET_THUC_DU_KIEN"] = value;
        }
    }

    public bool IsNGAY_KET_THUC_DU_KIENNull()
    {
        return pm_objDR.IsNull("NGAY_KET_THUC_DU_KIEN");
    }

    public void SetNGAY_KET_THUC_DU_KIENNull()
    {
        pm_objDR["NGAY_KET_THUC_DU_KIEN"] = System.Convert.DBNull;
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

    public decimal dcID_LOAI_HOP_DONG
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_LOAI_HOP_DONG", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_LOAI_HOP_DONG"] = value;
        }
    }

    public bool IsID_LOAI_HOP_DONGNull()
    {
        return pm_objDR.IsNull("ID_LOAI_HOP_DONG");
    }

    public void SetID_LOAI_HOP_DONGNull()
    {
        pm_objDR["ID_LOAI_HOP_DONG"] = System.Convert.DBNull;
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

    public string strDON_VI_QUAN_LY
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "DON_VI_QUAN_LY", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["DON_VI_QUAN_LY"] = value;
        }
    }

    public bool IsDON_VI_QUAN_LYNull()
    {
        return pm_objDR.IsNull("DON_VI_QUAN_LY");
    }

    public void SetDON_VI_QUAN_LYNull()
    {
        pm_objDR["DON_VI_QUAN_LY"] = System.Convert.DBNull;
    }

    public string strGHI_CHU
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU"] = value;
        }
    }

    public bool IsGHI_CHUNull()
    {
        return pm_objDR.IsNull("GHI_CHU");
    }

    public void SetGHI_CHUNull()
    {
        pm_objDR["GHI_CHU"] = System.Convert.DBNull;
    }

    public decimal dcID_TRANG_THAI_HOP_DONG
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_TRANG_THAI_HOP_DONG", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_TRANG_THAI_HOP_DONG"] = value;
        }
    }

    public bool IsID_TRANG_THAI_HOP_DONGNull()
    {
        return pm_objDR.IsNull("ID_TRANG_THAI_HOP_DONG");
    }

    public void SetID_TRANG_THAI_HOP_DONGNull()
    {
        pm_objDR["ID_TRANG_THAI_HOP_DONG"] = System.Convert.DBNull;
    }

    public string strTRANG_THAI_HOP_DONG
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "TRANG_THAI_HOP_DONG", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["TRANG_THAI_HOP_DONG"] = value;
        }
    }

    public bool IsTRANG_THAI_HOP_DONGNull()
    {
        return pm_objDR.IsNull("TRANG_THAI_HOP_DONG");
    }

    public void SetTRANG_THAI_HOP_DONGNull()
    {
        pm_objDR["TRANG_THAI_HOP_DONG"] = System.Convert.DBNull;
    }

    public decimal dcID_DON_VI_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_DON_VI_THANH_TOAN", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_DON_VI_THANH_TOAN"] = value;
        }
    }

    public bool IsID_DON_VI_THANH_TOANNull()
    {
        return pm_objDR.IsNull("ID_DON_VI_THANH_TOAN");
    }

    public void SetID_DON_VI_THANH_TOANNull()
    {
        pm_objDR["ID_DON_VI_THANH_TOAN"] = System.Convert.DBNull;
    }

    public string strDON_VI_THANH_TOAN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "DON_VI_THANH_TOAN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["DON_VI_THANH_TOAN"] = value;
        }
    }

    public bool IsDON_VI_THANH_TOANNull()
    {
        return pm_objDR.IsNull("DON_VI_THANH_TOAN");
    }

    public void SetDON_VI_THANH_TOANNull()
    {
        pm_objDR["DON_VI_THANH_TOAN"] = System.Convert.DBNull;
    }

    public decimal dcTHUE_SUAT
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "THUE_SUAT", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["THUE_SUAT"] = value;
        }
    }

    public bool IsTHUE_SUATNull()
    {
        return pm_objDR.IsNull("THUE_SUAT");
    }

    public void SetTHUE_SUATNull()
    {
        pm_objDR["THUE_SUAT"] = System.Convert.DBNull;
    }

    public decimal dcID_MON1
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_MON1", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_MON1"] = value;
        }
    }

    public bool IsID_MON1Null()
    {
        return pm_objDR.IsNull("ID_MON1");
    }

    public void SetID_MON1Null()
    {
        pm_objDR["ID_MON1"] = System.Convert.DBNull;
    }

    public string strFIRST_MON
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "FIRST_MON", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["FIRST_MON"] = value;
        }
    }

    public bool IsFIRST_MONNull()
    {
        return pm_objDR.IsNull("FIRST_MON");
    }

    public void SetFIRST_MONNull()
    {
        pm_objDR["FIRST_MON"] = System.Convert.DBNull;
    }

    public decimal dcID_MON2
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_MON2", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_MON2"] = value;
        }
    }

    public bool IsID_MON2Null()
    {
        return pm_objDR.IsNull("ID_MON2");
    }

    public void SetID_MON2Null()
    {
        pm_objDR["ID_MON2"] = System.Convert.DBNull;
    }

    public string strSEC_MON
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "SEC_MON", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["SEC_MON"] = value;
        }
    }

    public bool IsSEC_MONNull()
    {
        return pm_objDR.IsNull("SEC_MON");
    }

    public void SetSEC_MONNull()
    {
        pm_objDR["SEC_MON"] = System.Convert.DBNull;
    }

    public decimal dcID_MON3
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_MON3", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_MON3"] = value;
        }
    }

    public bool IsID_MON3Null()
    {
        return pm_objDR.IsNull("ID_MON3");
    }

    public void SetID_MON3Null()
    {
        pm_objDR["ID_MON3"] = System.Convert.DBNull;
    }

    public string strTHIR_MON
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "THIR_MON", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["THIR_MON"] = value;
        }
    }

    public bool IsTHIR_MONNull()
    {
        return pm_objDR.IsNull("THIR_MON");
    }

    public void SetTHIR_MONNull()
    {
        pm_objDR["THIR_MON"] = System.Convert.DBNull;
    }

    public decimal dcID_MON4
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_MON4", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_MON4"] = value;
        }
    }

    public bool IsID_MON4Null()
    {
        return pm_objDR.IsNull("ID_MON4");
    }

    public void SetID_MON4Null()
    {
        pm_objDR["ID_MON4"] = System.Convert.DBNull;
    }

    public string strFOURTH_MON
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "FOURTH_MON", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["FOURTH_MON"] = value;
        }
    }

    public bool IsFOURTH_MONNull()
    {
        return pm_objDR.IsNull("FOURTH_MON");
    }

    public void SetFOURTH_MONNull()
    {
        pm_objDR["FOURTH_MON"] = System.Convert.DBNull;
    }

    public decimal dcID_MON5
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_MON5", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_MON5"] = value;
        }
    }

    public bool IsID_MON5Null()
    {
        return pm_objDR.IsNull("ID_MON5");
    }

    public void SetID_MON5Null()
    {
        pm_objDR["ID_MON5"] = System.Convert.DBNull;
    }

    public string strFITH_MON
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "FITH_MON", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["FITH_MON"] = value;
        }
    }

    public bool IsFITH_MONNull()
    {
        return pm_objDR.IsNull("FITH_MON");
    }

    public void SetFITH_MONNull()
    {
        pm_objDR["FITH_MON"] = System.Convert.DBNull;
    }

    public decimal dcID_MON6
    {
        get
        {
            return CNull.RowNVLDecimal(pm_objDR, "ID_MON6", IPConstants.c_DefaultDecimal);
        }
        set
        {
            pm_objDR["ID_MON6"] = value;
        }
    }

    public bool IsID_MON6Null()
    {
        return pm_objDR.IsNull("ID_MON6");
    }

    public void SetID_MON6Null()
    {
        pm_objDR["ID_MON6"] = System.Convert.DBNull;
    }

    public string strSIXTH_MON
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "SIXTH_MON", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["SIXTH_MON"] = value;
        }
    }

    public bool IsSIXTH_MONNull()
    {
        return pm_objDR.IsNull("SIXTH_MON");
    }

    public void SetSIXTH_MONNull()
    {
        pm_objDR["SIXTH_MON"] = System.Convert.DBNull;
    }

    public string strHOC_LIEU_YN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "HOC_LIEU_YN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["HOC_LIEU_YN"] = value;
        }
    }

    public bool IsHOC_LIEU_YNNull()
    {
        return pm_objDR.IsNull("HOC_LIEU_YN");
    }

    public void SetHOC_LIEU_YNNull()
    {
        pm_objDR["HOC_LIEU_YN"] = System.Convert.DBNull;
    }

    public string strVAN_HANH_YN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "VAN_HANH_YN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["VAN_HANH_YN"] = value;
        }
    }

    public bool IsVAN_HANH_YNNull()
    {
        return pm_objDR.IsNull("VAN_HANH_YN");
    }

    public void SetVAN_HANH_YNNull()
    {
        pm_objDR["VAN_HANH_YN"] = System.Convert.DBNull;
    }

    public string strMA_PO_PHU_TRACH
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "MA_PO_PHU_TRACH", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["MA_PO_PHU_TRACH"] = value;
        }
    }

    public bool IsMA_PO_PHU_TRACHNull()
    {
        return pm_objDR.IsNull("MA_PO_PHU_TRACH");
    }

    public void SetMA_PO_PHU_TRACHNull()
    {
        pm_objDR["MA_PO_PHU_TRACH"] = System.Convert.DBNull;
    }

    public string strGHI_CHU2
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU2", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU2"] = value;
        }
    }

    public bool IsGHI_CHU2Null()
    {
        return pm_objDR.IsNull("GHI_CHU2");
    }

    public void SetGHI_CHU2Null()
    {
        pm_objDR["GHI_CHU2"] = System.Convert.DBNull;
    }

    public string strGHI_CHU3
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU3", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU3"] = value;
        }
    }

    public bool IsGHI_CHU3Null()
    {
        return pm_objDR.IsNull("GHI_CHU3");
    }

    public void SetGHI_CHU3Null()
    {
        pm_objDR["GHI_CHU3"] = System.Convert.DBNull;
    }

    public string strGHI_CHU4
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GHI_CHU4", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GHI_CHU4"] = value;
        }
    }

    public bool IsGHI_CHU4Null()
    {
        return pm_objDR.IsNull("GHI_CHU4");
    }

    public void SetGHI_CHU4Null()
    {
        pm_objDR["GHI_CHU4"] = System.Convert.DBNull;
    }

    public string strCO_SO_HD_YN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "CO_SO_HD_YN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["CO_SO_HD_YN"] = value;
        }
    }

    public bool IsCO_SO_HD_YNNull()
    {
        return pm_objDR.IsNull("CO_SO_HD_YN");
    }

    public void SetCO_SO_HD_YNNull()
    {
        pm_objDR["CO_SO_HD_YN"] = System.Convert.DBNull;
    }

    public string strGEN_PHU_LUC_YN
    {
        get
        {
            return CNull.RowNVLString(pm_objDR, "GEN_PHU_LUC_YN", IPConstants.c_DefaultString);
        }
        set
        {
            pm_objDR["GEN_PHU_LUC_YN"] = value;
        }
    }

    public bool IsGEN_PHU_LUC_YNNull()
    {
        return pm_objDR.IsNull("GEN_PHU_LUC_YN");
    }

    public void SetGEN_PHU_LUC_YNNull()
    {
        pm_objDR["GEN_PHU_LUC_YN"] = System.Convert.DBNull;
    }

    #endregion

    #region "Init Functions"
    public US_V_DM_HOP_DONG_KHUNG()
    {
        pm_objDS = new DS_V_DM_HOP_DONG_KHUNG();
        pm_strTableName = c_TableName;
        pm_objDR = pm_objDS.Tables[pm_strTableName].NewRow();
    }

    public US_V_DM_HOP_DONG_KHUNG(DataRow i_objDR)
        : this()
    {
        this.DataRow2Me(i_objDR);
    }

    public US_V_DM_HOP_DONG_KHUNG(decimal i_dbID)
    {
        pm_objDS = new DS_V_DM_HOP_DONG_KHUNG();
        pm_strTableName = c_TableName;
        IMakeSelectCmd v_objMkCmd = new CMakeAndSelectCmd(pm_objDS, c_TableName);
        v_objMkCmd.AddCondition("ID", i_dbID, eKieuDuLieu.KieuNumber, eKieuSoSanh.Bang);
        SqlCommand v_cmdSQL;
        v_cmdSQL = v_objMkCmd.getSelectCmd();
        this.FillDatasetByCommand(pm_objDS, v_cmdSQL);
        pm_objDR = getRowClone(pm_objDS.Tables[pm_strTableName].Rows[0]);
    }
    #endregion

    #region Additional Methods
    public bool check_exist_so_hd(string ip_str_so_hd)
    {
        US_V_DM_HOP_DONG_KHUNG v_us_hop_dong_khung= new US_V_DM_HOP_DONG_KHUNG();
        DS_V_DM_HOP_DONG_KHUNG v_ds_hd_khung = new DS_V_DM_HOP_DONG_KHUNG();

        v_us_hop_dong_khung.FillDataset(v_ds_hd_khung, " where SO_HOP_DONG = '" + ip_str_so_hd + "'");
        if (v_ds_hd_khung.V_DM_HOP_DONG_KHUNG.Rows.Count == 0) return false;  //Mã này chưa có, insert được
        return true;
    }

    public void search_hop_dong_khung(string ip_str_ten_giang_vien

                                , string ip_str_tu_khoa_search

                                , string ip_so_hop_dong

                                , decimal ip_dc_id_loai_hop_dong

                                , decimal ip_dc_id_trang_thai_hop_dong

                                , decimal ip_dc_id_don_vi_quan_ly

                                , DateTime ip_dat_ngay_ky

                                 , DateTime ip_dat_ngay_hieu_luc
                                 , DateTime ip_dat_ngay_ket_thuc

                                , string ip_str_ma_po_quan_ly

                                , DS_V_DM_HOP_DONG_KHUNG op_ds_dm_hop_dong_khung)
    {

        CStoredProc v_sp_search_hop_dong_khung = new CStoredProc("pr_V_DM_HOP_DONG_KHUNG_Search");

        v_sp_search_hop_dong_khung.addNVarcharInputParam("@TEN_GIANG_VIEN", ip_str_ten_giang_vien);

        v_sp_search_hop_dong_khung.addNVarcharInputParam("@TU_KHOA", ip_str_tu_khoa_search);

        v_sp_search_hop_dong_khung.addNVarcharInputParam("@SO_HOP_DONG", ip_so_hop_dong);

        v_sp_search_hop_dong_khung.addDecimalInputParam("@LOAI_HOP_DONG", ip_dc_id_loai_hop_dong);

        v_sp_search_hop_dong_khung.addDecimalInputParam("@TRANG_THAI_HOP_DONG", ip_dc_id_trang_thai_hop_dong);

        v_sp_search_hop_dong_khung.addDecimalInputParam("@DON_VI_QUAN_LY", ip_dc_id_don_vi_quan_ly);

        v_sp_search_hop_dong_khung.addDatetimeInputParam("@NGAY_KY", ip_dat_ngay_ky);

        v_sp_search_hop_dong_khung.addDatetimeInputParam("@NGAY_HIEU_LUC", ip_dat_ngay_hieu_luc);
        v_sp_search_hop_dong_khung.addDatetimeInputParam("@NGAY_KET_THUC", ip_dat_ngay_ket_thuc);

        v_sp_search_hop_dong_khung.addNVarcharInputParam("@MA_PO_QUAN_LY", ip_str_ma_po_quan_ly);

        v_sp_search_hop_dong_khung.fillDataSetByCommand(this, op_ds_dm_hop_dong_khung);

    }
    
    public void insert_and_gen_phu_luc()
    {
        this.strGEN_PHU_LUC_YN = "Y";
        this.Insert();
    }

    #endregion
}
}
