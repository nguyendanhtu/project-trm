<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F302_DanhSachHopDongKhung.aspx.cs" Inherits="ChucNang_F302_DanhSachHopDongKhung" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:MultiView ID="mtv_hop_dong_khung" runat="server">

  <asp:View ID="m_view_form_cap_nhat_hop_dong_khung" runat="server">
     Đây là chỗ cho Form cập nhật thông tin
  </asp:View>

  <asp:View ID="m_view_danh_sach_hop_dong_khung" runat="server">
 <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
  <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label1" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách hợp đồng khung"/>
		</td>
	</tr>	
  <tr>
        <td>
        <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0"> 
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblFullName" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;ên môn học" />
                         </td>
                <td align="left" style="width:10%;">
		    <asp:DropDownList id="m_cbo_dm_mon_hoc" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
                         </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
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
			<asp:label id="lblFullName4" CssClass="cssManField" runat="server" 
                Text="Có Online?" />
                </td>
                <td align="left" style="width:10%;">
			        <asp:RadioButtonList ID="m_rbt_online_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="ALL">Tất cả</asp:ListItem>
                        <asp:ListItem Value="Y">Có</asp:ListItem>
                        <asp:ListItem Value="N">Không</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" style="width:5%;">
			<asp:label id="lblFullName5" CssClass="cssManField" runat="server" 
                Text="Có Offline?" />
		                    </td>
                <td align="left" style="width:10%;">
			
			        <asp:RadioButtonList ID="m_rbt_offline_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="ALL">Tất cả</asp:ListItem>
                        <asp:ListItem Value="Y">Có</asp:ListItem>
                        <asp:ListItem Value="N">Không</asp:ListItem>
                    </asp:RadioButtonList>
		                    </td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
                 <td align="right" style="width:5%;">
			<asp:label id="lblFullName6" CssClass="cssManField" runat="server" 
                Text="Có bài tập giữa kỳ?" />
		                    </td>
                <td align="left" style="width:10%;">
			        <asp:RadioButtonList ID="m_rbt_bt_gky_yn" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="ALL">Tất cả</asp:ListItem>
                        <asp:ListItem Value="Y">Có</asp:ListItem>
                        <asp:ListItem Value="N">Không</asp:ListItem>
                    </asp:RadioButtonList>
		                    </td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="Label2" CssClass="cssManField" runat="server" 
                Text="Ngày bắt đầu từ ngày" />
		                    </td>
                <td align="left" style="width:10%;">
			
			        <ew:CalendarPopup ID="m_dat_ngay_bat_dau_tu" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="80%" SelectedDate="" 
                        AllowArbitraryText="False" CellPadding="0px">
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
			<asp:label id="Label17" CssClass="cssManField" runat="server" 
                Text="Ngày kết thúc từ" />
		                    </td>
                <td align="left" style="width:10%;">
			
			        <ew:CalendarPopup ID="m_dat_ngay_ket_thuc_tu" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="80%" SelectedDate="">
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
			<asp:label id="Label6" CssClass="cssManField" runat="server" 
                Text="Ngày thi từ ngày" />
		                    </td>
                <td align="left" style="width:10%;">
			
			        <ew:CalendarPopup ID="m_dat_ngay_thi_tu" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="80%" SelectedDate="">
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
                         <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="Label16" CssClass="cssManField" runat="server" 
                Text="Đến ngày" />
		                    </td>
                <td align="left" style="width:10%;">
			        <ew:CalendarPopup ID="m_dat_ngay_bat_dau_den" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="80%" SelectedDate="">
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
                                 <td align="left" style="width:1%;"></td>
                <td align="right" style="width:5%;">
			<asp:label id="Label18" CssClass="cssManField" runat="server" 
                Text="Đến ngày" />
		                    </td>
                <td align="left" style="width:10%;">

			        <ew:CalendarPopup ID="m_dat_ngay_ket_thuc_den" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="80%" SelectedDate="">
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
                                 <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;">
			<asp:label id="Label8" CssClass="cssManField" runat="server" 
                Text="Đến ngày" />
		                    </td>
                <td align="left" style="width:10%;">

			        <ew:CalendarPopup ID="m_dat_ngay_thi_den" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="80%" SelectedDate="">
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

		        </td>     <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="Label4" CssClass="cssManField" runat="server" 
                Text="Từ khóa tìm kiếm" />
		                    </td>
                <td align="left" style="width:10%;">     

		            <asp:TextBox ID="m_txt_tu_khoa_tim_kiem" runat="server" CssClass="cssTextBox" 
                        Width="244%"></asp:TextBox>

			    </td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                   <td align="left" style="width:1%;" colspan="4">

                <asp:label id="lblFullName1" CssClass="cssLabel" runat="server" 
                
                Text="(Từ khóa tìm kiếm: Mã lớp môn hoặc PO phụ trách hoặc chương trình phụ trách)" />

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
                        Height="23px" />
			</td>
                             <td align="left" style="width:1%;">&nbsp;</td>
                <td align="right" >
			        &nbsp;</td>
                <td align="left" >    
			<asp:button id="m_cmd_xuat_excel" accessKey="x" CssClass="cssButton" 
                runat="server" Width="98px" Text="Xuất Excel (x)" Height="22px"  />
			</td>
                             <td align="left" >&nbsp;</td>
                 <td align="right" ></td>
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
                Height="27px"/>
        </td>
        <td >
		    &nbsp;</td>
	</tr>	
	<tr>
		<td align="center" colspan="3" style="height:450px;" valign="top">
		    &nbsp;
    <div id="grdCharges" runat="server" style="width: 100%; overflow: auto; height: auto;">
   <asp:GridView ID="m_grv_dm_danh_sach_hop_dong_khung" AllowPaging="true" 
                runat="server" AutoGenerateColumns="False" 
                Width="101%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" GridLines="Both" 
            AllowSorting="True" >
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SO_HOP_DONG" HeaderText="Số hợp đồng" 
                        Visible="False">
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle></asp:BoundField>
                    <asp:TemplateField>
                    <HeaderTemplate>Giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# Eval("GIANG_VIEN").ToString() %></label>
                    </ItemTemplate>
                    <ItemStyle Width="200px"/>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NGAY_KY" HeaderText="Ngày ký" />
                     <asp:BoundField DataField="NGAY_HIEU_LUC" HeaderText="Ngày hiệu lực">
                    </asp:BoundField>
                    <asp:BoundField DataField="NGAY_KET_THUC_DU_KIEN" HeaderText="Ngày kết thúc dự kiến">
                    </asp:BoundField>
                     <asp:BoundField DataField="LOAI_HOP_DONG" HeaderText="Loại hợp đồng">
                    </asp:BoundField>
                     <asp:BoundField DataField="DON_VI_QUAN_LY" HeaderText="Đơn vị quản lý">
                    </asp:BoundField>
                    <asp:BoundField DataField="TRANG_THAI_HOP_DONG" HeaderText="Trạng thái hợp đồng">
                    </asp:BoundField>
                     <asp:BoundField DataField="DON_VI_THANH_TOAN" HeaderText="Đơn vị thanh toán">
                    </asp:BoundField>
                    <asp:BoundField DataField="THUE_SUAT" HeaderText="Thuế suất">
                    </asp:BoundField>
                     <asp:BoundField DataField="GHI_CHU" HeaderText="Ghi chú" />
                     <asp:BoundField DataField="FIRST_MON" HeaderText="Môn 1" />
                     <asp:BoundField DataField="SEC_MON" HeaderText="Môn 2" />
                     <asp:BoundField DataField="THIR_MON" HeaderText="Môn 3" />
                     <asp:BoundField DataField="FOURTH_MON" HeaderText="Môn 4" />
                     <asp:BoundField DataField="FITH_MON" HeaderText="Môn 5" />
                     <asp:BoundField DataField="SIXTH_MON" HeaderText="Môn 6" />
                     <asp:BoundField DataField="GIA_TRI_HOP_DONG" HeaderText="Giá trị hợp đồng" />
                    <asp:TemplateField>
                    <HeaderTemplate>Làm học liệu?</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_hl(Eval("HOC_LIEU_YN").ToString())%></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                       <HeaderTemplate>Vận hành?</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_vh(Eval("VAN_HANH_YN").ToString())%></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
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
    </div>
            </td>
	</tr>	

</table>
  </asp:View>

</asp:MultiView>
</asp:Content>

