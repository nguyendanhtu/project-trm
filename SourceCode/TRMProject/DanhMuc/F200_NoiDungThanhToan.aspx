<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F200_NoiDungThanhToan.aspx.cs" Inherits="DanhMuc_NoiDungThanhToan" %>

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
			<asp:label id="lbl_content" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;ên nội dung" />
		</td>
		<td style="width:30%;">
			<asp:textbox id="m_txt_ten_noi_dung" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="495px" />
		</td>
		<td style="width:5%;"> 
			&nbsp;</td>
	</tr>
	    <tr>
		<td align="right" >
			<asp:label id="lbl_loai_hop_dong" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;L&lt;/U&gt;oại hợp đồng" AccessKey="L" />
		    </td>
		<td align="left">
		    <asp:DropDownList ID="m_ddl_loai_hop_dong" runat="server" Width="323px">
            </asp:DropDownList>
            </td>
		<td >
			&nbsp;</td>
		</tr>
	<tr>
		<td align="right" >
			<asp:label id="lbl_ma_don_vi_tinh" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã đơn vị tính" />
		</td>
		<td align="left">
		    <asp:DropDownList ID="m_ddl_ma_don_vi_tinh" runat="server" Width="323px">
            </asp:DropDownList>
        </td>
		<td >
			&nbsp;</td>
	</tr>
    <tr>
        <td align="right">
			<asp:label id="lblFullName2" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;Đ&lt;/U&gt;ơn giá" />
		</td>
        <td align="left">
			<asp:textbox id="m_txt_don_gia" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="322px" />
            <asp:RegularExpressionValidator ID="Regex_don_gia" runat="server" Text="*" ErrorMessage="Đơn giá phải là số" ControlToValidate="m_txt_don_gia" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
		</td>
        <td>&nbsp;</td>
    </tr>
	    <tr>
		<td align="right">
			<asp:label id="lbl_ma_tan_xuat" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã tần suất" />
		    </td>
		<td valign="top" colspan="2">
		    <asp:DropDownList ID="m_ddl_ma_tan_xuat" runat="server" Width="323px" 
                AccessKey="M">
            </asp:DropDownList>
            </td>
	    </tr>
	<tr>
		<td align="right" class="style1">
			<asp:label id="lbl_hoc_lieu" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;C&lt;/U&gt;ó làm học liệu" />
		</td>
		<td valign="top" colspan="2" class="style1">
		    <asp:RadioButton ID="m_rd_yes_hoc_lieu" runat="server" Text="Có" 
                GroupName="rdb_lam_hoc_lieu" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="m_rd_no_hoc_lieu" runat="server" Checked="True" 
                Text="Không" GroupName="rdb_lam_hoc_lieu" />
        </td>
	</tr>	
	<tr>
		<td align="right">
			<asp:label id="lbl_hoc_lieu0" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;C&lt;/U&gt;ó vận hành" />
		</td>
		<td valign="top" colspan="2">
		    <asp:RadioButton ID="m_rd_yes_van_hanh" runat="server" Checked="True" 
                Text="Có" GroupName="rdb_lam_van_hanh" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="m_rd_no_van_hanh" runat="server" Text="Không" 
                GroupName="rdb_lam_van_hanh" />
        </td>
	</tr>	
	<tr>
		<td align="right">
			<asp:label id="lbl_ghi_chu" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;G&lt;/U&gt;hi chú" />
		</td>
		<td valign="top" colspan="2">
		    <asp:TextBox ID="m_txt_ghi_chu" runat="server" TextMode = "MultiLine" 
                Width="495px" Height="83px"></asp:TextBox>
        </td>
	</tr>	
    <tr>
		<td align="right">
			&nbsp;</td>
		<td valign="top" colspan="2">
		    &nbsp;</td>
	</tr>	
	<tr>
	    <td></td>
		<td colspan="2" align="left">
			<asp:button id="m_cmd_tao_moi" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo mới(c)" 
                onclick="m_cmd_tao_moi_Click" />&nbsp;
			<asp:button id="m_cmd_cap_nhat" accessKey="u" CssClass="cssButton" 
                runat="server" Width="98px" Text="Cập nhật(u)" 
                onclick="m_cmd_cap_nhat_Click"  />&nbsp;
			<asp:button id="btnCancel" accessKey="r" CssClass="cssButton" runat="server" 
                Width="98px" Text="Xóa trắng(r)" onclick="btnCancel_Click" />
                <asp:HiddenField ID="hdf_id" runat = "server" Value="" />
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
           
              <asp:GridView ID="m_grv_dm_noi_dung_thanh_toan" runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID" 
                  onrowdeleting="m_grv_dm_tu_dien_RowDeleting" 
                onselectedindexchanging="m_grv_dm_noi_dung_thanh_toan_SelectedIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_LOAI_TU_DIEN" HeaderText="Loại từ điển" 
                        Visible="False">
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="TEN_NOI_DUNG" HeaderText="Tên nội dung" />
                    <asp:BoundField DataField="TEN_NGAN" HeaderText="Loại hợp đồng" />
                    <asp:BoundField DataField="MA_DON_VI_TINH" HeaderText="Đơn vị tính" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="DON_GIA_DEFAULT" HeaderText="Đơn giá" />
                    <asp:BoundField DataField="MA_TAN_SUAT" HeaderText="Mã tần xuất" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="HOC_LIEU_YN" HeaderText="Học liệu YN" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="VAN_HANH_YN" HeaderText="Vận hành YN" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="GHI_CHU" HeaderText="Ghi chú" />
                    <asp:TemplateField>
                    <ItemTemplate> <asp:LinkButton ID = "lbt_delete" runat="server" Text="Xóa" 
                     CommandName="Delete" OnClientClick="return confirm ('Bạn có thực sự muốn xóa bản ghi này?')"></asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                </Columns>
                <SelectedRowStyle CssClass="cssSelectedRow"></SelectedRowStyle>
            </asp:GridView>
           
            </td>
	</tr>	

</table>
</asp:Content>

