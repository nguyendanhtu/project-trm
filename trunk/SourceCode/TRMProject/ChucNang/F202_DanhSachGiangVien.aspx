<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F202_DanhSachGiangVien.aspx.cs" Inherits="ChuNang_F202_DanhSachGiangVien" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:MultiView ID="mtv_giang_vien" runat="server">

  <asp:View ID="m_view_form_cap_nhat_giang_vien" runat="server">
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
                <td align="right" class="style2">
			<asp:label id="lblTeacherCode" CssClass="cssManField" runat="server" 
                Text="Mã giảng viên" />
                         </td>
                <td align="left" class="style3">
			<asp:textbox id="m_txt_ma_giang_vien" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                         <td align="left" style="width:1%;"> 
                             <asp:RequiredFieldValidator ID="m_rfv_ma_giang_vien" runat="server" 
                        ControlToValidate="m_txt_ma_giang_vien" Text="*" ErrorMessage="Bạn phải nhập Mã Giảng viên"></asp:RequiredFieldValidator></td>
                <td align="left" class="style1">
			       
			    </td>
                <td align="left" style="width:10%;" rowspan="3">&nbsp;</td>
                <td align="left" style="width:1%;"></td>
                 <td align="right" class="style1"></td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblName" CssClass="cssManField" runat="server" 
                Text="Họ Tên" />
                         </td>
                <td align="left" class="style3">
			<asp:textbox id="m_txt_name" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                         <td align="left" style="width:1%;"> 
                             <asp:RequiredFieldValidator ID="m_rfv_teacher_name" runat="server" 
                        ControlToValidate="m_txt_name" Text="*" ErrorMessage="Bạn phải nhập tên giảng viên"></asp:RequiredFieldValidator></td>
                <td align="left" class="style1">
			       
			        &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" class="style1">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
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
                </td>
                <td align="left" class="style1">
			       
			        &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" class="style1">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblSex" CssClass="cssManField" runat="server" 
                Text="Giới tính" />
                         </td>
                <td align="left" class="style3">
			        <asp:RadioButtonList ID="rb_sex" runat="server" 
                       
                        RepeatDirection="Horizontal" Width="167px">
                        <asp:ListItem Selected="True" Value="Male">Nam</asp:ListItem>
                        <asp:ListItem Value="Female">Nữ</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="left" class="style1">
			       
			        &nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" class="style1">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
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
                <td align="left" class="style1">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
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
                    &nbsp;<asp:label id="lblChucVuCaoNhat" CssClass="cssManField" runat="server" 
                Text="Chức vụ cao nhất" /></td>
                <td align="left" class="style3">
                    &nbsp;<asp:textbox id="m_txt_chuc_vu_cao_nhat" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" /></td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="left" class="style1">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
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
			<asp:label id="lblTelHome" CssClass="cssManField" runat="server" 
                Text="SĐT Nhà riêng" />
                </td>
                <td align="left" class="style3">
			&nbsp;<asp:textbox id="m_txt_tel_home" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="left" style="width:9%">
               
			        &nbsp;</td>
                      <td align="left" class="style1">
                          &nbsp;</td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
                 <td align="right" class="style1">
			
                </td>
                <td align="left" style="width:10%;">
			
                         </td>
                <td align="left" style="width:1%;">
                 
                </td>
            </tr>
            <tr>
                <td align="right" class="style3">
			        &nbsp;
                     <asp:label id="m_lbl_sdt_co_quan" CssClass="cssManField" runat="server" 
                Text="SĐT cơ quan" />
                    </td>
                <td align="left" >
                 &nbsp;<asp:TextBox ID="m_txt_tel_office" runat="server" CssClass="cssTextBox" 
                        MaxLength="64" Width="96%" />
			        &nbsp; 
                   </td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
                 <td align="right" class="style1">
                     &nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
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
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="m_txt_mobile_phone" Text="*" ErrorMessage="Bạn phải nhập số điện thoại di động"></asp:RequiredFieldValidator>
                        </td>
                <td align="right" class="style1">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
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
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style3">
                    &nbsp;<asp:label id="lblOfficeName" CssClass="cssManField" runat="server" 
                Text="Tên cơ quan công tác" /></td>
                <td align="left">
                    &nbsp;<asp:textbox id="m_txt_co_quan_cong_tac" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" /></td>
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
			        &nbsp;<asp:label id="lblEmailTopica" CssClass="cssManField" runat="server" 
                Text="Email Topica" /></td>
                <td align="left" class="style3">
                    &nbsp;<asp:textbox id="m_txt_email_topica" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" /></td>
                     <td align="left" style="width:1%;">
                             &nbsp;</td>
                <td align="right" class="style1">
			        &nbsp;</td>
                <td align="left" colspan="4">
                         &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
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
                <td align="left" colspan="4">
                    <asp:DropDownList ID="m_cbo_hoc_ham" runat="server" CssClass="cssDorpdownlist" 
                        Width="98%" />
                    &nbsp;</td>
                <td align="left" style="width:1%;">
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
                <td align="left" colspan="4">
                <asp:textbox id="m_txt_truong_dao_tao" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="98%" />
			        &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
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
                 <td align="right" class="style1">
                     &nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
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
                <td align="left" colspan="4">
                <asp:textbox id="m_txt_ten_ngan_hang" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
			        &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
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
                        ShowGoToToday="True" Width="70%" SelectedDate="" Text="">
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
                 <td align="right" class="style1">
			<asp:label id="lblNoicap" CssClass="cssManField" runat="server" 
                Text="Nơi cấp" />
                </td>
                <td align="left" style="width:10%;">
			<asp:textbox id="m_txt_noi_cap" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                      <td align="left" style="width:1%;">
                             &nbsp;</td>
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
                <td align="left" colspan="4">
                <asp:textbox id="m_txt_ma_so_thue" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
			        &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style2">
			        &nbsp;</td>
                <td align="left" class="style3">
		            &nbsp;</td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" class="style1">
			        &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
                 <td align="right" class="style1">
                     &nbsp;</td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" class="style2">
			<asp:label id="lblLoaiHopDongGiaoVien" CssClass="cssManField" runat="server" 
                Text="Giảng viên..." />
		                    </td>
                <td align="left" class="style3">
			        <asp:CheckBoxList ID="m_cbl_loai_hop_dong" runat="server">
                        <asp:ListItem>Giáo Viên Hợp đồng</asp:ListItem>
                        <asp:ListItem>Giáo Viên Chuyên Môn</asp:ListItem>
                        <asp:ListItem>Giáo Viên Viết Học Liệu</asp:ListItem>
                        <asp:ListItem>Giáo Viên Duyệt Học Liệu</asp:ListItem>
                        <asp:ListItem>Giáo Thẩm định Học Liệu</asp:ListItem>
                        <asp:ListItem>Giáo Viên Hội Đồng Khoa Học</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                     <td align="left" style="width:1%;">
                </td>
                <td align="right" class="style1">
			        &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                 <td align="right" class="style1">
			         &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>            
                         <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" class="style2" style="margin-left: 40px">
                <asp:label id="m_lbl_description" CssClass="cssManField" runat="server" 
                Text="Mô tả" />
                </td>
                <td align="left" class="style3" colspan="3">  
                <asp:textbox id="m_txt_description" CssClass="cssTextBox"  runat="server" 
               TextMode="MultiLine" Rows="4" Width="96%" />
			        &nbsp;</td> 
                <td align="left" style="width:10%;">    
			        &nbsp;</td> <td align="left" style="width:1%;"></td>
                 <td align="right" class="style1"></td>
                <td align="left" style="width:10%;"></td>
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
  </asp:View>

  <asp:View ID="m_view_danh_sach" runat="server">
 <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label1" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách giảng viên"/>
		</td>
	</tr>	
    <tr>
        <td>
        <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0"> 
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblFullName" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;ên giảng viên" />
                         </td>
                <td align="left" colspan="3">
                <asp:TextBox ID="m_txt_ten_giang_vien" runat="server" CssClass="cssTextBox" 
                        Width="315px"></asp:TextBox>
		            &nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
                    &nbsp;<asp:label id="m_lbl_sex" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;G&lt;/U&gt;iới tính" /></td>
                <td align="left" colspan="3">
                    &nbsp; <asp:RadioButtonList ID="rdl_gender_check" runat="server" 
                       
                        RepeatDirection="Horizontal" Width="167px">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem Value="Male">Nam</asp:ListItem>
                        <asp:ListItem Value="Female">Nữ</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" style="width:5%;">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
                    &nbsp;<asp:label id="Label3" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;rạng thái giảng viên" /></td>
                <td align="left" colspan="3">
                    &nbsp; <asp:DropDownList id="m_cbo_trang_thai_g_vien" runat="server" Width="80%" 
                        CssClass="cssDorpdownlist"  /></td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" style="width:5%;">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
                    &nbsp;<asp:label id="Label5" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;Đ&lt;/U&gt;ơn vị quản lý" /></td>
                <td align="left" colspan="3">
                    &nbsp; <asp:DropDownList ID="m_cbo_don_vi_q_ly" runat="server" 
                        CssClass="cssDorpdownlist" Width="80%" /></td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" style="width:5%;">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>                   
            <tr>
                <td align="right" style="width:5%;">
                    &nbsp; <asp:label id="Label4" CssClass="cssManField" runat="server" 
                Text="Từ khóa tìm kiếm" /></td>
                <td align="left" colspan="3">
                     &nbsp;<asp:TextBox ID="m_txt_tu_khoa_tim_kiem" runat="server" CssClass="cssTextBox" 
                        Width="80%"></asp:TextBox></td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
                <td align="right" style="width:5%;">
                    &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
                <td align="left" style="width:1%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                   <td align="left" style="width:1%;" colspan="4">

                <asp:label id="lblFullName1" CssClass="cssLabel" runat="server" 
                
                Text="(Từ khóa tìm kiếm: Mã giảng viên, tên giảng viên hoặc email, trường đào tạo,loại hợp đồng....)" />

		        </td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">          
			        &nbsp;</td>
			    <td align="left" style="width:1%;">
                    &nbsp;</td>
			
                <td align="left" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">     
			        &nbsp;</td>     <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;"></td>     <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" >
			        &nbsp;</td>
                <td align="left">     
			<asp:button id="m_cmd_loc_du_lieu" accessKey="l" CssClass="cssButton" 
                runat="server" Width="98px" Text="Lọc dữ liệu(l)" 
                        Height="23px" onclick="m_cmd_loc_du_lieu_Click" />
			</td>
                             <td align="left" style="width:1%;">&nbsp;</td>
                <td align="right" >
			        &nbsp;</td>
                <td align="left" >    
			<asp:button id="m_cmd_xuat_excel" accessKey="x" CssClass="cssButton" 
                runat="server" Width="98px" Text="Xuất Excel (x)" Height="22px"  />
			</td>
                             <td align="left" >&nbsp;</td>
                 <td align="right" ><asp:HiddenField id="hdf_id" runat="server"/></td>
                <td align="left" ></td>    
                <td align="left" ></td>
            </tr>
            </table>        
        </td>
    </tr>  
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Kết quả lọc dữ liệu"/>
		</td>
	</tr>	
    <tr>
		<td align="left">
        &nbsp;<asp:button id="cmd_them_moi" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo mới(c)" 
                onclick="cmd_them_moi_Click" Height="28px"/>
                <br />
                <asp:label id="m_lbl_thong_bao" runat="server" CssClass="cssManField" />
        </td>
        <td >
		    &nbsp;</td>
	</tr>	
	<tr>
		<td align="center" colspan="3" style="height:450px;" valign="top">
		    &nbsp;
   <asp:GridView ID="m_grv_dm_danh_sach_giang_vien" AllowPaging="True" 
                runat="server" AutoGenerateColumns="False" 
                Width="101%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" 
            AllowSorting="True" 
            onpageindexchanging="m_grv_dm_danh_sach_giang_vien_PageIndexChanging" 
            onrowdeleting="m_grv_dm_danh_sach_giang_vien_RowDeleting" PageSize="15" >
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MA_GIANG_VIEN" HeaderText="Mã giảng viên" 
                        Visible="False">
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle></asp:BoundField>
                    <asp:TemplateField>
                    <HeaderTemplate>Mã giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# Eval("MA_GIANG_VIEN").ToString() %></label>
                    </ItemTemplate>
                    <ItemStyle Width="200px"/>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>Tên giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# Eval("TEN_GIANG_VIEN").ToString() %></label>
                    </ItemTemplate>
                    <ItemStyle Width="200px"/>
                    </asp:TemplateField>
                       <asp:BoundField DataField="NGAY_SINH" HeaderText="Ngày sinh" DataFormatString="{0:d}">
                    </asp:BoundField>
                    <asp:TemplateField>
                    <HeaderTemplate>Giới tính</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_gender(Eval("GIOI_TINH_YN").ToString()) %></label>
                    </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="CHUC_VU_HIEN_TAI" HeaderText="Chức vụ hiện tại">
                    </asp:BoundField>
                    <asp:BoundField DataField="CHUC_VU_CAO_NHAT" HeaderText="Chức vụ cao nhất">
                    </asp:BoundField>
                     <asp:BoundField DataField="TEL_HOME" HeaderText="Điện thoại nhà riêng">
                    </asp:BoundField>
                     <asp:BoundField DataField="TEL_OFFICE" HeaderText="Điện thoại cơ quan">
                    </asp:BoundField>
                    <asp:BoundField DataField="EMAIL" HeaderText="Email">
                    </asp:BoundField>
                     <asp:BoundField DataField="TEN_CO_QUAN_CONG_TAC" HeaderText="Tên cơ quan công tác">
                    </asp:BoundField>
                    <asp:BoundField DataField="EMAIL_TOPICA" HeaderText="TOPICA Email">
                    </asp:BoundField>
                    <asp:TemplateField>
                    <HeaderTemplate>Ảnh cá nhân</HeaderTemplate>
                    <ItemTemplate>
                    <img alt="anh ca nhan" src='<%# "/TRMProject/Images/PrivateImages/"+ Eval("ANH_CA_NHAN") %>' />
                    </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="HOC_VI" HeaderText="Học vị" />
                     <asp:BoundField DataField="HOC_HAM" HeaderText="Học hàm" />
                     <asp:BoundField DataField="CHUYEN_NGANH_CHINH" HeaderText="Chuyên ngành chính" />
                     <asp:BoundField DataField="TRUONG_DAO_TAO" HeaderText="Trường đào tạo" />
                     <asp:BoundField DataField="TRANG_THAI_GIANG_VIEN" HeaderText="Trạng thái giảng viên" />
                     <asp:BoundField DataField="SO_TAI_KHOAN" HeaderText="Số tài khoản" />
                     <asp:BoundField DataField="TEN_NGAN_HANG" HeaderText="Tên ngân hàng" />
                     <asp:BoundField DataField="SO_CMTND" HeaderText="Số chứng minh" />
                       <asp:BoundField DataField="NGAY_CAP" HeaderText="Ngày Cấp" DataFormatString="{0:d}">
                    </asp:BoundField>
                     <asp:BoundField DataField="NOI_CAP" HeaderText="Nơi cấp" />
                     <asp:BoundField DataField="DON_VI_QUAN_LY" HeaderText="Đơn vị quản lý" />
                     <asp:BoundField DataField="MA_SO_THUE" HeaderText="Mã số thuế" />
                    <asp:TemplateField>
                    <HeaderTemplate>GV hướng dẫn?</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_hd(Eval("GVHD_YN").ToString())%></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV chuyên môn </HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_cm(Eval("GVCM_YN").ToString())%></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV viết học liệu</HeaderTemplate>
                     <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                    <label><%# mapping_viet_hl(Eval("GV_VIET_HL_YN").ToString())%></label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV duyệt học liệu</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_duyet_hl(Eval("GV_DUYET_HL_YN").ToString())%></label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV thẩm định học liệu</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_tham_dinh_hl(Eval("GV_THAM_DINH_HL_YN").ToString())%></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                     <asp:TemplateField>
                    <HeaderTemplate>GV hội đồng khoa học</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_hdkh(Eval("GV_HDKH_YN").ToString())%></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <ItemTemplate> <asp:LinkButton ID = "lbt_delete"  runat="server"
                     CommandName="Delete" ToolTip="Xóa" OnClientClick="return confirm ('Bạn có thực sự muốn xóa bản ghi này?')">
                     <img src="/TRMProject/Images/Button/deletered.png" alt="Delete" />
                     </asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <ItemTemplate> <asp:HyperLink ToolTip="Sửa" ImageUrl="/TRMProject/Images/Button/edit.png" ID = "lbt_edit" runat="server"
                     NavigateUrl='<%# "/TRMProject/ChucNang/F202_DanhSachGiangVien.aspx?mode=edit&id="+Eval("ID") %>'></asp:HyperLink>
                    </ItemTemplate>
                    </asp:TemplateField>
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
  </asp:View>

</asp:MultiView>

</asp:Content>
