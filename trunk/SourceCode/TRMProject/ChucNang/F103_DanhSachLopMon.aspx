<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F103_DanhSachLopMon.aspx.cs" Inherits="ChuNang_F103_DanhSachLopMon" %>
<%@ Import Namespace="WebDS.CDBNames" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách lớp môn"/>
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
			<asp:label id="lblFullName" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;T&lt;/U&gt;ên môn học" />
		        </td>
                <td align="left" style="width:15%;">
		    <asp:DropDownList id="m_cbo_dm_mon_hoc" runat="server" Width="96%" 
                        CssClass="cssDorpdownlist"  />
		        </td>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">
                    &nbsp;</td>
            </tr>
                        <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblFullName4" CssClass="cssManField" runat="server" 
                Text="Là lớp" />
		                    </td>
                <td align="left" style="width:15%;">
			        <asp:RadioButtonList ID="m_rbt_loai_lop" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="ONLINES_YN">Online</asp:ListItem>
                        <asp:ListItem Value="OFFLINE_YN">Offline</asp:ListItem>
                        <asp:ListItem Value="BAI_TAP_GKY_YN">Bài tập giữa kỳ</asp:ListItem>
                        <asp:ListItem Selected="True" Value="TAT_CA">Tất cả</asp:ListItem>
                    </asp:RadioButtonList>
		                    </td>
                <td align="right" style="width:5%;">
			        &nbsp;</td>
                <td align="left" style="width:15%;">
                    &nbsp;</td>
            </tr>
                        <tr>
                <td align="right" style="width:5%;">
			<asp:label id="lblFullName0" CssClass="cssManField" runat="server" 
                Text="Từ &lt;U&gt;k&lt;/U&gt;hóa tìm kiếm" />
		                    </td>
                <td align="left" style="width:15%;">
			<asp:textbox id="m_txt_tu_khoa_tim_kiem" CssClass="cssTextBox"  runat="server" 
                MaxLength="1000" Width="96%" />
		                    </td>
                <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
                                    <tr>
                <td align="right" style="width:5%;">
		
		                                </td>
                                        <td  style="width:20%;" colspan=3>	<asp:label id="lblFullName1" CssClass="cssLabel" runat="server" 
                
                        Text="(Từ khóa tìm kiếm: Mã lớp môn hoặc PO phụ trách hoặc chương trình phụ trách)" /></td>
            </tr>
                        <tr>
                <td align="right" style="width:5%;"></td>
                <td align="left" style="width:15%;">
			<asp:button id="m_cmd_loc_du_lieu" accessKey="l" CssClass="cssButton" 
                runat="server" Width="98px" Text="Lọc dữ liệu(l)" 
                        onclick="m_cmd_loc_du_lieu_Click" Height="23px" /></td>
                <td align="left" style="width:10%;">
			<asp:button id="m_cmd_xuat_excel" accessKey="x" CssClass="cssButton" 
                runat="server" Width="98px" Text="Xuất Excel (x)" Height="22px"  /></td>
                <td align="left" style="width:15%;">
			        &nbsp;</td>
            </tr>
        </table>
		</td>
	</tr>
	<tr>
	    <td>
			<asp:button id="m_cmd_tao_moi0" accessKey="m" CssClass="cssButton" 
                runat="server" Width="98px" Text="Thêm lớp môn" Height="24px" 
                onclick="m_cmd_tao_moi" />
		                    </td>
	</tr>
    <tr>
		<td class="cssPageTitleBG">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Kết quả lọc dữ liệu"/>
		</td>
	</tr>	
    <tr>
		<td align="right">
		    <asp:GridView ID="m_grv" runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID" 
                CellPadding="4" ForeColor="#333333" CssClass="cssGrid" 
                onrowdatabound="m_grv_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center"><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MA_LOP_MON" ItemStyle-HorizontalAlign="Center" 
                        HeaderText="Mã lớp môn" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Môn học">
                        <ItemTemplate>
                            <asp:Label ID="m_lbl_mon_hoc" runat="server" 
                                Text="<%#get_mapping_ten_mon_hoc((decimal)Eval(GD_LOP_MON.ID_MON_HOC))%>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NGAY_BAT_DAU" HeaderText="Ngày bắt đầu" 
                        DataFormatString="{0:d}">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="NGAY_KET_THUC" ItemStyle-HorizontalAlign="Center" 
                        HeaderText="Ngày kết thúc" DataFormatString="{0:d}" >
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="NGAY_THI" HeaderText="Ngày thi" 
                        DataFormatString="{0:d}" />
                    <asp:BoundField DataField="PO_PHU_TRACH" HeaderText="PO phụ trách" />
                    <asp:BoundField DataField="CHUONG_TRINH_PHU_TRACH" HeaderText="CT phụ trách" />
                    <asp:TemplateField HeaderText="Là lớp Online?">
                        <ItemTemplate>
                            <asp:Label ID="m_lbl_lop_online_yn" runat="server" 
                             Text="<%#get_mapping_yn((string)Eval(GD_LOP_MON.ONLINES_YN))%>"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Là lớp Offline?">
                        <ItemTemplate>
                            <asp:Label ID="m_lbl_lop_offline_yn" runat="server"
                            Text="<%#get_mapping_yn((string)Eval(GD_LOP_MON.OFFLINE_YN))%>"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bài tập giữ kỳ kỳ?">
                        <ItemTemplate>
                            <asp:Label ID="m_lbl_bt_giua_ky_yn" runat="server"
                            Text="<%#get_mapping_yn((string)Eval(GD_LOP_MON.BAI_TAP_GKY_YN))%>"></asp:Label>
                        </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SO_LUONG_HV" HeaderText="SL học viên">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SO_LUONG_ONLINES" HeaderText="SLHV Online">
                                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SO_LUONG_OFFLINE" HeaderText="SLHV Offline">
                                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField DeleteText="" ShowDeleteButton="True" 
                        ItemStyle-HorizontalAlign="Center" ButtonType="Image" 
                        DeleteImageUrl="~/Images/Button/deletered.png" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CommandField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="m_lnk_sua" runat="server" Target="_blank"
                                
                                NavigateUrl='<%# "~/ChucNang/F102_CapNhatThongTinLopMon.aspx?mode=update&id_lop_mon="+Eval(GD_LOP_MON.ID) %>' 
                                ImageUrl="~/Images/Button/edit.png">Sửa</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="m_lnk_lop_mon_detail" runat="server" Target="_blank" 
                                ToolTip="Chi tiết lớp môn"  
                                NavigateUrl='<%# "~/ChucNang/F104_ChiTietLopMon.aspx?id_lop_mon="+Eval(GD_LOP_MON.ID) %>' 
                                ImageUrl="~/Images/Button/detail.png">Chi tiết</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#810c15" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle CssClass="cssSelectedRow" BackColor="#C5BBAF" 
                    Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
            </asp:GridView>
        </td>
	</tr>	
	<tr>
		<td align="center" style="height:450px;" valign="top">
		    &nbsp;</td>
	</tr>	

</table>
</asp:Content>
