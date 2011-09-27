﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F202_DanhSachGiangVien.aspx.cs" Inherits="ChuNang_F202_DanhSachGiangVien" %>
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
                    <label><a href='<%# "/TRMProject/ChucNang/F201_CapNhatThongTinGiangVien.aspx?mode=edit&id="+Eval("ID") %>'>
                    <%# Eval("TEN_GIANG_VIEN").ToString() %></a></label>
                    </ItemTemplate>
                    <ItemStyle Width="200px"/>
                    </asp:TemplateField>
                       <asp:BoundField DataField="NGAY_SINH" HeaderText="Ngày sinh" DataFormatString="{0:dd/MM/yyyy}">
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
                       <asp:BoundField DataField="NGAY_CAP" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày Cấp">
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
                     NavigateUrl='<%# "/TRMProject/ChucNang/F201_CapNhatThongTinGiangVien.aspx?mode=edit&id="+Eval("ID") %>'></asp:HyperLink>
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

</asp:Content>
