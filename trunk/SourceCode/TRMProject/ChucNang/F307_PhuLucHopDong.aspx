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
                <td align="left" style="width:5%;">
			       
			    </td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;"></td>
                 <td align="right" style="width:5%;"></td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
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
                <td align="left" style="width:5%;">
			      <!--<asp:Button ID="m_cmd_chosose_gv" runat="server" Text="+" 
                        CausesValidation="False"  />-->
		            &nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:7%;">
			<asp:label id="lblMon4" CssClass="cssManField" runat="server" 
                Text="Số lượng hệ số" />
                </td>
                <td align="left" style="width:10%;">

			<asp:textbox id="m_txt_so_luong_he_so" CssClass="cssTextBox"  runat="server" 
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
                <td align="right" style="width:7%;">
			<asp:label id="lblGiaTriHopDong" CssClass="cssManField" runat="server" 
                Text="Giá trị hợp đồng" />
		                    </td>
                <td align="left" colspan="1">
			<asp:textbox id="m_txt_thanh_tien" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
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
                runat="server" Width="98px" Text="Lưu hợp đồng" 
                        Height="24px" />
                </td>
			   <td align="left" style="width:1%;"></td>
                 <td align="left" colspan="2">
			        <asp:button id="m_cmd_luu_va_sinh_pl" accessKey="s" CssClass="cssButton" 
                runat="server" Width="129px" Text="Lưu HD & sinh phụ lục"  />
                </td>
                <td align="left" style="width:1%;"></td>
                <td align="left" style="width:10%;">
                 <asp:button id="m_cmd_thoat" CssClass="cssButton" 
                runat="server" Width="98px" Text="Thoát" 
                        Height="25px" CausesValidation="False"  />
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

