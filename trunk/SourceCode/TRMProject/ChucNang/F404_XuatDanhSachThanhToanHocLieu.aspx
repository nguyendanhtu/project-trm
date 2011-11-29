﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F404_XuatDanhSachThanhToanHocLieu.aspx.cs" Inherits="ChucNang_F404_XuatDanhSachThanhToanHocLieu" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table  cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
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
			<asp:label id="lblTenGiangVien" CssClass="cssManField" runat="server" 
                Text="Đợt thanh toán" />			       
                         </td>
                <td align="left" colspan="4">
              <asp:DropDownList ID="m_cbo_dot_thanh_toan" CssClass="cssDorpdownlist" Width="96%" runat="server" 
                        AutoPostBack="true" 
                        onselectedindexchanged="m_cbo_dot_thanh_toan_SelectedIndexChanged" >
               </asp:DropDownList>
                         </td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat3" CssClass="cssManField" runat="server" 
                Text="Trạng thái dự toán" />
			       
                </td>
                <td align="left" colspan="3">    
                    <asp:RadioButtonList ID="rdl_trang_thai_tt_check" runat="server" 
                       
                        RepeatDirection="Horizontal" Width="55%">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem Value="DaDuyet">Đã duyệt</asp:ListItem>
                        <asp:ListItem Value="ChuaDuyet">Chưa duyệt</asp:ListItem>
                    </asp:RadioButtonList></td> 
                <td align="left" style="width:10%;">    
                    &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			        &nbsp;</td>
                <td align="left" colspan="3">
                    &nbsp;</td> 
                <td align="left" style="width:10%;">    
                    &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:1%;">
                     <asp:Button ID="m_cmd_tim_kiem" runat="server" accessKey="s" 
                         CssClass="cssButton" Height="24px" 
                         Text="Tìm kiếm" Width="98px" onclick="m_cmd_tim_kiem_Click" />
                 </td>
			   <td align="left" style="width:1%;">
                     &nbsp;</td>
                 <td align="left">
                    <asp:Button ID="m_cmd_xuat_excel" runat="server" CausesValidation="False" 
                        CssClass="cssButton" Height="25px"  Text="Xuất Excel" 
                        Width="98px" onclick="m_cmd_xuat_excel_Click" />
                </td>
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
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách Thanh toán"/>
		</td>
	</tr>	
    <tr>
		<td align="left">
                <asp:Label ID="m_lbl_thong_bao" CssClass="cssManField" runat="server"></asp:Label>
                <asp:HiddenField ID="hdf_id_gv" runat="server" />
        </td>
        <td >
		    &nbsp;</td>
	</tr>	

	<tr>
		<td align="center" colspan="2" style="height:450px;" valign="top">
		    &nbsp;
   <asp:GridView ID="m_grv_danh_sach_du_toan" AllowPaging="True" 
                runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" 
                onpageindexchanging="m_grv_danh_sach_du_toan_PageIndexChanging" PageSize="30" >
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Họ tên" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Eval("TEN_GIANG_VIEN")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="10%"></ItemStyle>
                    </asp:TemplateField> 
                      <asp:TemplateField HeaderText="Đơn vị quản lý" ItemStyle-HorizontalAlign="Left">
                       <ItemTemplate><%# mapping_don_vi_quan_ly(CIPConvert.ToDecimal(Eval("ID_DON_VI_QUAN_LY")))%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="10%"></ItemStyle>
                    </asp:TemplateField> 
                     <asp:BoundField HeaderText="Số hợp đồng" DataField="SO_HOP_DONG">
                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                    </asp:BoundField>
                      <asp:BoundField HeaderText="Thời gian thực hiện" DataField="THOI_GIAN">
                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Số tài khoản" DataField="SO_TAI_KHOAN">
                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Tên ngân hàng" 
                        ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Eval("TEN_NGAN_HANG")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="15%"></ItemStyle>
                    </asp:TemplateField> 
                       <asp:BoundField DataField="GIA_TRI_HOP_DONG" DataFormatString="{0:N0}" 
                     HeaderText="Tổng giá trị (VNĐ)">
                     <ItemStyle Width="10%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField DataField="GIA_TRI_NGHIEM_THU_THUC_TE" DataFormatString="{0:N0}" 
                     HeaderText="Giá trị nghiệm thu thực tế (VNĐ)">
                     <ItemStyle Width="10%" HorizontalAlign="Right" />
                    </asp:BoundField>
                      <asp:TemplateField HeaderText="Đã thanh toán" 
                        ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate>1</ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="15%"></ItemStyle>
                    </asp:TemplateField>
                     <asp:BoundField DataField="TONG_TIEN_THANH_TOAN" DataFormatString="{0:N0}" 
                     HeaderText="Tổng thanh toán (VNĐ)">
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
                      <asp:TemplateField HeaderText="Số tiền còn phải thanh toán" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate>1</ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="10%"></ItemStyle>
                    </asp:TemplateField> 
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

