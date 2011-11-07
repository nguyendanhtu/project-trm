﻿<%@ Page Title="F301 - Giao dịch hợp đồng khung" Language="C#" MasterPageFile="~/Site.master"  AutoEventWireup="true" CodeFile="F301_GdHopDongKhung.aspx.cs" Inherits="ChucNang_F301_GdHopDongKhung" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <link href="~/Styles/Admin.css" rel="stylesheet" type="text/css" />
</asp:Content>

   <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Thông tin hợp đồng khung"/>
		</td>
	</tr>
	<tr>
		<td>
		    <asp:validationsummary id="vdsCategory" runat="server" CssClass="cssManField" Font-Bold="true" />
		   <asp:label id="m_lbl_mess" runat="server" CssClass="cssManField" />
		</td>
	</tr>
    <tr>
		<td>
        <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0"> 
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblSoHopDong" CssClass="cssManField" runat="server" 
                Text="Số hợp đồng" />
                         </td>
                <td align="left" style="width:10%;">
			<asp:textbox id="m_txt_so_hop_dong" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                         <td align="left" style="width:1%;"> 
                             <asp:RequiredFieldValidator ID="m_rfv_so_hop_dong" runat="server"  Text="*"
                        ControlToValidate="m_txt_so_hop_dong" ErrorMessage="Bạn phải nhập Số hợp đồng"></asp:RequiredFieldValidator></td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lblNgayKi" CssClass="cssManField" runat="server" 
                Text="Ngày ký" />
			       
			    </td>
                <td align="left" style="width:10%;">
			        <ew:CalendarPopup ID="m_dat_ngay_ki" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="70%" SelectedDate="" Text="" Culture="vi-VN" 
                        DisableTextboxEntry="False">
                        <weekdaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <weekendstyle backcolor="LightGray" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <offmonthstyle backcolor="AntiqueWhite" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Gray" />
                        <selecteddatestyle backcolor="Yellow" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Black" />
                        <monthheaderstyle backcolor="Yellow" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Black" />
                        <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" 
                            Font-Size="XX-Small" ForeColor="Black" />
                        <cleardatestyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <gototodaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <TodayDayStyle BackColor="LightGoldenrodYellow" 
                            Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small" 
                            ForeColor="Black" />
                        <holidaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                    </ew:CalendarPopup>
		                    </td>
                <td align="left" style="width:1%;"> 
                             <asp:RequiredFieldValidator ID="m_rfv_ngay_ky" runat="server"  Text="*"
                        ControlToValidate="m_dat_ngay_ki" ErrorMessage="Bạn phải nhập Ngày k"></asp:RequiredFieldValidator></td>
                 <td align="right" style="width:5%;">
			       
			<asp:label id="lblPophutrach" CssClass="cssManField" runat="server" 
                Text="PO phụ trách" />
			       
			    </td>
                <td align="left" style="width:10%;">	
			<asp:DropDownList ID="m_cbo_po_phu_trach_hop_dong" runat = "server" CssClass="cssDorpdownlist" 
            Width="96%"></asp:DropDownList>
                         </td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblDonViQuanLy" CssClass="cssManField" runat="server" 
                Text="Đơn vị quản lý HĐ" />
                         </td>
                <td align="left" style="width:10%;">	
			
		    <asp:DropDownList id="m_cbo_dm_loai_don_vi_quan_li" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                         </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="right" style="width:5%;">
			<asp:label id="lblDonViThanhToan" CssClass="cssManField" runat="server" 
                Text="Đơn vị thanh toán" />
		                    </td>
                <td align="left" colspan="3">
			
		    <asp:DropDownList id="m_cbo_dm_loai_don_vi_thanh_toan" runat="server" Width="85%" 
                        CssClass="cssDorpdownlist"  />
		                    </td>
                <td align="left" style="width:10%;">	
			
		            &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblTenGiangVien" CssClass="cssManField" runat="server" 
                Text="Tên giảng viên" />
                         </td>
                <td align="left" style="width:10%;">	
               <asp:DropDownList ID="m_cbo_gvien" Width="96%" runat="server">
               </asp:DropDownList>              
                         </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="right" style="width:5%;">
			      <!--<asp:Button ID="m_cmd_chosose_gv" runat="server" Text="+" 
                        CausesValidation="False" onclick="m_cmd_chosose_gv_Click1" />-->
		            &nbsp;<asp:label id="lblLoaiHopDong" CssClass="cssManField" runat="server" 
                Text="Loại hợp đồng" />
                </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_loai_hop_dong" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
		                    </td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblMon1" CssClass="cssManField" runat="server" 
                Text="Môn 1" />
                </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_mon_hoc_1" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
		                    </td>
                         <td align="left" style="width:1%;"> 
                         <asp:RequiredFieldValidator ID="m_rfv_trang_thai_hop_dong0" runat="server" 
                             ErrorMessage="Bạn phải chọn ít nhất 1 môn học" Text="*"
                             ControlToValidate="m_cbo_dm_mon_hoc_1"></asp:RequiredFieldValidator>
                </td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lblMon2" CssClass="cssManField" runat="server" 
                Text="Môn 2" />
		                    </td>
                <td align="left" style="width:10%;">
			
		    <asp:DropDownList id="m_cbo_dm_mon_hoc_2" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                            </td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">
			       
			<asp:label id="lblMon3" CssClass="cssManField" runat="server" 
                Text="Môn 3" />
                </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_mon_hoc_3" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                </td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblMon4" CssClass="cssManField" runat="server" 
                Text="Môn 4" />
                </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_mon_hoc_4" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lblMon5" CssClass="cssManField" runat="server" 
                Text="Môn 5" />
                </td>
                <td align="left" style="width:10%;">
			
		    <asp:DropDownList id="m_cbo_dm_mon_hoc_5" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                </td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">
			       
			<asp:label id="lblMon6" CssClass="cssManField" runat="server" 
                Text="Môn 6" />
                </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_mon_hoc_6" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                </td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lblNgayHieuLuc" CssClass="cssManField" runat="server" 
                Text="Ngày hiệu lực" />
		                    </td>
                <td align="left" style="width:10%;">
			        <ew:CalendarPopup ID="m_dat_ngay_hieu_luc" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="70%" Text="" Culture="vi-VN" 
                        DisableTextboxEntry="False">
                        <weekdaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <weekendstyle backcolor="LightGray" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <offmonthstyle backcolor="AntiqueWhite" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Gray" />
                        <selecteddatestyle backcolor="Yellow" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Black" />
                        <monthheaderstyle backcolor="Yellow" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Black" />
                        <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" 
                            Font-Size="XX-Small" ForeColor="Black" />
                        <cleardatestyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <gototodaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <TodayDayStyle BackColor="LightGoldenrodYellow" 
                            Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small" 
                            ForeColor="Black" />
                        <holidaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                    </ew:CalendarPopup>
                            </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lblNgayKetThuc" CssClass="cssManField" runat="server" 
                Text="Ngày kết thúc" />
		                    </td>
                <td align="left" style="width:10%;">
			
			        <ew:CalendarPopup ID="m_dat_ngay_ket_thuc" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="70%" Text="" Culture="vi-VN" 
                        DisableTextboxEntry="False">
                        <weekdaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <weekendstyle backcolor="LightGray" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <offmonthstyle backcolor="AntiqueWhite" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Gray" />
                        <selecteddatestyle backcolor="Yellow" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Black" />
                        <monthheaderstyle backcolor="Yellow" 
                            font-names="Verdana,Helvetica,Tahoma,Arial" font-size="XX-Small" 
                            forecolor="Black" />
                        <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" 
                            Font-Size="XX-Small" ForeColor="Black" />
                        <cleardatestyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <gototodaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                        <TodayDayStyle BackColor="LightGoldenrodYellow" 
                            Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small" 
                            ForeColor="Black" />
                        <holidaystyle backcolor="White" font-names="Verdana,Helvetica,Tahoma,Arial" 
                            font-size="XX-Small" forecolor="Black" />
                    </ew:CalendarPopup>
                            </td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
                 <td align="right" style="width:5%;">
			       
			         &nbsp;</td>
                <td align="left" style="width:10%;">
			        &nbsp;</td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblTrangThaiHopDong" CssClass="cssManField" runat="server" 
                Text="Trạng thái hợp đồng" />
                </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_trang_thai_hop_dong" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" style="width:5%;">
			<asp:label id="lblGiaTriHopDong" CssClass="cssManField" runat="server" 
                Text="Giá trị hợp đồng" />
		                    </td>
                <td align="left" style="width:10%;">
			
                <ew:NumericBox ID="m_txt_gia_tri_hop_dong" Width="96%" runat="server" 
                        TextAlign="Right"></ew:NumericBox>
			 
                         </td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
                 <td align="right" style="width:5%;">
			       
			<asp:label id="lblThueSuat" CssClass="cssManField" runat="server" 
                Text="Thuế suất (%)" />
		                    </td>
                <td align="left" style="width:10%;">
                 <ew:NumericBox ID="m_txt_thue_suat" Width="40%" runat="server" TextAlign="Right"></ew:NumericBox>
                         </td>
                <td align="left" style="width:1%;">
                         &nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblHocLieu" CssClass="cssManField" runat="server" 
                Text="Là hợp đồng học liệu" />
		                    </td>
                <td align="left" style="width:10%;">
			        <asp:RadioButtonList ID="m_rbt_hoclieu_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="Y">Có</asp:ListItem>
                        <asp:ListItem Value="N" Selected="True">Không</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" style="width:5%;">
			<asp:label id="lblVanHanh" CssClass="cssManField" runat="server" 
                Text="Là hợp đồng vận hành" />
		                    </td>
                <td align="left" style="width:10%;">
			        <asp:RadioButtonList ID="m_rbt_bt_vanhanh_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="Y" Selected="True">Có</asp:ListItem>
                        <asp:ListItem Value="N">Không</asp:ListItem>
                    </asp:RadioButtonList>
		                    </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                 <td align="right" style="width:5%;">
			<asp:label id="lblco_so_hd" CssClass="cssManField" runat="server" 
                Text="Đã cấp số hợp đồng?" />
		                    </td>
                <td align="left" style="width:10%;">
			        <asp:RadioButtonList ID="m_rbt_co_so_hd_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="Y" Selected="True">Có</asp:ListItem>
                        <asp:ListItem Value="N">Không</asp:ListItem>
                    </asp:RadioButtonList>
		                    </td>            
                         <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
                    <asp:Label ID="lblGhiChu0" runat="server" CssClass="cssManField" 
                        Text="Ghi chú" />
                </td>
                <td align="left" colspan="7">
                    <asp:TextBox ID="m_txt_ghi_chu1" runat="server" CssClass="cssTextBox" 
                        MaxLength="64" Width="96%" />
                </td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
                    <asp:Label ID="lblGhiChu1" runat="server" CssClass="cssManField" 
                        Text="Ghi chú 2" />
                </td>
                <td align="left" colspan="7">    
                    <asp:TextBox ID="m_txt_ghi_chu2" runat="server" CssClass="cssTextBox" 
                        MaxLength="64" Width="96%" />
                </td> 
            </tr>
            <tr>
                <td align="right" style="width:5%;">
                    <asp:Label ID="lblGhiChu2" runat="server" CssClass="cssManField" 
                        Text="Ghi chú 3" />
                </td>
                <td align="left" colspan="7">    
                    <asp:TextBox ID="m_txt_ghi_chu3" runat="server" CssClass="cssTextBox" 
                        MaxLength="64" Width="96%" />
                </td> 
            </tr>
            <tr>
                <td align="right" style="width:5%;">
                    <asp:Label ID="lblGhiChu3" runat="server" CssClass="cssManField" 
                        Text="Ghi chú 4" />
                </td>
                <td align="left" colspan="7">    
                    <asp:TextBox ID="m_txt_ghi_chu4" runat="server" CssClass="cssTextBox" 
                        MaxLength="64" Width="96%" />
                </td> 
            </tr>
            <tr>
                <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">    
			        &nbsp;</td> 
                <td align="left" style="width:1%;">&nbsp;</td>
                <td align="left" style="width:5%;">
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
			        <asp:button id="m_cmd_luu_du_lieu" accessKey="s" CssClass="cssButton" 
                runat="server" Width="98px" Text="Lưu hợp đồng" 
                        Height="24px" onclick="m_cmd_luu_du_lieu_Click1" />
                </td>
			   <td align="left" style="width:1%;"></td>
                 <td align="left" colspan="2">
			        <asp:button id="m_cmd_luu_va_sinh_pl" accessKey="s" CssClass="cssButton" 
                runat="server" Width="129px" Text="Lưu HD & sinh phụ lục" 
                        Height="20px" onclick="m_cmd_luu_va_sinh_pl_Click" />
                </td>
                <td align="left" style="width:1%;"></td>
                <td align="left" style="width:10%;">
                 <asp:button id="m_cmd_thoat" CssClass="cssButton" 
                runat="server" Width="98px" Text="Thoát" 
                        Height="25px" CausesValidation="False" onclick="m_cmd_thoat_Click" />
                 </td>  
                  <td align="left" style="width:10%;">
                 </td>  
            </tr>
        </table>
		</td>
	</tr>
	<tr>
    <td></td></tr>
</table>
</asp:Content>

