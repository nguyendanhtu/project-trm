<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F202_DanhSachGiangVien.aspx.cs" Inherits="ChuNang_F202_DanhSachGiangVien" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
 a 
 {
   text-decoration:none;    
 }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label1" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách giảng viên"/>
		</td>
	</tr>	
    <tr>
        <td>
        
        <table cellspacing="0" cellpadding="2" style="width:1000px;" class="cssTable" border="0"> 
            <tr>
                <td align="right" style="width:7%;">
			<asp:label id="lblFullName" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;H&lt;/U&gt;ọ tên giảng viên" />
                         </td>
                <td align="left" colspan="3">
                <asp:TextBox ID="m_txt_ten_giang_vien" runat="server" CssClass="cssTextBox" 
                        Width="85%"></asp:TextBox>
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
                    &nbsp; <asp:DropDownList id="m_cbo_trang_thai_g_vien" runat="server" Width="85%" 
                        CssClass="cssDorpdownlist"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td align="right" style="width:10%;">
                    <asp:label id="Label12" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;N&lt;/U&gt;gày bắt đầu hợp tác" />
		            </td>
                <td align="left" colspan="2" style="margin-left: 40px">
               <ew:CalendarPopup ID="m_dat_ngay_bd_hop_tac" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="60%" Text="" Culture="vi-VN" 
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
                        CssClass="cssDorpdownlist" Width="85%" /></td>
                <td align="right" style="width:10%;">
                    <asp:label id="Label13" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;háng sinh nhật Giảng viên" />
		            </td>
                <td align="left" colspan="2">
                    <asp:DropDownList id="m_cbo_thang_sn_GV" runat="server" Width="65%" 
                        CssClass="cssDorpdownlist"  >
                        <asp:ListItem Selected="True" Value="0">Tất cả</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    </td>
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
                        Width="85%"></asp:TextBox></td>
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
                
                Text="(Từ khóa tìm kiếm: Mã giảng viên, tên giảng viên hoặc email, trường đào tạo,loại hợp đồng, ngày bắt đầu hợp tác, ngày sinh,....)" />

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
                <td align="left" colspan="2">     
			<asp:button id="m_cmd_loc_du_lieu" accessKey="l" CssClass="cssButton" 
                runat="server" Width="98px" Text="Lọc dữ liệu(l)" 
                        Height="23px" onclick="m_cmd_loc_du_lieu_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton id="m_lbt_advanced_search" PostBackUrl="/TRMProject/ChucNang/F205_AdvanceSearchGiangVien.aspx" runat="server" CausesValidation="false" Text= "Tìm kiếm nâng cao"></asp:LinkButton>
			</td>
                <td align="right" >
			        &nbsp;</td>
                <td align="left" >    
			<asp:button id="m_cmd_xuat_excel" accessKey="x" CssClass="cssButton" 
                runat="server" Width="98px" Text="Xuất Excel (x)" Height="22px" 
                        onclick="m_cmd_xuat_excel_Click"  />
			</td>
                             <td align="left" >&nbsp;</td>
                 <td align="right" >
                 <asp:HiddenField id="hdf_id" runat="server"/></td>
                <td align="left" ></td>    
                <td align="left" ></td>
            </tr>
            </table>        
        </td>
    </tr>  
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="m_lbl_ket_qua_loc_du_lieu" runat="server" CssClass="cssPageTitle" 
                Text="Kết quả lọc dữ liệu"/>
		</td>
	</tr>	
    <tr>
		<td align="left">
        &nbsp;<asp:button  id="cmd_them_moi" accessKey="c" CssClass="cssButton" 
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
                 <asp:TemplateField>
                    <ItemTemplate> <asp:LinkButton ID = "lbt_delete"  runat="server"
                     CommandName="Delete" ToolTip="Xóa" OnClientClick="return confirm ('Bạn có thực sự muốn xóa bản ghi này?')">
                     <img src="/TRMProject/Images/Button/deletered.png" alt="Delete" />
                     </asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <ItemTemplate> <asp:HyperLink ToolTip="Sửa" ImageUrl="/TRMProject/Images/Button/edit.png" ID = "lbt_edit" runat="server"
                     NavigateUrl='<%# "/TRMProject/ChucNang/F201_CapNhatThongTinGiangVien.aspx?mode=edit&id="+Eval("ID") %>'></asp:HyperLink>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <ItemTemplate> <asp:HyperLink ToolTip="Hợp đồng giảng viên" ImageUrl="/TRMProject/Images/Button/detail.png" ID = "lbt_hop_dong_gv" runat="server"
                     NavigateUrl='<%# "/TRMProject/ChucNang/F306_HopDongKhungGiangVien.aspx?id_gv="+Eval("ID") %>'></asp:HyperLink>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><asp:Label ID="m_lbl_stt" runat="server" Text="<%# Container.DataItemIndex + 1 %>"></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>Mã giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_ma_gv" runat="server" Text='<%# Eval("MA_GIANG_VIEN").ToString() %>' ></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px"/>
                    </asp:TemplateField>
                     <asp:TemplateField Visible="false">
                    <HeaderTemplate>Tên giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_ten_gv" runat="server"
                    Text='<%# Eval("HO_VA_TEN_DEM").ToString().Trim()+" "+Eval("TEN_GIANG_VIEN").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px"/>
                    </asp:TemplateField>

                    <asp:TemplateField>
                    <HeaderTemplate>Tên giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <label>
                    <a href='<%# "/TRMProject/ChucNang/F201_CapNhatThongTinGiangVien.aspx?mode=edit&id="+Eval("ID") %>'>
                    <%# Eval("HO_VA_TEN_DEM").ToString().Trim()+" "+Eval("TEN_GIANG_VIEN").ToString() %></a></label>
                    </ItemTemplate>
                    <ItemStyle Width="200px"/>
                    </asp:TemplateField>
                     <asp:TemplateField Visible="false">
                    <HeaderTemplate>Ngày sinh</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_ngay_sinh" runat="server" Text='<%# mapping_format_datetime(Eval("NGAY_SINH").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="NGAY_SINH" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh" />

                    <asp:TemplateField>
                    <HeaderTemplate>Giới tính</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_gender" runat="server" Text='<%# mapping_gender(Eval("GIOI_TINH_YN").ToString()) %>'> </asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField >
                    <HeaderTemplate>Đơn vị quản lý</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_don_vi_quan_ly" runat="server" Text='<%# Eval("DON_VI_QUAN_LY").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField>
                    <HeaderTemplate>Địa chỉ giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_dia_chi" runat="server" Text='<%# Eval("DIA_CHI").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField >
                    <HeaderTemplate>Tên cơ quan công tác</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_co_qua_cong_tac" runat="server" Text='<%# Eval("TEN_CO_QUAN_CONG_TAC").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField >
                    <HeaderTemplate>Điện thoại cơ quan</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_dt_co_quan" runat="server" Text='<%# Eval("TEL_OFFICE").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField >
                    <HeaderTemplate>Điện thoại di động</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_dt_di_dong" runat="server" Text='<%# Eval("MOBILE_PHONE").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField >
                    <HeaderTemplate>Điện thoại nhà riêng</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_dt_nha_rieng" runat="server" Text='<%# Eval("TEL_HOME").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField >
                    <HeaderTemplate>Số chứng minh</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_so_cmt" runat="server" Text='<%# Eval("SO_CMTND").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="NGAY_CAP" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày cấp" />
                       <asp:TemplateField Visible="false">
                    <HeaderTemplate>Ngày cấp</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_ngay_cap" runat="server" Text='<%# Eval("NGAY_CAP").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField>
                    <HeaderTemplate>Nơi cấp</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_noi_cap" runat="server" Text='<%# Eval("NOI_CAP").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField>
                    <HeaderTemplate>Email</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_email" runat="server" Text='<%# Eval("EMAIL").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                    <HeaderTemplate>TOPICA Email</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_topica_email" runat="server" Text='<%# Eval("EMAIL_TOPICA").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                    <HeaderTemplate>Số tài khoản</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_so_tai_khoan" runat="server" Text='<%# Eval("SO_TAI_KHOAN").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField>
                    <HeaderTemplate>Tên ngân hàng</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_ten_ngan_hang" runat="server" Text='<%# Eval("TEN_NGAN_HANG").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                        <asp:TemplateField>
                    <HeaderTemplate>Mã số thuế</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_ma_so_thue" runat="server" Text='<%# Eval("MA_SO_THUE").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                          <asp:TemplateField>
                    <HeaderTemplate>Học vị</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_hoc_vi" runat="server" Text='<%# mapping_hoc_vi(CIPConvert.ToStr(Eval("HOC_VI")))%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                       <asp:TemplateField>
                    <HeaderTemplate>Học hàm</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_hoc_ham" runat="server" Text='<%# mapping_hoc_ham(CIPConvert.ToStr(Eval("HOC_HAM")))%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                   </asp:TemplateField>
                     <asp:TemplateField>
                    <HeaderTemplate>Chuyên ngành chính</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_chuyen_nganh_chinh" runat="server" Text='<%# Eval("CHUYEN_NGANH_CHINH").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField>
                    <HeaderTemplate>Trường đào tạo</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_truong_dao_tao" runat="server" Text='<%# Eval("TRUONG_DAO_TAO").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField>
                    <HeaderTemplate>Chức vụ hiện tại</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_chuc_vu_hien_tai" runat="server" Text='<%# Eval("CHUC_VU_HIEN_TAI").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField>
                    <HeaderTemplate>Chức vụ cao nhất</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_chuc_vu_cao_nhat" runat="server" Text='<%# Eval("CHUC_VU_CAO_NHAT").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField Visible="false">
                    <HeaderTemplate>Ảnh cá nhân</HeaderTemplate>
                    <ItemTemplate>
                    <img alt="anh ca nhan" src='<%# "/TRMProject/Images/PrivateImages/"+ Eval("ANH_CA_NHAN") %>' />
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>Trạng thái giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_trang_thai_gv" runat="server" Text='<%# Eval("TRANG_THAI_GIANG_VIEN").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField>
                    <HeaderTemplate>PO phụ trách chính</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_po_phu_trach_chinh" runat="server" Text='<%# Eval("PO_PHU_TRACH_CHINH").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField>
                    <HeaderTemplate>PO phụ trách phụ</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_po_phu_trach_phu" runat="server" Text='<%# Eval("PO_PHU_TRACH_PHU").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField Visible="false">
                    <HeaderTemplate>Ngày bắt đầu hợp tác</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_ngay_bd_hop_tac" runat="server" Text='<%# Eval("NGAY_BD_HOP_TAC").ToString() %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                       <asp:BoundField DataField="NGAY_BD_HOP_TAC" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày bắt đầu hợp tác" />

                    <asp:TemplateField>
                    <HeaderTemplate>GV hướng dẫn?</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_gv_huong_dan" runat="server" Text='<%# mapping_hd(Eval("GVHD_YN").ToString())%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV chuyên môn </HeaderTemplate>
                    <ItemTemplate>
                     <asp:Label ID="m_lbl_gv_chuyen_mon" runat="server" Text='<%# mapping_cm(Eval("GVCM_YN").ToString())%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV viết học liệu</HeaderTemplate>
                     <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                     <asp:Label ID="m_lbl_gv_viet_hoc_lieu" runat="server" Text='<%# mapping_viet_hl(Eval("GV_VIET_HL_YN").ToString())%>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV duyệt học liệu</HeaderTemplate>
                    <ItemTemplate>
                   <asp:Label ID="m_lbl_gv_duyet_hoc_lieu" runat="server" Text='<%# mapping_duyet_hl(Eval("GV_DUYET_HL_YN").ToString())%>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV thẩm định học liệu</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_gv_tham_dinh_hoc_lieu" runat="server" Text='<%# mapping_tham_dinh_hl(Eval("GV_THAM_DINH_HL_YN").ToString())%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV quay học liệu</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_gv_quay_hoc_lieu" runat="server" Text='<%# mapping_quay_hl(Eval("GV_QUAY_HL").ToString())%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                     <asp:TemplateField>
                    <HeaderTemplate>GV hội đồng khoa học</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_gv_hoi_dong_kh" runat="server" Text='<%# mapping_hdkh(Eval("GV_HDKH_YN").ToString())%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
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

</asp:Content>
