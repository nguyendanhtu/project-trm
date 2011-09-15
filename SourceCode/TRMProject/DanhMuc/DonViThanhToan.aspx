<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DonViThanhToan.aspx.cs" Inherits="DanhMuc_DonViThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Danh mục &lt;&gt;"/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
		    <asp:validationsummary id="vdsCategory" runat="server" CssClass="cssManField" Font-Bold="true" />
		   <asp:label id="m_lbl_mess" runat="server" CssClass="cssManField" />
		</td>
	</tr>
	    <tr>
		<td align="right" style="width:15%;">
			&nbsp;</td>
		<td style="width:30%;">
		    &nbsp;</td>
		<td style="width:5%;">  
			&nbsp;</td>
		</tr>
	<tr>
		<td align="right" style="width:15%;">
			<asp:label id="lbl_ma_don_vi" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã đơn vị" />
		</td>
		<td style="width:30%;">
			<asp:textbox id="m_txt_ma_don_vi" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="64%" />
		</td>
		<td style="width:5%;"> 
			<asp:customvalidator id="m_ctv_ma_don_vi" runat="server" 
                ControlToValidate="m_txt_ma_don_vi" ErrorMessage="Bạn phải nhập mã đơn vị" 
                Display="Static" Text="*" />
        </td>
	</tr>
	    <tr>
		<td align="right" >
			<asp:label id="lbl_ten_don_vi" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;ên đơn vị" AccessKey="L" />
		    </td>
		<td align="left">
			<asp:textbox id="m_txt_ten_don_vi" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="64%" />
            </td>
		<td >
			<asp:customvalidator id="m_ctv_ten_don_vi" runat="server" 
                ControlToValidate="m_txt_ten_don_vi" ErrorMessage="Bạn phải nhập tên đơn vị" 
                Display="Static" Text="*" />
               </td>
		</tr>
	<tr>
		<td align="right" >
			<asp:label id="lbl_dia_chi" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;Đ&lt;/U&gt;ịa chỉ" />
		</td>
		<td align="left">
			<asp:textbox id="m_txt_dia_chi" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="64%" />
        </td>
		<td >
			&nbsp;</td>
	</tr>
    <tr>
        <td align="right">
			<asp:label id="lbl_so_dien_thoai" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;S&lt;/U&gt;ố điện thoại" />
		</td>
        <td align="left">
			<asp:textbox id="m_txt_so_dien_thoai" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="64%" />
		</td>
        <td>&nbsp;</td>
    </tr>
	    <tr>
		<td align="right">
			<asp:label id="lbl_so_tai_khoan" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;S&lt;/U&gt;ố tài khoản" />
		    </td>
		<td valign="top" colspan="2">
			<asp:textbox id="m_txt_so_tai_khoan" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="55%" />
            </td>
	    </tr>
	<tr>
		<td align="right" class="style1">
			<asp:label id="lbl_cap_tai" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;C&lt;/U&gt;ấp tại" />
		</td>
		<td valign="top" colspan="2" class="style1">
			<asp:textbox id="m_txt_cap_tai" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="55%" />
        </td>
	</tr>	
	<tr>
		<td align="right">
			<asp:label id="lbl_ma_so_thue" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã số thuế" />
		</td>
		<td valign="top" colspan="2">
			<asp:textbox id="m_txt_ma_so_thue" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="55%" />
        </td>
	</tr>	
	<tr>
		<td align="right">
			&nbsp;</td>
		<td valign="top" colspan="2">
		    <asp:HiddenField ID="m_id_dm_don_vi_thanh_toan" runat="server" 
                Visible="False" />
        </td>
	</tr>	
	<tr>
		<td align="right">
			&nbsp;</td>
		<td valign="top" colspan="2">
			<asp:button id="m_cmd_tao_moi" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo mới(c)" onclick="m_cmd_tao_moi_Click" 
                 />&nbsp;
			<asp:button id="m_cmd_cap_nhat" accessKey="u" CssClass="cssButton" 
                runat="server" Width="98px" Text="Cập nhật(u)" 
                onclick="m_cmd_cap_nhat_Click"  />&nbsp;
			<asp:button id="btnCancel" accessKey="r" CssClass="cssButton" runat="server" 
                Width="98px" Text="Xóa trắng(r)" onclick="btnCancel_Click" />
		</td>
	</tr>	
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách &lt;&gt;"/>
		</td>
	</tr>	
    <tr>
		<td align="right">
			&nbsp;</td>
        <td >
		    &nbsp;</td>
	</tr>	
	<tr>
		<td align="center" colspan="3" style="height:450px;" valign="top">
		    &nbsp;

              <asp:GridView ID="m_grv_dm_don_vi_thanh_toan" runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID" 
                onrowdeleting="m_grv_dm_don_vi_thanh_toan_RowDeleting" 
                onselectedindexchanged="m_grv_dm_don_vi_thanh_toan_SelectedIndexChanged" onselectedindexchanging="m_grv_dm_don_vi_thanh_toan_SelectedIndexChanging" 
                >
                <Columns>
                    <asp:TemplateField HeaderText="STT"><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="ID_LOAI_TU_DIEN" HeaderText="Loại từ điển" 
                        Visible="False">
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="MA_DON_VI" HeaderText="Mã đơn vị" />
                    <asp:BoundField DataField="TEN_DON_VI" HeaderText="Tên đơn vị" />
                    <asp:BoundField DataField="DIA_CHI" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="SO_DIEN_THOAI" HeaderText="Số điện thoại" />
                    <asp:BoundField DataField="SO_TAI_KHOAN" HeaderText="Số tài khoản" />
                    <asp:BoundField DataField="CAP_TAI" HeaderText="Cấp tại" />
                    <asp:BoundField DataField="MA_SO_THUE" HeaderText="Mã số thuế" />
                  <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                </Columns>
                <SelectedRowStyle CssClass="cssSelectedRow"></SelectedRowStyle>
            </asp:GridView>
            </td>
	</tr>	

</table>
</asp:Content>