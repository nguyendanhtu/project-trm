<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F307_PhuLucHopDong.aspx.cs" Inherits="ChucNang_F307_PhuLucHopDong" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
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
                <td align="right" style="width:7%;">
			<asp:label id="lblSoHopDong" CssClass="cssManField" runat="server" 
                Text="Số hợp đồng" />
                         </td>
                <td align="left" style="width:10%;">
			<asp:textbox id="m_txt_so_hop_dong" CssClass="cssTextBox" Enabled="false"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="right" style="width:7%;">
			       
			<asp:label id="lblgiang_vien" Enabled="false" CssClass="cssManField" runat="server" 
                Text="Giảng viên" />
			       
			    </td>
                <td align="left" style="width:10%;">
			<asp:textbox id="m_txt_ten_giang_vien" CssClass="cssTextBox" Enabled="false"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:7%;">
			       
			<asp:label id="lblTenGiangVien" CssClass="cssManField" runat="server" 
                Text="Nội dung thanh toán" />
			       
                         </td>
                <td align="left" style="width:10%;">
              <asp:DropDownList ID="m_cbo_noi_dung_tt" Width="96%" runat="server">
               </asp:DropDownList>
                         </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lblMon4" CssClass="cssManField" runat="server" 
                Text="Số lượng hệ số" />
			       
			    </td>
                <td align="left" style="width:10%;">	

			<asp:textbox id="m_txt_so_luong_he_so" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />

                         </td>
                <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:7%;">
			<asp:label id="lblGiaTriHopDong" CssClass="cssManField" runat="server" 
                Text="Giá trị hợp đồng" />
                </td>
                <td align="left" style="width:10%;">

			<asp:textbox id="m_txt_thanh_tien" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />

                </td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" style="width:5%;">
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
                runat="server" Width="98px" Text="Lưu phụ lục" 
                        Height="24px" onclick="m_cmd_luu_du_lieu_Click" />
                </td>
			   <td align="left" style="width:1%;"></td>
                 <td align="center" colspan="2">
                 <asp:button id="m_cmd_thoat" CssClass="cssButton" 
                runat="server" Width="98px" Text="Xóa trắng" 
                        Height="25px" CausesValidation="False" onclick="m_cmd_thoat_Click"  />
                 </td>
                <td align="left" style="width:1%;"></td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>  
                  <td align="left" style="width:10%;">
                 </td>  
            </tr>
        </table>

		</td>
	</tr>
	<tr>
    <td>
    </td>
    </tr>
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Phụ lục hợp đồng khung"/>
		</td>
	</tr>	
    <tr>
		<td align="left">
        &nbsp;<asp:button id="cmd_them_moi" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo mới(c)" 
                Height="27px" onclick="cmd_them_moi_Click"/><br />
                <asp:Label ID="m_lbl_thong_bao" CssClass="cssManField" runat="server"></asp:Label>
                <asp:HiddenField ID="hdf_id_gv" runat="server" />
        </td>
        <td >
		    &nbsp;</td>
	</tr>	
	<tr>
		<td align="center" colspan="3" style="height:450px;" valign="top">
		    &nbsp;
   <asp:GridView ID="m_grv_dm_danh_sach_hop_dong_khung" AllowPaging="True" 
                runat="server" AutoGenerateColumns="False" 
                Width="101%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" 
            AllowSorting="True" >
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                <asp:TemplateField>
                    <ItemTemplate> <asp:LinkButton ToolTip="Xóa" ID = "lbt_delete" runat="server"
                     CommandName="Delete" OnClientClick="return confirm ('Bạn có thực sự muốn xóa bản ghi này?')">
                      <img src="/TRMProject/Images/Button/deletered.png" alt="Delete" />
                     </asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                    <ItemTemplate> <asp:HyperLink ToolTip="Sửa" ImageUrl="/TRMProject/Images/Button/edit.png" ID = "lbt_edit" runat="server"
                     NavigateUrl='<%# "/TRMProject/ChucNang/F306_HopDongKhungGiangVien.aspx?mode=edit&id_hd="+Eval("ID") %>'></asp:HyperLink>
                    </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                    <ItemTemplate> <asp:HyperLink ToolTip="Phụ lục hợp đồng" ImageUrl="/TRMProject/Images/Button/detail.png" ID = "lbt_phu_luc_hop_dong" runat="server"
                     NavigateUrl='<%# "/TRMProject/ChucNang/F307_PhuLucHopDong.aspx?id_hd="+Eval("ID") %>'></asp:HyperLink>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NGAY_KY" HeaderText="Ngày ký" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                     <asp:BoundField DataField="NGAY_HIEU_LUC" HeaderText="Ngày hiệu lực" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false">
                    </asp:BoundField>
                    <asp:BoundField DataField="NGAY_KET_THUC_DU_KIEN" HeaderText="Ngày kết thúc " DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false">
                    </asp:BoundField>
                     <asp:BoundField DataField="SO_HOP_DONG" HeaderText="Số hợp đồng" 
                        Visible="true">
                        <ItemStyle HorizontalAlign="Center" Width="4%"></ItemStyle></asp:BoundField>
                     <asp:BoundField DataField="LOAI_HOP_DONG" HeaderText="Loại hợp đồng">
                    </asp:BoundField>
                     <asp:BoundField DataField="DON_VI_QUAN_LY" HeaderText="Đơn vị quản lý">
                    </asp:BoundField>
                    <asp:BoundField DataField="TRANG_THAI_HOP_DONG" HeaderText="Trạng thái hợp đồng">
                    </asp:BoundField>
                     <asp:BoundField DataField="DON_VI_THANH_TOAN" HeaderText="Đơn vị thanh toán">
                    </asp:BoundField>
                    <asp:BoundField DataField="THUE_SUAT" HeaderText="Thuế suất(%)">
                    </asp:BoundField>
                     <asp:BoundField DataField="MA_PO_PHU_TRACH" HeaderText="Mã PO Phụ trách">
                    </asp:BoundField>
                     <asp:BoundField DataField="FIRST_MON" HeaderText="Môn 1" />
                     <asp:BoundField DataField="GIA_TRI_HOP_DONG" HeaderText="Giá trị hợp đồng" />
                     <asp:BoundField DataField="GHI_CHU" HeaderText="Ghi chú" />
                    
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

