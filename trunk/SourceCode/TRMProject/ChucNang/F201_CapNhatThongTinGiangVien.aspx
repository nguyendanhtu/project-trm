﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F201_CapNhatThongTinGiangVien.aspx.cs" Inherits="ChuNang_F201_CapNhatThongTinGiangVien" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
   <!-- <link rel="stylesheet" href="../themes/forest.css" />
    <link rel="stylesheet" href="../themes/layouts/small.css" />
    <script type="text/javascript" src="../src/calendar.js"></script>
    <script type="text/javascript" src="../lang/calendar-en.js"></script>    -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Thông tin Giảng viên"/>
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
                <td align="right" style="width:15%" class="style2">
			<asp:label id="lblTeacherCode" CssClass="cssManField" runat="server" 
                Text="Mã giảng viên" />
                         </td>
                <td style="width:30%" align="left" class="style3">
			<asp:textbox id="m_txt_ma_giang_vien" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                         <td align="left" style="width:1%;"> (*)
                             <asp:RequiredFieldValidator ID="m_rfv_ma_giang_vien" runat="server" 
                        ControlToValidate="m_txt_ma_giang_vien" Text="*" ErrorMessage="Bạn phải nhập Mã Giảng viên"></asp:RequiredFieldValidator></td>
                <td align="left" class="style1">
			       
			    </td>
                <td align="left" style="width:30%;">&nbsp;</td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblName" CssClass="cssManField" runat="server" 
                Text="Họ và Tên đệm" />
                         </td>
                <td align="left" class="style3">
			<asp:textbox id="m_txt_middle_name" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                         <td align="left" style="width:1%;"> (*)
                             <asp:RequiredFieldValidator ID="m_rfv_teacher_name" runat="server" 
                        ControlToValidate="m_txt_middle_name" Text="*" ErrorMessage="Bạn phải nhập họ và tên đệm giảng viên"></asp:RequiredFieldValidator></td>
                <td align="right" class="style1">
			       
			<asp:label id="lblName0" CssClass="cssManField" runat="server" 
                Text="Tên giảng viên" />
                         </td>
                <td align="left" style="width:1%;">
			<asp:textbox id="m_txt_last_name" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" />
                         </td>
                 <td align="right" class="style1"> (*)
                             <asp:RequiredFieldValidator Text="*" ID="m_rfv_teacher_name0" runat="server" 
                        ControlToValidate="m_txt_last_name"
                        ErrorMessage="Bạn phải nhập tên giảng viên"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblBirthDay" CssClass="cssManField" runat="server" 
                Text="Ngày sinh" />
                         </td>
                <td align="left" class="style3">
			        <ew:CalendarPopup ID="m_dat_ngay_sinh_gv" runat="server" 
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
                </td>
                <td align="right" class="style1">
			       
			<asp:label id="lblSex" CssClass="cssManField" runat="server" 
                Text="Giới tính" />
                         </td>
                <td align="left" style="width:1%;">
			        <asp:RadioButtonList ID="rb_sex" runat="server" 
                       
                        RepeatDirection="Horizontal" Width="167px">
                        <asp:ListItem Selected="True" Value="Male">Nam</asp:ListItem>
                        <asp:ListItem Value="Female">Nữ</asp:ListItem>
                    </asp:RadioButtonList>
                         </td>
                 <td align="right" class="style1">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;
                    <asp:label id="lblChucVuHienTai" CssClass="cssManField" runat="server" 
                Text="Chức vụ hiện tại" /></td>
                <td align="left" class="style3">
                    &nbsp;<asp:textbox id="m_txt_chuc_vu_hien_tai" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" /></td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" class="style1">
                    <asp:label id="lblChucVuCaoNhat" CssClass="cssManField" runat="server" 
                Text="Chức vụ cao nhất" /></td>
                <td align="left" style="width:10%;">
                <asp:textbox id="m_txt_chuc_vu_cao_nhat" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" /></td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblTelHome" CssClass="cssManField" runat="server" 
                Text="SĐT Nhà riêng" />
                </td>
                <td align="left" class="style3">
			&nbsp;<asp:textbox id="m_txt_tel_home" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" style="width:9%">
               
                     <asp:label id="m_lbl_sdt_co_quan" CssClass="cssManField" runat="server" 
                Text="SĐT cơ quan" />
                    </td>
                      <td align="left" class="style1">
			
                     <asp:TextBox ID="m_txt_tel_office" runat="server" CssClass="cssTextBox" 
                        MaxLength="64" Width="94%" />
			
                    </td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style3">
                    &nbsp;
                    <asp:label id="lblMobilePhone" CssClass="cssManField" runat="server" 
                Text="SĐT Di động" /></td>
                <td align="left">
                    &nbsp;<asp:textbox id="m_txt_mobile_phone" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" /></td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" class="style1">
                    <asp:label id="lblOfficeName" CssClass="cssManField" runat="server" 
                Text="Tên cơ quan công tác" /></td>
                <td align="left" style="width:10%;">
                       <asp:textbox id="m_txt_co_quan_cong_tac" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" /></td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style3">
                    &nbsp;<asp:Label ID="lblEmail" runat="server" CssClass="cssManField" Text="Email" /></td>
                <td align="left">
                    &nbsp;<asp:TextBox ID="m_txt_email" runat="server" CssClass="cssTextBox" 
                        MaxLength="64" Width="96%" /></td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" class="style1">
                    <asp:label id="lblEmailTopica" CssClass="cssManField" runat="server" 
                Text="Email Topica" /></td>
                <td align="left" style="width:10%;">
                    <asp:textbox id="m_txt_email_topica" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" /></td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    <asp:Label ID="lblHocVi" runat="server" CssClass="cssManField" Text="Học vị" />
                </td>
                <td align="left" class="style3">
                    &nbsp;<asp:DropDownList ID="m_cbo_hoc_vi" runat="server" CssClass="cssDorpdownlist" 
                        Width="96%" />
                </td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" class="style1">
                    <asp:Label ID="lblHocHam" runat="server" CssClass="cssManField" 
                        Text="Học hàm" />
                </td>
                <td align="left" colspan="2">
                    <asp:DropDownList ID="m_cbo_hoc_ham" runat="server" CssClass="cssDorpdownlist" 
                        Width="94%" />
                    &nbsp;</td>
             
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblChuyenNganhChinh" CssClass="cssManField" runat="server" 
                Text="Chuyên ngành chính" />
                </td>
                <td align="left" class="style3">
			<asp:textbox id="m_txt_chuyen_nganh_chinh" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                     <td align="left" style="width:1%;">
                             &nbsp;</td>
                <td align="right" class="style1">
			<asp:label id="lblTruongDaoTao" CssClass="cssManField" runat="server" 
                Text="Trường đào tạo" />
                </td>
                <td align="left">
                <asp:textbox id="m_txt_truong_dao_tao" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" />
			        &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblTrangThaiGiangVien" CssClass="cssManField" runat="server" 
                Text="Trạng thái giảng viên" />
                </td>
                <td align="left" class="style3">
		    <asp:DropDownList id="m_cbo_dm_trang_thai_giang_vien" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" class="style1">
			        &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblSoTaiKhoan" CssClass="cssManField" runat="server" 
                Text="Số Tài Khoản" />
                </td>
                <td align="left" class="style3"><asp:textbox id="m_txt_so_tai_khoan" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" class="style1">
			<asp:label id="lblTenNganHang" CssClass="cssManField" runat="server" 
                Text="Tên ngân hàng" />
                </td>
                <td align="left" >
                <asp:textbox id="m_txt_ten_ngan_hang" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" />
			        &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblSoCMND" CssClass="cssManField" runat="server" 
                Text="Số CMND" />
                </td>
                <td align="left" class="style3">
			<asp:textbox id="m_txt_so_cmnd" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                     <td align="left" style="width:1%;">
                              &nbsp;</td>
                <td align="right" class="style1">
			<asp:label id="lblNgayCap" CssClass="cssManField" runat="server" 
                Text="Ngày Cấp" />
                </td>
                <td align="left" style="width:10%;">
			        <ew:CalendarPopup ID="m_dat_ngay_cap" runat="server" 
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
                             &nbsp;</td>
                <td align="left" style="width:10%;">
			        &nbsp;</td>
                      <td align="left" style="width:1%;">
                             &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			        &nbsp;</td>
                <td align="left" class="style3">
			        &nbsp;</td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" class="style1">
			<asp:label id="lblNgayCap0" CssClass="cssManField" runat="server" 
                Text="Nơi Cấp" />
                </td>
                <td align="left">
			<asp:textbox id="m_txt_noi_cap" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" />
                         </td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblDonViQuanLy" CssClass="cssManField" runat="server" 
                Text="Đơn vị quản lý" />
                </td>
                <td align="left" class="style3">
			        <asp:DropDownList ID="m_cbo_dm_don_vi_quan_ly" runat="server" 
                        CssClass="cssDorpdownlist" Width="96%" />
                         </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" class="style1">
			<asp:label id="lblMaSoThue" CssClass="cssManField" runat="server" 
                Text="Mã số thuế" />
                </td>
                <td align="left">
                <asp:textbox id="m_txt_ma_so_thue" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="94%" /> 
			        &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblLoaiHopDongGiaoVien" CssClass="cssManField" runat="server" 
                Text="Giảng viên..." />
		                    </td>
                <td align="left" class="style3">
			        <asp:CheckBoxList ID="m_cbl_loai_hop_dong" runat="server">
                        <asp:ListItem>Hướng dẫn</asp:ListItem>
                        <asp:ListItem>Chuyên Môn</asp:ListItem>
                        <asp:ListItem>Viết Học Liệu</asp:ListItem>
                        <asp:ListItem>Duyệt Học Liệu</asp:ListItem>
                        <asp:ListItem>Thẩm định Học Liệu</asp:ListItem>
                        <asp:ListItem>Hội Đồng Khoa Học</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                     <td align="left" style="width:1%;">&nbsp;</td>
                <td align="right" class="style1">
			<asp:label id="lblMaPoChinh" CssClass="cssManField" runat="server" 
                Text="PO phụ trách chính" /><br />
                <p></p>
			<asp:label id="lblMaPophu" Text="PO phụ trách phụ" CssClass="cssManField" runat="server" 
                Tex="" />
                </td>
                <td align="left" style="width:10%;">
			        <asp:DropDownList ID="m_cbo_po_phu_trach_chinh" runat="server" 
                        CssClass="cssDorpdownlist" Width="96%" />
                <br /><p></p>
              	<asp:DropDownList ID="m_cbo_po_phu_trach_phu" runat="server" 
                        CssClass="cssDorpdownlist" Width="96%" />
                
			        </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>            
                         <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                <asp:label id="m_lbl_description" CssClass="cssManField" runat="server" 
                Text="Mô tả" />
		                    </td>
                <td align="left" class="style3">
                <asp:textbox id="m_txt_description" CssClass="cssTextBox"  runat="server" 
               TextMode="MultiLine" Rows="4" Width="96%" />
                </td>
                     <td align="left" style="width:1%;">&nbsp;</td>
                <td align="right" class="style1">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>            
                         <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			        &nbsp;</td>
                <td align="left" class="style3">
			        <asp:button id="m_cmd_luu_du_lieu" accessKey="s" CssClass="cssButton" 
                runat="server" Width="98px" Text="Lưu dữ liệu" 
                        Height="24px" onclick="m_cmd_luu_du_lieu_Click" />
                </td>
			   <td align="left" style="width:1%;"></td>
                 <td align="left" class="style1">
                     &nbsp;</td>
                <td align="left" style="width:10%;">
                 <asp:button id="m_cmd_thoat" CssClass="cssButton" 
                runat="server" Width="98px" Text="Thoát"
                      CausesValidation="false"  Height="25px" onclick="m_cmd_thoat_Click"  />
                 </td>     
                <td align="left" style="width:1%;"></td>
            </tr>
        </table>
		</td>
	</tr>
    <tr>
		<td>
            &nbsp;</td>
	</tr>
</table>
</asp:Content>

