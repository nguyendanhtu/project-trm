﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="F102_CapNhatThongTinLopMon.aspx.cs" Inherits="ChucNang_F102_CapNhatThongTinLopMon" %>

<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>F102 - Cập nhật thông tin lớp môn</title>
    
    <link href="~/Styles/Admin.css" rel="stylesheet" type="text/css" />
    </head>
<body>
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Thông tin lớp môn"/>
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
                <td align="left" style="width:5%;">
			       
			    </td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblTenGiangVien" CssClass="cssManField" runat="server" 
                Text="Tên giảng viên" />
                         </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_giang_vien" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                         </td>
                         <td align="left" style="width:1%;"> 
                             <asp:RequiredFieldValidator ID="m_rfv_ten_giang_vien" runat="server"  Text="*"
                        ControlToValidate="m_cbo_giang_vien" ErrorMessage="Bạn phải tên giảng viên"></asp:RequiredFieldValidator></td>
                <td align="left" style="width:5%;">
			       
			        &nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblNgayKi" CssClass="cssManField" runat="server" 
                Text="Ngày kí" />
		                    </td>
                <td align="left" style="width:10%;">
			        <ew:CalendarPopup ID="m_dat_ngay_ki" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="70%" SelectedDate="">
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
                <td align="left" style="width:5%;">
			       
			<asp:label id="lblNgayHieuLuc" CssClass="cssManField" runat="server" 
                Text="Ngày hiệu lực" />
		                    </td>
                <td align="left" style="width:10%;">
			        <ew:CalendarPopup ID="m_dat_ngay_hieu_luc" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="70%">
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
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">
			       
			<asp:label id="lblNgayKetThucDuKien" CssClass="cssManField" runat="server" 
                Text="Ngày kết thúc dự kiến" />
		                    </td>
                <td align="left" style="width:10%;">
			        <ew:CalendarPopup ID="m_dat_ngay_ket_thuc_du_kien" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="70%">
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
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblLoaiHopDong" CssClass="cssManField" runat="server" 
                Text="Loại hợp đồng" />
                </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_loai_hop_dong" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                </td>
                     <td align="left" style="width:1%;">
                         <asp:RequiredFieldValidator ID="m_rfv_offline0" runat="server" 
                             ErrorMessage="Bạn phải chọn loại hợp đồng" Text="*"
                             ControlToValidate="m_cbo_dm_loai_hop_dong"></asp:RequiredFieldValidator>
                </td>
                <td align="right" style="width:5%;">
			<asp:label id="lblDonViQuanLy" CssClass="cssManField" runat="server" 
                Text="Đơn vị quản lý" />
		                    </td>
                <td align="left" style="width:10%;">
			
		    <asp:DropDownList id="m_cbo_dm_loai_don_vi_quan_li" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
		                    </td>
                      <td align="left" style="width:1%;">
                         <asp:RequiredFieldValidator ID="m_rfv_don_vi_quan_li" runat="server" 
                             
                             ErrorMessage="Bạn phải chọn đơn vị quản lý" 
                             ControlToValidate="m_cbo_dm_loai_don_vi_quan_li">*</asp:RequiredFieldValidator>
                </td>
                 <td align="right" style="width:5%;">
			       
			<asp:label id="lblGhiChu" CssClass="cssManField" runat="server" 
                Text="Ghi chú" />
		                    </td>
                <td align="left" style="width:10%;">
			<asp:textbox id="m_txt_ghi_chu" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
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
                         <asp:RequiredFieldValidator ID="m_rfv_trang_thai_hop_dong" runat="server" 
                             ErrorMessage="Bạn phải chọn trạng thái hợp đồng" Text="*"
                             ControlToValidate="m_cbo_dm_trang_thai_hop_dong"></asp:RequiredFieldValidator>
                </td>
                <td align="right" style="width:5%;">
			<asp:label id="lblDonViThanhToan" CssClass="cssManField" runat="server" 
                Text="Đơn vị thanh toán" />
		                    </td>
                <td align="left" style="width:10%;">
			
		    <asp:DropDownList id="m_cbo_dm_loai_don_vi_thanh_toan" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
		                    </td>
                      <td align="left" style="width:1%;">
                         <asp:RequiredFieldValidator ID="m_rfv_don_vi_thanh_toan" runat="server" 
                             
                             ErrorMessage="Bạn phải chọn đơn vị quản lý" Text="*"
                             ControlToValidate="m_cbo_dm_loai_don_vi_thanh_toan"></asp:RequiredFieldValidator>
                </td>
                 <td align="right" style="width:5%;">
			       
			<asp:label id="lblThueSuat" CssClass="cssManField" runat="server" 
                Text="Thuế suất" />
		                    </td>
                <td align="left" style="width:10%;">
			<asp:textbox id="m_txt_thue_suat" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                <td align="left" style="width:1%;">
                         <asp:RequiredFieldValidator ID="m_rfv_thue_suat" runat="server" 
                             
                             ErrorMessage="Bạn nhập thuế suất" Text="*"
                             ControlToValidate="m_txt_thue_suat"></asp:RequiredFieldValidator>
                </td>
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
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
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
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
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
			<asp:label id="lblGiaTriHopDong" CssClass="cssManField" runat="server" 
                Text="Giá trị hợp đồng" />
		                    </td>
                <td align="left" colspan="7">
			<asp:textbox id="m_txt_gia_tri_hop_dong" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblHocLieu" CssClass="cssManField" runat="server" 
                Text="Học liệu" />
		                    </td>
                <td align="left" style="width:10%;">
			        <asp:RadioButtonList ID="m_rbt_hoclieu_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="Y">Có</asp:ListItem>
                        <asp:ListItem Value="N">Không</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                     <td align="left" style="width:1%;">
                         <asp:RequiredFieldValidator ID="m_rfv_offline" runat="server" 
                             
                             ErrorMessage="Bạn phải chọn Có học liệu? Có hoặc Không" 
                             ControlToValidate="m_rbt_hoclieu_yn">*</asp:RequiredFieldValidator>
                </td>
                <td align="right" style="width:5%;">
			<asp:label id="lblVanHanh" CssClass="cssManField" runat="server" 
                Text="Vận hành" />
		                    </td>
                <td align="left" style="width:10%;">
			        <asp:RadioButtonList ID="m_rbt_bt_vanhanh_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="Y">Có</asp:ListItem>
                        <asp:ListItem Value="N">Không</asp:ListItem>
                    </asp:RadioButtonList>
		                    </td>
                     <td align="left" style="width:1%;">
                         <asp:RequiredFieldValidator ID="m_rfv_offline2" runat="server" 
                             
                             ErrorMessage="Bạn phải chọn Có bài tập giữa kỳ? Có hoặc Không" 
                             ControlToValidate="m_rbt_bt_vanhanh_yn">*</asp:RequiredFieldValidator>
                </td>
                 <td align="right" style="width:5%;">
			         &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>            
                         <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;">    
			        &nbsp;</td> 
                <td align="left" style="width:1%;"></td>
                <td align="left" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">    
			        &nbsp;</td> <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:1%;">
			        <asp:button id="m_cmd_luu_du_lieu" accessKey="s" CssClass="cssButton" 
                runat="server" Width="98px" Text="Lưu dữ liệu" onclick="m_cmd_luu_du_lieu_Click" 
                        Height="24px" />
                </td>
			   <td align="left" style="width:1%;"></td>
                 <td align="left" style="width:5%;">
                     &nbsp;</td>
                <td align="left" style="width:10%;">
                 <asp:button id="m_cmd_thoat" CssClass="cssButton" 
                runat="server" Width="98px" Text="Thoát" onclick="m_cmd_thoat_Click" 
                        Height="25px"  />
                 </td>     
                <td align="left" style="width:1%;"></td>
            </tr>
        </table>
		</td>
	</tr>
	<tr>
    <td></td></tr>
</table>
    </form>
</body>
</html>