<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F501_DuToanHopDongVanHanh.aspx.cs" Inherits="ChucNang_F501_DuToanHopDongVanHanh" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 7%;
            height: 29px;
        }
        .style2
        {
            width: 10%;
            height: 29px;
        }
        .style3
        {
            width: 5%;
            height: 29px;
        }
        .style4
        {
            width: 1%;
            height: 29px;
        }
    </style>
     <script type="text/javascript">
         function openPopUp() {
             var popUrl = 'F601_CheckSoHopDong.aspx?sohd=' + document.getElementById('<%= m_txt_so_hop_dong.ClientID %>').value;
             var name = 'KiemTraSoHopDong';
             var appearence = 'dependent=yes,menubar=no,resizable=no,' +
                                          'status=no,toolbar=no,titlebar=no,' +
                                          'left=5,top=280,width=930px,height=640px';
             var openWindow = window.open(popUrl, name, appearence);
             openWindow.focus();
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table  cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Thông tin Dự toán"/>
		</td>
	</tr>
	<tr>
		<td>
		    <asp:validationsummary id="vdsCategory" runat="server" CssClass="cssManField" Font-Bold="true" />
		</td>
	</tr>
    <tr>
		<td>
        <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0"> 
            <tr>
                <td align="right" style="width:8%;">
			       
			<asp:label id="lblTenGiangVien" CssClass="cssManField" runat="server" 
                Text="Đợt thanh toán" />
			       
                         </td>
                <td align="left" colspan="4">
              <asp:DropDownList ID="m_cbo_dot_thanh_toan" Width="96%" runat="server" 
                        AutoPostBack="true" 
                        onselectedindexchanged="m_cbo_dot_thanh_toan_SelectedIndexChanged">
               </asp:DropDownList>
                         </td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:7%;">
			       
			<asp:label id="lblMon4" CssClass="cssManField" runat="server" 
                Text="Số hợp đồng khung" />
			       
                </td>
                <td align="left" style="width:10%;">

                <asp:TextBox ID="m_txt_so_hop_dong" Width="96%" 
                        runat="server"></asp:TextBox>
                        </td>
                     <td align="left" style="width:1%">
			        <asp:button id="m_cmd_check_so_hd" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Kiểm tra" 
                        Height="24px" onclick="m_cmd_check_so_hd_Click" CausesValidation="false"/>
                </td>
                <td align="right" style="width:3%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">
			
			        &nbsp;</td>
                      <td align="left" style="width:1%;">
                          &nbsp;</td>
                 <td align="right" style="width:5%;">
			       
			         &nbsp;</td>
                <td align="left" style="width:10%;">
		            &nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">    
			
                    &nbsp;</td> 
                <td align="left" style="width:1%;">
                          &nbsp;</td>
                <td align="right" style="width:9%;">
			       
			        &nbsp;</td>
                <td align="left" style="width:10%;">    
			        &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblngaythanhtoan" CssClass="cssManField" runat="server" 
                Text="Ngày thanh toán" />
                </td>
                <td align="left" style="width:10%;">    
			
                   
			        <ew:CalendarPopup ID="m_dat_ngay_thanh_toan" runat="server" 
                        ControlDisplay="TextBoxImage" GoToTodayText="Hôm nay:" 
                        ImageUrl="~/Images/cal.gif" Nullable="True" NullableLabelText="" 
                        ShowGoToToday="True" Width="75%" SelectedDate="" Text="" Culture="vi-VN" 
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
                <td align="right" style="width:9%;">
			       
			        &nbsp;</td>
                <td align="left" style="width:10%;">    
			        &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat" CssClass="cssManField" runat="server" 
                Text="Số tiền thanh toán" />
			       
                </td>
                <td align="left" style="width:10%;">    
                <ew:NumericBox ID="m_txt_so_tien_thanh_toan" Width="96%" 
                        runat="server" TextAlign= "Right"></ew:NumericBox>
                        </td> 
                <td align="left" style="width:1%;">			       
                        <asp:RequiredFieldValidator ID="req_vali3" runat="server" 
                         ErrorMessage="Bạn phải nhập số tiền thanh toán" Text="*" 
                        ControlToValidate="m_txt_so_tien_thanh_toan"> </asp:RequiredFieldValidator></td>
                <td align="left" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">    
			        &nbsp;</td> <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat0" CssClass="cssManField" runat="server" 
                Text="Trong đó:" Font-Underline= "true" />
			       
                </td>
                <td align="left" style="width:10%;">    
                    &nbsp;</td> 
                <td align="left" style="width:1%;">			       
                        &nbsp;</td>
                <td align="left" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">    
			        &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat1" CssClass="cssManField" runat="server" 
                Text="Số tiền thực nhận (VNĐ)" />
			       
                </td>
                <td align="left" style="width:10%;">    
                <ew:NumericBox ID="m_txt_so_tien_thuc_nhan" Width="96%" 
                        runat="server" TextAlign= "Right"></ew:NumericBox>
                        </td> 
                <td align="left" style="width:1%;">			       
                        &nbsp;</td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat2" CssClass="cssManField" runat="server" 
                Text="Số tiền thuế(VNĐ)" />
			       
                </td>
                <td align="left" style="width:10%;">    
                <ew:NumericBox ID="m_txt_so_tien_thue" Width="96%" 
                        runat="server" TextAlign= "Right"></ew:NumericBox>
                        </td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat3" CssClass="cssManField" runat="server" 
                Text="Trạng thái thanh toán" />
			       
                </td>
                <td align="left" colspan="3">    
              <asp:DropDownList ID="m_cbo_trang_thai_thanh_toan" Width="96%" runat="server" 
                        AutoPostBack="true" >
               </asp:DropDownList>
                         </td> 
                <td align="left" style="width:10%;">    
                    &nbsp;</td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lblMon5" CssClass="cssManField" runat="server" 
                Text="Mô tả" />
			       
                </td>
                <td align="left" colspan="3">
                <asp:TextBox ID="m_txt_mo_ta" Width="96%" 
                        runat="server"></asp:TextBox>
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
			        <asp:button id="m_cmd_luu_du_lieu" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo dự toán" 
                        Height="24px" onclick="m_cmd_luu_du_lieu_Click"/>
                </td>
			   <td align="left" style="width:1%;"></td>
                 <td align="left" colspan="2">
                     <asp:Button ID="m_cmd_cap_nhat_du_toan" runat="server" accessKey="s" 
                         CssClass="cssButton" Height="24px" 
                         Text="Cập nhật dự toán" Width="98px" 
                         onclick="m_cmd_cap_nhat_du_toan_Click" />
                 </td>
                <td align="left" style="width:1%;"></td>
                <td align="left" style="width:10%;">
                    <asp:Button ID="m_cmd_xoa_trang" runat="server" CausesValidation="False" 
                        CssClass="cssButton" Height="25px"  Text="Xóa trắng" 
                        Width="98px" onclick="m_cmd_xoa_trang_Click" />
                </td>  
                  <td align="left" style="width:10%;">
                      &nbsp;</td>  
            </tr>
        </table>

		</td>
	</tr>
    <tr>
		<td class="cssPageTitleBG" colspan="2">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách dự toán"/>
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
            AllowSorting="True">
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                <asp:TemplateField HeaderText="Xóa">
                    <ItemTemplate> <asp:LinkButton ToolTip="Xóa" ID = "lbt_delete" runat="server"
                     CommandName="Delete" CausesValidation="false" OnClientClick="return confirm ('Bạn có thực sự muốn xóa bản ghi này?')">
                      <img src="/TRMProject/Images/Button/deletered.png" alt="Delete" />
                     </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="3%" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Sửa">
                    <ItemTemplate>
                     <asp:LinkButton CausesValidation="false" CommandName="Select" ToolTip="Sửa" ID = "lbt_edit" runat="server">
                    <img src='/TRMProject/Images/Button/edit.png' alt='Sửa' />
                    </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="3%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NOI_DUNG_THANH_TOAN" HeaderText="Nội dung thanh toán">
                    <ItemStyle Width="50%" HorizontalAlign="Left" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Số lượng - Hệ số / Tần suất" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%#CIPConvert.ToStr(CIPConvert.ToDecimal(Eval("SO_LUONG_HE_SO")), "0.00")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="15%"></ItemStyle>
                    </asp:TemplateField> 
                     <asp:BoundField DataField="DON_VI_TINH" HeaderText="Đơn vị tính">
                     <ItemStyle Width="5%" HorizontalAlign="Center" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Đơn giá (VNĐ)">
                       <ItemTemplate><%#CIPConvert.ToStr(CIPConvert.ToDecimal(Eval("DON_GIA_HD")),"#,###0")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" Width="10%"></ItemStyle>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Tần suất thanh toán">
                       <ItemTemplate><%# "Theo " + Eval("TAN_SUAT")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="10%"></ItemStyle>
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

