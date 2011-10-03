using System;
using System.Collections.Generic;
using System.Text;


namespace WebDS.CDBNames
{
      public enum e_loai_tu_dien
    {
         PHAN_QUYEN = 1
        , DIA_DIEM_QUAN_LY = 2
        , DON_VI_QUAN_LY_CHINH = 3
        , LEVEL_GIANG_VIEN =4
        , LOAI_HOP_DONG =5
        , NGANH_DAO_TAO =6
        , DON_VI_TINH =7
        , TRANG_THAI_HOP_DONG_KHUNG =8
        , TRANG_THAI_GIANG_VIEN =9
        , MA_TAN_SUAT = 10
        , HOC_HAM = 11
        , HOC_VI = 12
    }

    public class CM_DM_TU_DIEN
    {
        public const string ID = "ID";
        public const string MA_TU_DIEN = "MA_TU_DIEN";
        public const string TEN_NGAN = "TEN_NGAN";
        public const string TEN = "TEN";
        public const string ID_LOAI_TU_DIEN = "ID_LOAI_TU_DIEN";
        public const string GHI_CHU = "GHI_CHU";
    }
    public class CM_DM_LOAI_TD
    {
        public const string ID = "ID";
        public const string MA_LOAI = "MA_LOAI";
        public const string TEN_LOAI = "TEN_LOAI";
    }
    public class V_DM_NOI_DUNG_THANH_TOAN
    {
        public const string ID = "ID";
        public const string TEN_NOI_DUNG = "TEN_NOI_DUNG";
        public const string GHI_CHU = "GHI_CHU";
        public const string ID_LOAI_HOP_DONG = "ID_LOAI_HOP_DONG";
        public const string MA_DON_VI_TINH = "MA_DON_VI_TINH";
        public const string DON_GIA_DEFAULT = "DON_GIA_DEFAULT";
        public const string MA_TAN_SUAT = "MA_TAN_SUAT";
        public const string HOC_LIEU_YN = "HOC_LIEU_YN";
        public const string VAN_HANH_YN = "VAN_HANH_YN";
        public const string MA_TU_DIEN = "MA_TU_DIEN";
        public const string TEN_NGAN = "TEN_NGAN";
    }
    public class DM_MON_HOC
    {
        public const string ID = "ID";
        public const string MA_MON_HOC = "MA_MON_HOC";
        public const string TEN_MON_HOC = "TEN_MON_HOC";
        public const string SO_DVHT = "SO_DVHT";
        public const string GHI_CHU = "GHI_CHU";
    }

