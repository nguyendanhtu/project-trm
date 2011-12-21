﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F703_LichSuThanhToanHopDong.aspx.cs" Inherits="BaoCao_F703_LichSuThanhToanHopDong" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table  cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Báo cáo chi tiết đợt thanh toán"/>
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
                <td align="right" style="width:10%;height:30px;">			       
			       
			<asp:label id="Label3" Enabled="false" CssClass="cssManField" runat="server" 
                Text="Số hợp đồng: " />
			       
                </td>
                <td align="left" colspan="3">
                    &nbsp;<asp:TextBox ID="m_txt_so_hop_dong" runat="server" Width="90%"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;height:35px;">
			<asp:label id="lbltan_suat3" CssClass="cssManField" runat="server" 
                Text="Loại hợp đồng" />
                </td>
                <td align="left" colspan="3">    
			
                    <asp:RadioButtonList ID="m_rdl_loai_hop_dong" runat="server" 
                       
                        RepeatDirection="Horizontal" Width="70%">
                        <asp:ListItem Value="All" Selected="True">Tất cả</asp:ListItem>
                        <asp:ListItem Value="Vanhanh">Vận hành</asp:ListItem>
                        <asp:ListItem Value="Hoclieu">Học liệu</asp:ListItem>
                    </asp:RadioButtonList></td> 
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			        &nbsp;</td>
                <td align="left" colspan="2">
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
		    <asp:label id="m_lbl_danh_sach_thanh_toan" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách Thanh toán"/>
		</td>
	</tr>	
    <tr>
		<td align="left">
            <asp:Label ID="m_lbl_thong_bao" CssClass="cssManField" runat="server"></asp:Label>
            <asp:HiddenField ID="hdf_id_gv" runat="server" />
        </td>
        <td>
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
                        <ItemStyle HorizontalAlign="Center" Width="3%"></ItemStyle>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Mã đợt thanh toán" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Eval("SO_PHIEU_THANH_TOAN")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="7%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Ngày thanh toán" DataField="NGAY_THANH_TOAN" DataFormatString="{0:dd/MM/yyy}" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle Width="7%"></ItemStyle>
                    </asp:BoundField> 

                     <asp:BoundField HeaderText="Số hợp đồng" DataField="SO_HOP_DONG">
                    <ItemStyle Width="8%" HorizontalAlign="Left" />
                    </asp:BoundField>

                      <asp:TemplateField HeaderText="Đơn vị quản lý" ItemStyle-HorizontalAlign="Left">
                       <ItemTemplate><%# mapping_don_vi_quan_ly(CIPConvert.ToDecimal(Eval("ID_DON_VI_QUAN_LY")))%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="8%"></ItemStyle>
                    </asp:TemplateField> 
                      <asp:BoundField HeaderText="Thời gian thực hiện" DataField="THOI_GIAN">
                    <ItemStyle Width="7%" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Mã giảng viên" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# mapping_magv_by_id(CIPConvert.ToDecimal(Eval("ID_GIANG_VIEN")))%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="7%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên giảng viên" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Eval("TEN_GIANG_VIEN")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="7%"></ItemStyle>
                    </asp:TemplateField> 

                    <asp:BoundField HeaderText="Số tài khoản" DataField="SO_TAI_KHOAN">
                    <ItemStyle Width="7%" HorizontalAlign="Left" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Tên ngân hàng" 
                        ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Eval("TEN_NGAN_HANG")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="7%"></ItemStyle>
                    </asp:TemplateField> 
                       <asp:BoundField DataField="GIA_TRI_HOP_DONG" DataFormatString="{0:N0}" 
                     HeaderText="Tổng giá trị HĐ (VNĐ)">
                     <ItemStyle Width="6%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField Visible="false" DataField="GIA_TRI_NGHIEM_THU_THUC_TE" DataFormatString="{0:N0}" 
                     HeaderText="Giá trị nghiệm thu thực tế (VNĐ)">
                     <ItemStyle Width="6%" HorizontalAlign="Right" />
                    </asp:BoundField>

                     <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                     <HeaderTemplate><%# mapping_header_nghiem_thu_lop_mon(m_str_loai_hd) %></HeaderTemplate>
                       <ItemTemplate><%# mapping_item_field_nghiem_thu_lop_mon(CIPConvert.ToStr(Eval("LOAI_HOP_DONG")), Eval("REFERENCE_CODE"), Eval("GIA_TRI_NGHIEM_THU_THUC_TE"))%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="7%"></ItemStyle>
                    </asp:TemplateField> 

                     <asp:BoundField HeaderText="Đã thanh toán" DataField="DA_THANH_TOAN" DataFormatString="{0:N0}">
                        <ItemStyle HorizontalAlign="Right" Width="6%"></ItemStyle>
                     </asp:BoundField>
                     <asp:BoundField DataField="TONG_TIEN_THANH_TOAN" DataFormatString="{0:N0}" 
                     HeaderText="Tổng thanh toán đợt này (VNĐ)">
                     <ItemStyle Width="6%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField DataField="SO_TIEN_THUE" DataFormatString="{0:N0}" 
                     HeaderText="Số tiền thuế (VNĐ)">
                     <ItemStyle Width="5%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField DataField="TONG_TIEN_THUC_NHAN" DataFormatString="{0:N0}" 
                     HeaderText="Tổng tiền thực nhận đợt này(VNĐ)">
                     <ItemStyle Width="6%" HorizontalAlign="Right" />
                    </asp:BoundField>
                     <asp:BoundField HeaderText="Số tiền còn phải thanh toán" DataField="CON_PHAI_THANH_TOAN" DataFormatString="{0:N0}">
                        <ItemStyle HorizontalAlign="Right" Width="6%"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Nội dung thanh toán" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# mapping_noi_dung_tt(CIPConvert.ToDecimal(Eval("ID")),CIPConvert.ToDecimal(Eval("ID_HOP_DONG_KHUNG")))%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="10%"></ItemStyle>
                    </asp:TemplateField>
                     <asp:BoundField DataField="PO_LAP_THANH_TOAN" HeaderText="PO lập thanh toán">
                     <ItemStyle Width="10%" HorizontalAlign="Left" />
                    </asp:BoundField>
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

