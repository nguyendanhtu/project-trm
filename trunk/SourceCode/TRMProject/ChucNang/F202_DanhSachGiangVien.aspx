<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F202_DanhSachGiangVien.aspx.cs" Inherits="ChuNang_F202_DanhSachGiangVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:MultiView ID="mtv_giang_vien" runat="server">

  <asp:View ID="m_view_form_cap_nhat_giang_vien" runat="server">
  <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
	<tr>
		<td class="cssPageTitleBG" colspan="3">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Danh sách giảng viên"/>
		</td>
	</tr>
	<tr>
		<td colspan="3">
		    <asp:validationsummary id="vdsCategory" runat="server" CssClass="cssManField" Font-Bold="true" />
		   <asp:label id="m_lbl_mess" runat="server" CssClass="cssManField" />
		</td>
	</tr>
	    <tr>
		<td align="right" style="width:15%;">
			&nbsp;</td>
		<td style="width:30%;">
		    &nbsp;</td>
		<td style="width:5%;">  
			&nbsp;</td>
		</tr>
	<tr>
		<td align="right" style="width:15%;">
			<asp:label id="lbl_content" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã giảng viên" />
		</td>
		<td style="width:30%;">
			<asp:textbox id="m_txt_ten_noi_dung" CssClass="cssTextBox" CausesValidation="false"  runat="server" 
                MaxLength="64" Width="495px" />
                &nbsp;
                <asp:customvalidator id="m_ct_noi_dung" runat="server" 
                ControlToValidate="m_txt_ten_noi_dung" ErrorMessage="Bạn phải nhập tên nội dung" 
                Display="Static" Text="*" />
		</td>
		<td style="width:5%;"> 
			&nbsp;</td>
	</tr>
	    <tr>
		<td align="right" >
			<asp:label id="lbl_loai_hop_dong" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;L&lt;/U&gt;oại hợp đồng" AccessKey="L" />
		    </td>
		<td align="left">
		    <asp:DropDownList ID="m_ddl_loai_hop_dong" runat="server" Width="323px">
            </asp:DropDownList>
            </td>
		<td >
			&nbsp;</td>
		</tr>
	<tr>
		<td align="right" >
			<asp:label id="lbl_ma_don_vi_tinh" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã đơn vị tính" />
		</td>
		<td align="left">
		    <asp:DropDownList ID="m_ddl_ma_don_vi_tinh" runat="server" Width="323px">
            </asp:DropDownList>
        </td>
		<td >
			&nbsp;</td>
	</tr>
    <tr>
        <td align="right">
			<asp:label id="lblFullName2" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;Đ&lt;/U&gt;ơn giá" />
		</td>
        <td align="left">
			<asp:textbox id="m_txt_don_gia" CssClass="cssTextBox"  runat="server" 
                MaxLength="64" Width="322px" />
                <asp:customvalidator id="m_ct_don_gia" runat="server" 
                ControlToValidate="m_txt_don_gia" ErrorMessage="Bạn phải nhập đơn giá" 
                Display="Static" Text="*" />
            <asp:RegularExpressionValidator ID="Regex_don_gia" runat="server" Text="" ErrorMessage="Đơn giá phải là số"
             ControlToValidate="m_txt_don_gia" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
		</td>
        <td>&nbsp;</td>
    </tr>
	    <tr>
		<td align="right">
			<asp:label id="lbl_ma_tan_xuat" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;M&lt;/U&gt;ã tần suất" />
		    </td>
		<td valign="top" colspan="2">
		    <asp:DropDownList ID="m_ddl_ma_tan_xuat" runat="server" Width="323px" 
                AccessKey="M">
            </asp:DropDownList>
            </td>
	    </tr>
	<tr>
		<td align="right" class="style1">
			<asp:label id="lbl_hoc_lieu" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;C&lt;/U&gt;ó làm học liệu" />
		</td>
		<td valign="top" colspan="2" class="style1">
		    <asp:RadioButton ID="m_rd_yes_hoc_lieu" runat="server" Text="Có" 
                GroupName="rdb_lam_hoc_lieu" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="m_rd_no_hoc_lieu" runat="server" Checked="True" 
                Text="Không" GroupName="rdb_lam_hoc_lieu" />
        </td>
	</tr>	
	<tr>
		<td align="right">
			<asp:label id="lbl_hoc_lieu0" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;C&lt;/U&gt;ó vận hành" />
		</td>
		<td valign="top" colspan="2">
		    <asp:RadioButton ID="m_rd_yes_van_hanh" runat="server" Checked="True" 
                Text="Có" GroupName="rdb_lam_van_hanh" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="m_rd_no_van_hanh" runat="server" Text="Không" 
                GroupName="rdb_lam_van_hanh" />
        </td>
	</tr>	
	<tr>
		<td align="right">
			<asp:label id="lbl_ghi_chu" CssClass="cssManField" runat="server" 
                Text="&lt;U&gt;G&lt;/U&gt;hi chú" />  
		    &nbsp;</td>
		<td valign="top" colspan="2">
		    <asp:TextBox ID="m_txt_ghi_chu" runat="server" TextMode = "MultiLine" 
                Width="495px" Height="83px"></asp:TextBox>
        </td>
	</tr>	
    <tr>
		<td align="right">
			&nbsp;</td>
		<td valign="top" colspan="2">
		    &nbsp;</td>
	</tr>	
	<tr>
	    <td></td>
		<td colspan="2" align="left">
			<asp:button id="m_cmd_tao_moi" accessKey="c" CssClass="cssButton" 
                runat="server" Width="98px" Text="Tạo mới(c)" 
               />&nbsp;
			<asp:button id="m_cmd_cap_nhat" accessKey="u" CssClass="cssButton" 
                runat="server" Width="98px" Text="Cập nhật(u)" 
                 />&nbsp;
			<asp:button id="btnCancel" accessKey="r" CssClass="cssButton" runat="server" 
                Width="98px" Text="Xóa trắng(r)"  />
                <asp:HiddenField ID="hdf_id" runat = "server" Value="" />
		</td>
	</tr>
 </table>
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
                CellPadding="4" ForeColor="#333333" GridLines="Both" AllowSorting="True" 
               >
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
                    <label><%# Eval("HO_VA_TEN_DEM").ToString() + Eval("TEN_GIANG_VIEN").ToString() %></label>
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
                     <ItemStyle HorizontalAlign="Center"></ItemStyle>
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
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderTemplate>GV duyệt học liệu</HeaderTemplate>
                    <ItemTemplate>
                    <label><%# mapping_duyet_hl(Eval("GV_DUYET_HL_YN").ToString())%></label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
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