    public class DM_NOI_DUNG_THANH_TOAN
    {
        public const string ID = "ID";
        public const string TEN_NOI_DUNG = "TEN_NOI_DUNG";
        public const string GHI_CHU = "GHI_CHU";
        public const string ID_LOAI_HOP_DONG = "ID_LOAI_HOP_DONG";
        public const string MA_DON_VI_TINH = "MA_DON_VI_TINH";
        public const string DON_GIA_DEFAULT = "DON_GIA_DEFAULT";
        public const string MA_TAN_SUAT = "MA_TAN_SUAT";
        public const string HOC_LIEU_YN = "HOC_LIEU_YN";
        public const string VAN_HANH_YN = "VAN_HANH_YN";
    }
    public class DM_DON_VI_THANH_TOAN
    {
        public const string ID = "ID";
        public const string MA_DON_VI = "MA_DON_VI";
        public const string TEN_DON_VI = "TEN_DON_VI";
        public const string DIA_CHI = "DIA_CHI";
        public const string SO_DIEN_THOAI = "SO_DIEN_THOAI";
        public const string SO_TAI_KHOAN = "SO_TAI_KHOAN";
        public const string CAP_TAI = "CAP_TAI";
        public const string MA_SO_THUE = "MA_SO_THUE";
    }
    public class GD_LOP_MON
    {
        public const string ID = "ID";
        public const string MA_LOP_MON = "MA_LOP_MON";
        public const string ID_MON_HOC = "ID_MON_HOC";
        public const string NGAY_BAT_DAU = "NGAY_BAT_DAU";
        public const string NGAY_KET_THUC = "NGAY_KET_THUC";
        public const string PO_PHU_TRACH = "PO_PHU_TRACH";
        public const string NGAY_THI = "NGAY_THI";
        public const string CHUONG_TRINH_PHU_TRACH = "CHUONG_TRINH_PHU_TRACH";
        public const string SO_LUONG_HV = "SO_LUONG_HV";
        public const string OFFLINE_YN = "OFFLINE_YN";
        public const string SO_LUONG_OFFLINE = "SO_LUONG_OFFLINE";
        public const string ONLINES_YN = "ONLINES_YN";
        public const string SO_LUONG_ONLINES = "SO_LUONG_ONLINES";
        public const string BAI_TAP_GKY_YN = "BAI_TAP_GKY_YN";
    }
     public class V_DM_GIANG_VIEN
    {
         public const string ID = "ID";
        public const string MA_GIANG_VIEN = "MA_GIANG_VIEN";
        public const string HO_VA_TEN_DEM = "HO_VA_TEN_DEM";
        public const string TEN_GIANG_VIEN = "TEN_GIANG_VIEN";
        public const string NGAY_SINH = "NGAY_SINH";
        public const string GIOI_TINH_YN = "GIOI_TINH_YN";
        public const string CHUC_VU_HIEN_TAI = "CHUC_VU_HIEN_TAI";
        public const string CHUC_VU_CAO_NHAT = "CHUC_VU_CAO_NHAT";
        public const string TEL_HOME = "TEL_HOME";
        public const string TEL_OFFICE = "TEL_OFFICE";
        public const string MOBILE_PHONE = "MOBILE_PHONE";
        public const string EMAIL = "EMAIL";
        public const string TEN_CO_QUAN_CONG_TAC = "TEN_CO_QUAN_CONG_TAC";
        public const string EMAIL_TOPICA = "EMAIL_TOPICA";
        public const string ANH_CA_NHAN = "ANH_CA_NHAN";
        public const string HOC_VI = "HOC_VI";
        public const string HOC_HAM = "HOC_HAM";
        public const string CHUYEN_NGANH_CHINH = "CHUYEN_NGANH_CHINH";
        public const string TRUONG_DAO_TAO = "TRUONG_DAO_TAO";
        public const string ID_TRANG_THAI_GIANG_VIEN = "ID_TRANG_THAI_GIANG_VIEN";
        public const string TRANG_THAI_GIANG_VIEN = "TRANG_THAI_GIANG_VIEN";
        public const string SO_TAI_KHOAN = "SO_TAI_KHOAN";
        public const string TEN_NGAN_HANG = "TEN_NGAN_HANG";
        public const string SO_CMTND = "SO_CMTND";
        public const string NGAY_CAP = "NGAY_CAP";
        public const string NOI_CAP = "NOI_CAP";
        public const string ID_DON_VI_QUAN_LY = "ID_DON_VI_QUAN_LY";
        public const string DON_VI_QUAN_LY = "DON_VI_QUAN_LY";
        public const string MA_SO_THUE = "MA_SO_THUE";
        public const string GVHD_YN = "GVHD_YN";
        public const string GVCM_YN = "GVCM_YN";
        public const string GV_VIET_HL_YN = "GV_VIET_HL_YN";
        public const string GV_DUYET_HL_YN = "GV_DUYET_HL_YN";
        public const string GV_THAM_DINH_HL_YN = "GV_THAM_DINH_HL_YN";
        public const string GV_HDKH_YN = "GV_HDKH_YN";
        public const string DESCRIPTION = "DESCRIPTION";
        public const string NGAY_BD_HOP_TAC = "NGAY_BD_HOP_TAC";
    }
     class V_DM_HOP_DONG_KHUNG
     {
         public const string ID = "ID";
         public const string SO_HOP_DONG = "SO_HOP_DONG";
         public const string ID_GIANG_VIEN = "ID_GIANG_VIEN";
         public const string GIANG_VIEN = "GIANG_VIEN";
         public const string NGAY_KY = "NGAY_KY";
         public const string NGAY_HIEU_LUC = "NGAY_HIEU_LUC";
         public const string NGAY_KET_THUC_DU_KIEN = "NGAY_KET_THUC_DU_KIEN";
         public const string GIA_TRI_HOP_DONG = "GIA_TRI_HOP_DONG";
         public const string ID_LOAI_HOP_DONG = "ID_LOAI_HOP_DONG";
         public const string LOAI_HOP_DONG = "LOAI_HOP_DONG";
         public const string ID_DON_VI_QUAN_LY = "ID_DON_VI_QUAN_LY";
         public const string DON_VI_QUAN_LY = "DON_VI_QUAN_LY";
         public const string GHI_CHU = "GHI_CHU";
         public const string ID_TRANG_THAI_HOP_DONG = "ID_TRANG_THAI_HOP_DONG";
         public const string TRANG_THAI_HOP_DONG = "TRANG_THAI_HOP_DONG";
         public const string ID_DON_VI_THANH_TOAN = "ID_DON_VI_THANH_TOAN";
         public const string DON_VI_THANH_TOAN = "DON_VI_THANH_TOAN";
         public const string THUE_SUAT = "THUE_SUAT";
         public const string ID_MON1 = "ID_MON1";
         public const string FIRST_MON = "FIRST_MON";
         public const string ID_MON2 = "ID_MON2";
         public const string SEC_MON = "SEC_MON";
         public const string ID_MON3 = "ID_MON3";
         public const string THIR_MON = "THIR_MON";
         public const string ID_MON4 = "ID_MON4";
         public const string FOURTH_MON = "FOURTH_MON";
         public const string ID_MON5 = "ID_MON5";
         public const string FITH_MON = "FITH_MON";
         public const string ID_MON6 = "ID_MON6";
         public const string SIXTH_MON = "SIXTH_MON";
         public const string HOC_LIEU_YN = "HOC_LIEU_YN";
         public const string VAN_HANH_YN = "VAN_HANH_YN";
         public const string MA_PO_PHU_TRACH = "MA_PO_PHU_TRACH";
         public const string GHI_CHU2 = "GHI_CHU2";
         public const string GHI_CHU3 = "GHI_CHU3";
         public const string GHI_CHU4 = "GHI_CHU4";
         public const string CO_SO_HD_YN = "CO_SO_HD_YN";
     }

