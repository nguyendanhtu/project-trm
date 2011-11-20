<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F405_XacNhanNganHang.aspx.cs" Inherits="ChucNang_F405_XacNhanNganHang" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table  cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="Label1" runat="server" CssClass="cssPageTitle" 
                Text="Thông tin Thanh toán"/>
		</td>
	</tr>
	<tr>
		<td>
		    &nbsp;</td>
	</tr>
    <tr>
		<td>
        <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0"> 
            <tr>
                <td align="right" style="width:14%;">			       
			<asp:label id="Label2" CssClass="cssManField" runat="server" 
                Text="Đợt thanh toán" />			       
                         </td>
                <td align="left" colspan="4">
              <asp:DropDownList ID="m_cbo_dot_thanh_toan" CssClass="cssDorpdownlist" Width="96%" runat="server" 
                        AutoPostBack="true" 
                        onselectedindexchanged="m_cbo_dot_thanh_toan_SelectedIndexChanged">
               </asp:DropDownList>
                         </td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat3" CssClass="cssManField" runat="server" 
                Text="Ngày thanh toán" />
			       
                </td>
                <td align="left" colspan="3">    
                    &nbsp;<asp:Label ID="m_lbl_ngay_thanh_toan" runat="server"></asp:Label></td> 
                <td align="left" style="width:10%;">    
                    &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat4" CssClass="cssManField" runat="server" 
                Text="Đơn vị thanh toán" />
			       
                </td>
                <td align="left" colspan="3">
                    <asp:Label ID="m_lbl_dv_thanh_toan" runat="server"></asp:Label>
                </td> 
                <td align="left" style="width:10%;">    
                    &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:1%;">
                     &nbsp;</td>
			   <td align="left" style="width:1%;">
                     &nbsp;</td>
                 <td align="left">
                     &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>  
                  <td align="left" style="width:10%;">
                      &nbsp;</td>  
            </tr>
        </table>

		</td>
	</tr>
    <tr>
		<td class="cssPageTitleBG" colspan="2">
		    <asp:label id="Label3" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách Thanh toán"/>
		</td>
	</tr>	
    <tr>
		<td align="left">
                <asp:Label ID="m_lbl_thong_bao" CssClass="cssManField" runat="server"></asp:Label>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                 <p style="text-align:center">
                 <span class="cssManField">Trạng thái thanh toán&nbsp;&nbsp; </span>
                      <asp:DropDownList ID="m_cbo_trang_thai_tt_search" CssClass="cssDorpdownlist" runat="server" 
                        AutoPostBack="true"  Width="25%" 
                         onselectedindexchanged="m_cbo_trang_thai_tt_search_SelectedIndexChanged">
               </asp:DropDownList>                         
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </p>
                        <p style="text-align:center">
                <span class="cssManField">Số hợp đồng&nbsp;&nbsp; </span><asp:TextBox ID="m_txt_so_hd_search" CssClass="cssTextBox" Width="20%" 
                        runat="server"></asp:TextBox>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="m_cmd_search" runat="server" accessKey="s" 
                         CssClass="cssButton" Height="24px" 
                         Text="Tìm kiếm" Width="98px" CausesValidation="false" 
                                onclick="m_cmd_search_Click" />
                 </span>
                 <br />
                        </p>
        </td>
        <td >
		    &nbsp;</td>
	</tr>	

	<tr>
		<td align="center" colspan="2" style="height:450px;" valign="top">
		    &nbsp;
   <asp:GridView ID="m_grv_danh_sach_thanh_toan" AllowPaging="True" 
                runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" >
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên giảng viên" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Eval("TEN_GIANG_VIEN")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="10%"></ItemStyle>
                    </asp:TemplateField> 
                    <asp:BoundField HeaderText="Số tài khoản" DataField="SO_TAI_KHOAN">
                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Ngân hàng" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Eval("TEN_NGAN_HANG")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="15%"></ItemStyle>
                    </asp:TemplateField> 
                     <asp:BoundField DataField="TONG_TIEN_THANH_TOAN" DataFormatString="{0:N0}" 
                     HeaderText="Tổng tiền thanh toán (VNĐ)">
                     <ItemStyle Width="10%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField DataField="SO_TIEN_THUE" DataFormatString="{0:N0}" 
                     HeaderText="Số tiền thuế (VNĐ)">
                     <ItemStyle Width="10%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField DataField="TONG_TIEN_THUC_NHAN" DataFormatString="{0:N0}" 
                     HeaderText="Tổng tiền thực nhận (VNĐ)">
                     <ItemStyle Width="10%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Nội dung thanh toán" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# mapping_noi_dung_tt(CIPConvert.ToDecimal(Eval("ID")),CIPConvert.ToDecimal(Eval("ID_HOP_DONG_KHUNG")))%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="20%"></ItemStyle>
                    </asp:TemplateField> 
                      <asp:BoundField DataField="DESCRIPTION" HeaderText="Ghi chú">
                     <ItemStyle Width="10%" HorizontalAlign="Left" />
                    </asp:BoundField>
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

