<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F300_MonHoc.aspx.cs" Inherits="DanhMuc_F300_MonHoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Danh mục môn học"/>
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
			<asp:label id="lbl_ma_mon" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã môn" />
		</td>
		<td style="width:30%;">
			<asp:textbox id="m_txt_ma_mon" CssClass="cssTextBox" 
                CausesValidation="false"  runat="server" 
                MaxLength="64" Width="320px" />
                <asp:customvalidator id="m_ctv_ma_mon" runat="server" 
                ControlToValidate="m_txt_ma_mon" ErrorMessage="Bạn phải nhập Mã môn" 
                Display="Static" Text="*" />
		</td>
		<td style="width:5%;"> 
			&nbsp;</td>
	</tr>
	    <tr>
		<td align="right" >
			<asp:label id="lbl_ten_mon" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;ên môn" AccessKey="T" />
		    </td>
		<td align="left">
			<asp:textbox id="m_txt_ten_mon" CssClass="cssTextBox" 
                CausesValidation="false"  runat="server" 
                MaxLength="64" Width="505px" />
                <asp:customvalidator id="m_ctv_ten_mon" runat="server" 
                ControlToValidate="m_txt_ten_mon" ErrorMessage="Bạn phải nhập Mã môn" 
                Display="Static" Text="*" />
            </td>
		<td >
			&nbsp;</td>
		</tr>
    <tr>
        <td align="right">
			<asp:label id="lbl_so_don_vi_hoc_trinh" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;S&lt;/U&gt;ố đơn vị học trình" AccessKey="T" />
		</td>
        <td align="left">
			<asp:textbox id="m_txt_don_vi_hoc_trinh" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="320px" />
                <asp:customvalidator id="m_ctv_don_vi_hoc_trinh" runat="server" 
                ControlToValidate="m_txt_don_vi_hoc_trinh" ErrorMessage="Bạn phải nhập Mã môn" 
                Display="Static" Text="*" />
		</td>
        <td>&nbsp;</td>
    </tr>
	<tr>
		<td align="right">
			<asp:label id="lbl_ghi_chu" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;G&lt;/U&gt;hi chú" />
		</td>
		<td valign="top" colspan="2">
		    <asp:TextBox ID="m_txt_ghi_chu" runat="server" TextMode = "MultiLine" 
                Width="505px" Height="83px"></asp:TextBox>
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
                runat="server" Width="98px" Text="Tạo mới(c)" />&nbsp;
			<asp:button id="m_cmd_cap_nhat" accessKey="u" CssClass="cssButton" 
                runat="server" Width="98px" Text="Cập nhật(u)"  />&nbsp;
			<asp:button id="btnCancel" accessKey="r" CssClass="cssButton" runat="server" 
                Width="98px" Text="Xóa trắng(r)"  />
                <asp:HiddenField ID="hdf_id" runat = "server" Value="" />
		</td>
	</tr>
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách nội dung thanh toán"/>
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
                CellPadding="4" ForeColor="#333333" GridLines="Both">
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_LOAI_TU_DIEN" HeaderText="Loại từ điển" 
                        Visible="False">
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="TEN_NOI_DUNG" HeaderText="Tên nội dung" />
                    <asp:BoundField DataField="TEN_NGAN" HeaderText="Loại hợp đồng" />
                    <asp:BoundField DataField="MA_DON_VI_TINH" HeaderText="Đơn vị tính" 
                        ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText = "Đơn giá">
                    <ItemTemplate><asp:Label ID="lbl_don_gia" runat="server"><%# Eval("DON_GIA_DEFAULT").ToString() %></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MA_TAN_SUAT" HeaderText="Mã tần xuất" 
                        ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="HOC_LIEU_YN" HeaderText="Học liệu YN" 
                        ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VAN_HANH_YN" HeaderText="Vận hành YN" 
                        ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="GHI_CHU" HeaderText="Ghi chú" />
                    <asp:TemplateField>
                    <ItemTemplate> <asp:LinkButton ID = "lbt_delete" runat="server" Text="Xóa" 
                     CommandName="Delete" OnClientClick="return confirm ('Bạn có thực sự muốn xóa bản ghi này?')"></asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                </Columns>
                  <EditRowStyle BackColor="#7C6F57" />
                  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#810c15" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle CssClass="cssSelectedRow" BackColor="#C5BBAF" Font-Bold="True" 
                      ForeColor="#333333"></SelectedRowStyle>
            </asp:GridView>
           
            </td>
	</tr>	

</table>
</asp:Content>

