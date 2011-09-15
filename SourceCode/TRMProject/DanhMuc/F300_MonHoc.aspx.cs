using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DanhMuc_F300_MonHoc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Members
    
    #endregion

    #region Private Methods
    private bool check_validate()
    {
        if (this.m_txt_ma_mon.Text.Trim().Equals(""))
        {
            this.m_ctv_ma_mon.IsValid = false;
            return false;
        }
        if (this.m_txt_ten_mon.Text.Trim().Equals(""))
        {
            this.m_ctv_ten_mon.IsValid = false;
            return false;
        }
        if (this.m_txt_don_vi_hoc_trinh.Text.Trim().Equals(""))
        {
            this.m_ctv_don_vi_hoc_trinh.IsValid = false;
            return false;
        }

        return true;
    }


    #endregion
}