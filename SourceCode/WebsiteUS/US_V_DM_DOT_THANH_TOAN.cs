///************************************************
/// Generated by: linhdh
/// Date: 09/11/2011 05:50:22
/// Goal: Create User Service Class for V_DM_DOT_THANH_TOAN
///************************************************
/// <summary>
/// Create User Service Class for V_DM_DOT_THANH_TOAN
/// </summary>

using System;
using IP.Core.IPCommon;
using IP.Core.IPUserService;
using System.Data.SqlClient;
using System.Data;
using WebDS;


namespace WebUS{

public class US_V_DM_DOT_THANH_TOAN : US_Object
{
	private const string c_TableName = "V_DM_DOT_THANH_TOAN";
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

	public bool IsIDNull()	{
		return pm_objDR.IsNull("ID");
	}

	public void SetIDNull() {
		pm_objDR["ID"] = System.Convert.DBNull;
	}

	public string strMA_DOT_TT 
	{
		get 
		{
			return CNull.RowNVLString(pm_objDR, "MA_DOT_TT", IPConstants.c_DefaultString);
		}
		set 
		{
			pm_objDR["MA_DOT_TT"] = value;
		}
	}

	public bool IsMA_DOT_TTNull() 
	{
		return pm_objDR.IsNull("MA_DOT_TT");
	}

	public void SetMA_DOT_TTNull() {
		pm_objDR["MA_DOT_TT"] = System.Convert.DBNull;
	}

	public string strTEN_DOT_TT 
	{
		get 
		{
			return CNull.RowNVLString(pm_objDR, "TEN_DOT_TT", IPConstants.c_DefaultString);
		}
		set 
		{
			pm_objDR["TEN_DOT_TT"] = value;
		}
	}

	public bool IsTEN_DOT_TTNull() 
	{
		return pm_objDR.IsNull("TEN_DOT_TT");
	}

	public void SetTEN_DOT_TTNull() {
		pm_objDR["TEN_DOT_TT"] = System.Convert.DBNull;
	}

	public DateTime datNGAY_TT_DU_KIEN
	{
		get   
		{
			return CNull.RowNVLDate(pm_objDR, "NGAY_TT_DU_KIEN", IPConstants.c_DefaultDate);
		}
		set   
		{
			pm_objDR["NGAY_TT_DU_KIEN"] = value;
		}
	}

	public bool IsNGAY_TT_DU_KIENNull()
	{
		return pm_objDR.IsNull("NGAY_TT_DU_KIEN");
	}

	public void SetNGAY_TT_DU_KIENNull()
	{
		pm_objDR["NGAY_TT_DU_KIEN"] = System.Convert.DBNull;
	}

	public decimal dcID_TRANG_THAI_DOT_TT 
	{
		get
		{
			return CNull.RowNVLDecimal(pm_objDR, "ID_TRANG_THAI_DOT_TT", IPConstants.c_DefaultDecimal);
		}
		set	
		{
			pm_objDR["ID_TRANG_THAI_DOT_TT"] = value;
		}
	}

	public bool IsID_TRANG_THAI_DOT_TTNull()	{
		return pm_objDR.IsNull("ID_TRANG_THAI_DOT_TT");
	}

	public void SetID_TRANG_THAI_DOT_TTNull() {
		pm_objDR["ID_TRANG_THAI_DOT_TT"] = System.Convert.DBNull;
	}

	public string strTRANG_THAI_DOT_TT 
	{
		get 
		{
			return CNull.RowNVLString(pm_objDR, "TRANG_THAI_DOT_TT", IPConstants.c_DefaultString);
		}
		set 
		{
			pm_objDR["TRANG_THAI_DOT_TT"] = value;
		}
	}

	public bool IsTRANG_THAI_DOT_TTNull() 
	{
		return pm_objDR.IsNull("TRANG_THAI_DOT_TT");
	}