    public class DM_HOP_DONG_KHUNG {
        public const string ID = "ID";
        public const string SO_HOP_DONG = "SO_HOP_DONG";
        public const string ID_GIANG_VIEN = "ID_GIANG_VIEN";
        public const string NGAY_KY = "NGAY_KY";
        public const string NGAY_HIEU_LUC = "NGAY_HIEU_LUC";
        public const string NGAY_KET_THUC_DU_KIEN = "NGAY_KET_THUC_DU_KIEN";
        public const string GIA_TRI_HOP_DONG = "GIA_TRI_HOP_DONG";
        public const string ID_LOAI_HOP_DONG = "ID_LOAI_HOP_DONG";
        public const string ID_DON_VI_QUAN_LY = "ID_DON_VI_QUAN_LY";
        public const string GHI_CHU = "GHI_CHU";
        public const string ID_TRANG_THAI_HOP_DONG = "ID_TRANG_THAI_HOP_DONG";
        public const string ID_DON_VI_THANH_TOAN = "ID_DON_VI_THANH_TOAN";
        public const string THUE_SUAT = "THUE_SUAT";
        public const string ID_MON1 = "ID_MON1";
        public const string ID_MON2 = "ID_MON2";
        public const string ID_MON3 = "ID_MON3";
        public const string ID_MON4 = "ID_MON4";
        public const string ID_MON5 = "ID_MON5";
        public const string ID_MON6 = "ID_MON6";
        public const string HOC_LIEU_YN = "HOC_LIEU_YN";
        public const string VAN_HANH_YN = "VAN_HANH_YN";
    }
    public class GD_LOP_MON_DETAIL
    {
        public const string ID = "ID";
        public const string ID_LOP_MON = "ID_LOP_MON";
        public const string ID_HOP_DONG_KHUNG = "ID_HOP_DONG_KHUNG";
        public const string ID_NOI_DUNG_THANH_TOAN = "ID_NOI_DUNG_THANH_TOAN";
        public const string DA_THANH_TOAN_YN = "DA_THANH_TOAN_YN";
        public const string SO_LUONG_HE_SO = "SO_LUONG_HE_SO";
        public const string THANH_TIEN = "THANH_TIEN";
    }

    class V_GD_HOP_DONG_NOI_DUNG_TT
    {
        public const string ID = "ID";
        public const string ID_HOP_DONG_KHUNG = "ID_HOP_DONG_KHUNG";
        public const string SO_HOP_DONG = "SO_HOP_DONG";
        public const string TEN_GIANG_VIEN = "TEN_GIANG_VIEN";
        public const string ID_NOI_DUNG_TT = "ID_NOI_DUNG_TT";
        public const string NOI_DUNG_THANH_TOAN = "NOI_DUNG_THANH_TOAN";
        public const string SO_LUONG_HE_SO = "SO_LUONG_HE_SO";
        public const string DON_GIA_HD = "DON_GIA_HD";
    }


}
