<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F605_CheckMaLopMon.aspx.cs" Inherits="ChucNang_F605_CheckMaLopMon" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
         <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="m_lbl_loc_du_lieu" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách Hợp đồng khung"/>
		</td>
	</tr>
    <tr>
        <td align="right" style="width:15%">
		  <asp:label id="m_lbl_tu_khoa" runat="server" CssClass="cssManField" Text="Số hợp đồng tìm kiếm" />
		</td>
        <td align="left" style="width:15%">  
		    &nbsp;<asp:Label  id="m_lbl_so_hd" runat="server"></asp:Label> </td>
            <td align="left">  
		  <asp:label id="m_lbl_tu_khoa1" runat="server" CssClass="cssManField" 
                    Text="Mã lớp môn: " />
		        &nbsp;<asp:Label  id="m_lbl_ma_lop_mon" runat="server"></asp:Label> 
		</td>
    </tr>	
    <tr>
		<td colspan="3">
		  
                &nbsp;</td>
	</tr>	
    <tr>
		<td colspan="3">
		  
                          <asp:Label ID="m_lbl_thong_bao" CssClass="cssManField" runat="server"></asp:Label>
                </td>
	</tr>	
	<tr>
		<td align="center" style="height:450px;" valign="top" colspan="3">
		    &nbsp;
            <asp:GridView ID="m_grv_dm_danh_sach_hop_dong_khung" AllowPaging="True" 
                runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" 
            AllowSorting="True" >
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><asp:Label ID="m_lbl_stt" runat="server" Text="<%# Container.DataItemIndex + 1 %>"></asp:Label></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SO_PHIEU_THANH_TOAN" HeaderText="Mã đợt thanh toán"/>
                     <asp:TemplateField HeaderText="Số hợp đồng">
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_so_hop_dong" runat="server" Text='<%# Eval("SO_HOP_DONG").ToString() %>' ></asp:Label>
                    </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="REFERENCE_CODE" HeaderText="Mã lớp môn" />
                    <asp:TemplateField HeaderText="Tên giảng viên">
                    <ItemTemplate>
                    <label><a href='<%# "/TRMProject/ChucNang/F201_CapNhatThongTinGiangVien.aspx?mode=edit&id="+Eval("ID_GIANG_VIEN") %>'>
                    <%# Eval("GIANG_VIEN").ToString() %></a></label>
                    </ItemTemplate>
                    <ItemStyle Width="10%"/>
                    </asp:TemplateField>
                     <asp:TemplateField Visible="False">
                    <HeaderTemplate>Giá trị hợp đồng</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_gia_tri_hd" runat="server" 
                            Text='<%# Eval("GIA_TRI_HOP_DONG").ToString()%>' ></asp:Label>
                    </ItemTemplate>
                     <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:TemplateField>                    
                    <asp:BoundField DataField="GIA_TRI_HOP_DONG" HeaderText="Giá trị hợp đồng" 
                        DataFormatString="{0:N0}" HtmlEncode="false" >
                      <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                      <asp:TemplateField Visible="false">
                    <HeaderTemplate>Thuế suất(%)</HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label ID="m_lbl_thue_suat" runat="server" 
                            Text='<%# Eval("THUE_SUAT").ToString() +"%"%>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                      <asp:BoundField DataField="THUE_SUAT" HeaderText="Thuế suất(%)" 
                        DataFormatString="{0:N1}%" HtmlEncode="false">
                    </asp:BoundField>
                </Columns>
                  <EditRowStyle BackColor="#7C6F57" />
                  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#810c15" Font-Bold="True" ForeColor="White" />
                  <PagerSettings Position="TopAndBottom" />
                  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle CssClass="cssSelectedRow" BackColor="#C5BBAF" Font-Bold="True" 
                      ForeColor="#333333"></SelectedRowStyle>
            </asp:GridView>           
            </td>
	</tr>
 </table>
</asp:Content>

