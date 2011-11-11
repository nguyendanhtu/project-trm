<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F401_LapDuToanChoDotThanhToan.aspx.cs" Inherits="ChucNang_F401_LapDuToanChoDotThanhToan" %>
<%@ Import Namespace ="IP.Core.IPCommon" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
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
		<td class="cssPageTitleBG" colspan="4">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Bộ lọc Đợt thanh toán"/>
		</td>
	</tr>	
    <tr>
		<td align="right" style="width:10%">
                <asp:label id="Label1" runat="server" Text="Đơn vị thanh toán" CssClass="cssManField" />
        </td>
         <td align="left" colspan="3">  
		    <asp:DropDownList id="m_cbo_dm_loai_don_vi_thanh_toan_search" runat="server" AutoPostBack="true"
                        CssClass="cssDorpdownlist"  Width="73%" 
                 onselectedindexchanged="m_cbo_dm_loai_don_vi_thanh_toan_search_SelectedIndexChanged" />
        </td>

	</tr>
    <tr>
    <td></td>
    </tr>
    <tr>
		<td align="right">
                <asp:label id="Label2" runat="server" Text="Mã đợt thanh toán" CssClass="cssManField" />
        </td>
        <td align="left" style="width:30%">  
		    <asp:TextBox id="m_txt_ma_dot_thanh_toan_search" runat="server" CssClass="cssTextBox" Width="99%"/>
        </td>
        <td align="right"  style="width:12%">
                <asp:label id="Label3" runat="server" Text="Trạng thái đợt thanh toán" CssClass="cssManField" />
        </td>
        <td align="left" style="width:58%">  
			
		    <asp:DropDownList id="m_cbo_trang_thai_dot_thanh_toan_search" runat="server" AutoPostBack="true"
                        CssClass="cssDorpdownlist" Width="50%" 
                onselectedindexchanged="m_cbo_trang_thai_dot_thanh_toan_search_SelectedIndexChanged"/>
        </td>
	</tr>
    <tr>
		<td align="right">
                &nbsp;</td>
        <td align="left" style="width:30%">  
		    &nbsp;</td>
        <td align="right"  style="width:12%">
                &nbsp;</td>
        <td align="left" style="width:58%">  
			
		    &nbsp;</td>
	</tr>
    <tr>
		<td align="right" style="height:20px;">
                &nbsp;</td>
        <td align="left" style="width:30%; height:20px;">  
			<asp:button id="m_cmd_loc_du_lieu" accessKey="l" CssClass="cssButton" 
                runat="server" Width="98px" Text="Lọc dữ liệu(l)" Height="18px" 
                onclick="m_cmd_loc_du_lieu_Click" /></td>
        <td align="right"  style="width:12%">
                &nbsp;</td>
        <td align="left" style="width:58%">  
			
		    &nbsp;</td>
	</tr>
    <tr>
    <td>
    </td>
    </tr>
    <tr>
    <td>
    </td>
    </tr>
    <tr>
		<td class="cssPageTitleBG" colspan="4">
		    <asp:label id="Label4" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách Đợt thanh toán"/>
		</td>
	</tr>	
    <tr>
		<td colspan="4">
		  
                <asp:label id="m_lbl_thong_bao" runat="server" CssClass="cssManField" />
		  
		</td>
	</tr>	
	<tr>
		<td align="center" style="height:450px;" valign="top" colspan="4">
		    &nbsp;
           
              <asp:GridView ID="m_grv_dm_dot_thanh_toan" runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID" 
                CellPadding="4" ForeColor="#333333" 
                AllowPaging="True" AllowSorting="True" PageSize="20" 
                onpageindexchanging="m_grv_dm_dot_thanh_toan_PageIndexChanging">
                  <AlternatingRowStyle BackColor="White" />
                <Columns>
                  <asp:TemplateField HeaderText="Xóa" Visible="false">
                    <ItemTemplate> <asp:LinkButton ID = "lbt_delete" runat="server" Text="Xóa" 
                     CommandName="Delete" CausesValidation="false" OnClientClick="return confirm ('Bạn có thực sự muốn xóa bản ghi này?')"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="3%" />
                    </asp:TemplateField>
                    <asp:CommandField SelectText="Sửa" ShowSelectButton="True" HeaderText="Sửa" 
                        ItemStyle-Width="2%" Visible="false" >
                    <ItemStyle Width="2%"></ItemStyle>
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" >
                       <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MA_DOT_TT" HeaderText="Mã đợt thanh toán" 
                        Visible="true">
                        <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle></asp:BoundField>                    
                    <asp:TemplateField HeaderText="Đơn vị TT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# mapping_don_vi_thanh_toan(CIPConvert.ToDecimal(Eval("ID_DON_VI_THANH_TOAN"))) %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30%"></ItemStyle>
                    </asp:TemplateField>
                      <asp:BoundField DataField="NGAY_TT_DU_KIEN" HeaderText="Ngày kết thúc dự kiên" DataFormatString="{0:dd/MM/yyyy}"
                        ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Trạng thái đợt TT" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# mapping_trang_thai_dot_thanh_toan(CIPConvert.ToDecimal(Eval("ID_TRANG_THAI_DOT_TT"))) %></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="15%"></ItemStyle>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# mapping_action_with_trang_thai_dot_tt(CIPConvert.ToDecimal(Eval("ID_TRANG_THAI_DOT_TT")), CIPConvert.ToStr(Eval("MA_DOT_TT")))%>
                       </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Hỗ trơ" ItemStyle-HorizontalAlign="Center">
                       <ItemTemplate><%# mapping_ho_tro_with_trang_thai_dot_tt(CIPConvert.ToDecimal(Eval("ID_TRANG_THAI_DOT_TT")), CIPConvert.ToStr(Eval("MA_DOT_TT")))%>
                       </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                    </asp:TemplateField>
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

