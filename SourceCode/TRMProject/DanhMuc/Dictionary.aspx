﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Dictionary.aspx.cs" Inherits="DanhMuc_Dictionary" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Danh mục từ điển hệ thống"/>
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
			<asp:label id="Label4" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;L&lt;/U&gt;oại từ điển"/>
		</td>
		<td style="width:30%;">
		    <asp:DropDownList id="m_cbo_loai_tu_dien" runat="server" Width="264px"  />
		</td>
		<td style="width:5%;">  
			<asp:customvalidator id="m_cvt_loai_tu_dien" runat="server" 
                ControlToValidate="m_cbo_loai_tu_dien" ErrorMessage="Bạn phải chọn Loại từ điển" 
                Display="Static" Text="*" />
            </td>
		</tr>
	<tr>
		<td align="right" style="width:15%;">
			<asp:label id="lblFullName" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã từ điển" />
		</td>
		<td style="width:30%;">
			<asp:textbox id="m_txt_ma_tu_dien" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
		</td>
		<td style="width:5%;"> 
			<asp:customvalidator id="m_ctv_ma_tu_dien" runat="server" 
                ControlToValidate="m_txt_ma_tu_dien" ErrorMessage="Bạn phải nhập Mã từ điển" 
                Display="Static" Text="*" />
        </td>
	</tr>
	    <tr>
		<td align="right" >
		    <asp:label id="lblAnswer0" runat="server" CssClass="cssManField" 
                Text="&lt;U&gt;T&lt;/U&gt;ên ngắn" />
		</td>
		<td align="left">
		    <asp:textbox id="m_txt_ten_ngan" accessKey="m" runat="server" 
                CssClass="cssTextBox"  Width="96%" />
		</td>
		<td >
			<asp:customvalidator id="m_ctv_ten_tu_ngan" runat="server" 
                ControlToValidate="m_txt_ten_ngan" ErrorMessage="Bạn phải nhập Tên ngắn" 
                Display="Static" Text="*" />
		</td>
		</tr>
	<tr>
		<td align="right" >
		    <asp:label id="lblAnswer" runat="server" CssClass="cssManField" 
                Text="Tê&lt;U&gt;n&lt;/U&gt;" />
		</td>
		<td align="left">
		    <asp:textbox id="m_txt_ten" accessKey="m" runat="server" 
                CssClass="cssTextBox"  Width="96%" />
		</td>
		<td >
			<asp:customvalidator id="m_ctv_ten" runat="server" 
                ControlToValidate="m_txt_ten" ErrorMessage="Bạn phải nhập Tên" 
                Display="Static" Text="*" />
		</td>
	</tr>
    <tr>
        <td align="right">
            <asp:Label ID="m_lbl_ghi_chu" runat="server" CssClass="cssManField" 
                Text="Ghi Chú" />
        </td>
        <td align="left">
            <asp:textbox id="m_txt_ghi_chu" accessKey="m" runat="server" 
                CssClass="cssTextBox"  Width="96%" TextMode="MultiLine" Height="124px"  />
        </td>
    </tr>
	<tr>
		<td align="right">
			&nbsp;</td>
		<td valign="top" colspan="2">
		    <asp:HiddenField ID="m_hdf_id_dm_tu_dien" runat="server" Visible="False" />
        </td>
	</tr>	
	<tr>
	    <td></td>
		<td colspan="2" align="left">
			<asp:button id="m_cmd_tao_moi" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo mới(c)" onclick="m_cmd_tao_moi_Click"  />&nbsp;
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
                Text="Danh sách từ điển hệ thống"/>
		</td>
	</tr>	
    <tr>
		<td align="right">
			<asp:label id="Label5" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;L&lt;/U&gt;oại từ điển"/>
        </td>
        <td >
		    <asp:DropDownList id="m_cbo_loai_tu_dien_grv" runat="server" Width="264px" 
                AutoPostBack="True" 
                onselectedindexchanged="m_cbo_loai_tu_dien_grv_SelectedIndexChanged"  />
        </td>
	</tr>	
	<tr>
		<td align="center" colspan="3" style="height:450px;" valign="top">
		    <asp:GridView ID="m_grv_dm_tu_dien" runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID" 
                onrowdeleting="m_grv_dm_tu_dien_RowDeleting" 
                onselectedindexchanging="m_grv_dm_tu_dien_SelectedIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="STT"><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="ID_LOAI_TU_DIEN" HeaderText="Loại từ điển" 
                        Visible="False">
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="MA_TU_DIEN" HeaderText="Mã từ điển" />
                    <asp:BoundField DataField="TEN_NGAN" HeaderText="Tên ngắn" />
                    <asp:BoundField DataField="TEN" HeaderText="Tên" />
                    <asp:BoundField DataField="GHI_CHU" HeaderText="Ghi chú" />
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                </Columns>
                <SelectedRowStyle CssClass="cssSelectedRow"></SelectedRowStyle>
            </asp:GridView>
        </td>
	</tr>	

</table>
</asp:Content>