	public void SetTRANG_THAI_DOT_TTNull() {
		pm_objDR["TRANG_THAI_DOT_TT"] = System.Convert.DBNull;
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

	public bool IsID_DON_VI_THANH_TOANNull()	{
		return pm_objDR.IsNull("ID_DON_VI_THANH_TOAN");
	}

	public void SetID_DON_VI_THANH_TOANNull() {
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

	public void SetDON_VI_THANH_TOANNull() {
		pm_objDR["DON_VI_THANH_TOAN"] = System.Convert.DBNull;
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

	public void SetGHI_CHUNull() {
		pm_objDR["GHI_CHU"] = System.Convert.DBNull;
	}

#endregion
   
    #region "Init Functions"
	public US_V_DM_DOT_THANH_TOAN() 
	{
		pm_objDS = new DS_V_DM_DOT_THANH_TOAN();
		pm_strTableName = c_TableName;
		pm_objDR = pm_objDS.Tables[pm_strTableName].NewRow();
	}

	public US_V_DM_DOT_THANH_TOAN(DataRow i_objDR): this()
	{
		this.DataRow2Me(i_objDR);
	}

	public US_V_DM_DOT_THANH_TOAN(decimal i_dbID) 
	{
		pm_objDS = new DS_V_DM_DOT_THANH_TOAN();
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
    public bool check_exist_ma_dot_thanh_toan(string ip_str_ma_dot_tt)
    {
        DS_V_DM_DOT_THANH_TOAN v_ds_dot_thanh_toan = new DS_V_DM_DOT_THANH_TOAN();
        this.FillDataset(v_ds_dot_thanh_toan, " WHERE MA_DOT_TT= '"+ip_str_ma_dot_tt+"'");
        if (v_ds_dot_thanh_toan.V_DM_DOT_THANH_TOAN.Rows.Count > 0) return true;
        return false;
    }
    public void search_dot_tt(string ip_str_ma_dot_tt
                             , decimal ip_dc_id_don_vi_tt
                             , decimal ip_dc_id_trang_thai_dot_tt
                             , DS_V_DM_DOT_THANH_TOAN op_ds_v_dm_dot_thanh_toan)
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_DM_DOT_THANH_TOAN_Search");
        v_cstore.addDecimalInputParam("@ID_DON_VI_TT", ip_dc_id_don_vi_tt);
        v_cstore.addDecimalInputParam("@ID_TRANG_THAI_DOT_TT", ip_dc_id_trang_thai_dot_tt);
        v_cstore.addNVarcharInputParam("@MA_DOT_TT", ip_str_ma_dot_tt);
        v_cstore.fillDataSetByCommand(this, op_ds_v_dm_dot_thanh_toan);
    }
        
     public void load_danh_muc_dot_tt(decimal ip_dc_thang_tt
                             , decimal ip_dc_id_don_vi_tt
                             , decimal ip_dc_id_trang_thai_dot_tt
                             , DS_V_DM_DOT_THANH_TOAN op_ds_v_dm_dot_thanh_toan)
    {
        CStoredProc v_cstore = new CStoredProc("pr_V_DM_DOT_THANH_TOAN_Search_Danh_Muc");
        v_cstore.addDecimalInputParam("@ID_DON_VI_TT", ip_dc_id_don_vi_tt);
        v_cstore.addDecimalInputParam("@ID_TRANG_THAI_DOT_TT", ip_dc_id_trang_thai_dot_tt);
        v_cstore.addDecimalInputParam("@THANG_TT", ip_dc_thang_tt);
        v_cstore.fillDataSetByCommand(this, op_ds_v_dm_dot_thanh_toan);
    }
     public void duyet_toan_bo_chung_tu()
     {
         CStoredProc v_cstore = new CStoredProc("pr_V_GD_THANH_TOAN_Duyet_Tat_Ca_Chung_Tu");
         v_cstore.addNVarcharInputParam("@MA_DOT_THANH_TOAN", this.strMA_DOT_TT);
         v_cstore.ExecuteCommand(this);
     }
    #endregion
}
}
