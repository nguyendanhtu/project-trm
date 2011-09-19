<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F202_DanhSachGiangVien.aspx.cs" Inherits="ChuNang_F202_DanhSachGiangVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:MultiView ID="mtv_giang_vien" runat="server">

  <asp:View ID="m_view_form_cap_nhat_giang_vien" runat="server">
      Chỗ này là form cập nhật
  </asp:View>

  <asp:View ID="m_view_danh_sach" runat="server">
 <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
    <tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="Label11" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách giảng viên"/>
		</td>
	</tr>	
    <tr>
		<td align="left">
        &nbsp;<asp:button id="cmd_them_moi" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo mới(c)" 
                onclick="cmd_them_moi_Click"/>
        </td>
        <td >
		    &nbsp;</td>
	</tr>	
	<tr>
		<td align="center" colspan="3" style="height:450px;" valign="top">
		    &nbsp;
           
   <asp:GridView ID="m_grv_dm_danh_sach_giang_vien" AllowPaging="true" 
                runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" GridLines="Both" AllowSorting="True" >
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
                    <HeaderTemplate>Tên giảng viên</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# Eval("TEN_GIANG_VIEN").ToString() %></label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NGAY_SINH" HeaderText="Ngày sinh" />
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
                     <asp:BoundField DataField="TEL_HOME" HeaderText="Điện thoại">
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
                     <asp:BoundField DataField="SO_CMND" HeaderText="Số chứng minh" />
                     <asp:BoundField DataField="NGAY_CAP" HeaderText="Ngày cấp" />
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
           
            </td>
	</tr>	

</table>
  </asp:View>

</asp:MultiView>

</asp:Content>

