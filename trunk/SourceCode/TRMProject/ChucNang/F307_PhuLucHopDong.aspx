<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="F307_PhuLucHopDong.aspx.cs" Inherits="ChucNang_F307_PhuLucHopDong" %>
<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>
<%@ Import Namespace="IP.Core.IPCommon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

#ConversationBody {
	Z-INDEX: 0; POSITION: absolute; PADDING-BOTTOM: 0.75em; OVERFLOW-X: auto; OVERFLOW-Y: auto; WIDTH: 100%; WORD-WRAP: break-word; HEIGHT: 100%; TOP: 0px; LEFT: 0px
}
#RecentHistory {
	DISPLAY: none
}
.conversationItem {
	MARGIN: 0px 0px 1px 12px; PADDING-RIGHT: 6px
}
.conversationItem {
	MARGIN: 0px 0px 1px 13px; PADDING-RIGHT: 6px
}
.iln {
	POSITION: relative; MARGIN: 4px 0px; WORD-WRAP: break-word
}
.status {
	BORDER-BOTTOM: #e0e0e0 1px solid; BACKGROUND-COLOR: #f7f7f7; MARGIN: 0px; WIDTH: 100%; BORDER-COLLAPSE: collapse
}
.shortcut {
	COLOR: #333333; FONT-SIZE: 7pt
}
.event {
	BORDER-BOTTOM: #c1cdd7 1px solid; BACKGROUND-COLOR: #f0f6fb; MARGIN: 0px; WIDTH: 100%; BORDER-COLLAPSE: collapse
}
.iln .icon {
	MARGIN: 2px 1px
}
.event H3 {
	COLOR: #5b7b96
}
.iln H3 {
	LINE-HEIGHT: 1.3em; FONT-FAMILY: Tahoma; MARGIN-BOTTOM: 2px; FONT-SIZE: 8pt
}
        .style1
        {
            line-height: 1.3em;
            font-family: Tahoma;
            font-size: 8pt;
            padding-left: 6px;
            padding-right: 0px;
            padding-top: 4px;
            padding-bottom: 5px;
        }
        .style2
        {
            color: #0066cc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0">
    <tr>
		<td class="cssPageTitleBG">
		    <asp:label id="m_lbl_thong_tin_hd" runat="server" CssClass="cssPageTitle" 
                Text="Thông tin hợp đồng"/>
		</td>
	</tr>
    <tr>
		<td>
        <table cellspacing="0" cellpadding="2" style="width:100%;" class="cssTable" border="0"> 
            <tr>
                <td align="right" style="width:7%;">
			<asp:label id="Label1" CssClass="cssManField" runat="server" 
                Text="Số hợp đồng khung: " /></td>
                <td align="left" style="width:10%;"> &nbsp;
			<asp:Label id="m_lbl_so_hop_dong"  runat="server" 
                MaxLength="64" Width="96%" />
                         </td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="right" style="width:7%;">
			       
			<asp:label id="Label5" CssClass="cssManField" runat="server" 
                Text="Ngày ký: " />
			       
			    </td>
                <td align="left" style="width:10%;"> &nbsp;
			        <asp:label id="m_lbl_dat_ngay_ky" runat="server" /></td>
                <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
                <td align="left" style="width:1%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:7%;">
			       
			<asp:label id="Label4" CssClass="cssManField" runat="server" 
                Text="Đơn vị quản lý: " />
			       
                         </td>
                <td align="left" style="width:10%;">
                    &nbsp;<asp:Label ID="m_lbl_dv_qly" runat = "server"></asp:Label></td>
                         <td align="left" style="width:1%;"> 
                             &nbsp;</td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="m_lbl_dv_thanh_toan" CssClass="cssManField" runat="server" 
                Text="Đơn vị thanh toán: " />
			       
			    </td>
                <td align="left" colspan="3">	
                    &nbsp;<asp:label id="m_lbl_don_vi_thanh_toan" runat="server" /></td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:7%;">
			       
			<asp:label id="Label2" Enabled="false" CssClass="cssManField" runat="server" 
                Text="Giảng viên: " />
			       
                </td>
                <td align="left" style="width:10%;">
                 &nbsp;
			<asp:Label id="m_lbl_ten_giang_vien" runat="server" />
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
            </table>

		</td>
	</tr>
	<tr>
		<td class="cssPageTitleBG">
		    <asp:label id="lblUser" runat="server" CssClass="cssPageTitle" 
                Text="Thông tin phụ lục hợp đồng"/>
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
                <td align="right" style="width:8%;">
			       
			<asp:label id="lblTenGiangVien" CssClass="cssManField" runat="server" 
                Text="Nội dung thanh toán" />
			       
                         </td>
                <td align="left" colspan="6">
              <asp:DropDownList ID="m_cbo_noi_dung_tt" Width="96%" runat="server" 
                        AutoPostBack="true" 
                        onselectedindexchanged="m_cbo_noi_dung_tt_SelectedIndexChanged">
               </asp:DropDownList>
                         </td>
                <td align="left" style="width:10%;"></td>
                <td align="left" style="width:1%;"></td>
            </tr>
            <tr>
                <td align="right" style="width:7%;">
			        &nbsp;</td>
                <td align="left" style="width:10%;">

                    &nbsp;</td>
                     <td align="left" style="width:1%;">
                         &nbsp;</td>
                <td align="right" style="width:7%;">
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
			       
			<asp:label id="lblMon4" CssClass="cssManField" runat="server" 
                Text="Số lượng hệ số" />
			       
                </td>
                <td align="left" style="width:10%;">

                 <ew:NumericBox ID="m_txt_so_luong_he_so" DecimalSign="." Width="96%" runat="server" TextAlign="Right">
                </ew:NumericBox>
                </td>
                     <td align="left" style="width:1%;">
                         <asp:RequiredFieldValidator ID="req_vali2" runat="server" 
                         ErrorMessage="Bạn phải nhập số lượng hệ số" Text="*" ControlToValidate="m_txt_so_luong_he_so"></asp:RequiredFieldValidator></td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbldon_vi_tinh" CssClass="cssManField" runat="server" 
                Text="Đơn vị tính" />
			       
                </td>
                <td align="left" style="width:10%;">
			
                    &nbsp;<asp:label id="m_lbl_don_vi_tinh" runat="server" /></td>
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
			<asp:label id="lblGiaTriHopDong" CssClass="cssManField" runat="server" 
                Text="Đơn giá hợp đồng (VNĐ)" />
                </td>
                <td align="left" style="width:10%;">    
			
                <ew:NumericBox ID="m_txt_don_gia_hd" Width="96%" DecimalSign="." runat="server" TextAlign="Right">
                </ew:NumericBox>
                </td> 
                <td align="left" style="width:1%;">
                          <asp:RequiredFieldValidator ID="req_validator" runat="server" 
                         ErrorMessage="Bạn phải nhập đơn giá" Text="*" ControlToValidate="m_txt_don_gia_hd"></asp:RequiredFieldValidator></td>
                <td align="right" style="width:5%;">
			       
			<asp:label id="lbltan_suat" CssClass="cssManField" runat="server" 
                Text="Tần suất thanh toán" />
			       
                </td>
                <td align="left" style="width:10%;">    
			        &nbsp;<asp:label id="m_lbl_tan_suat" runat="server" /></td> <td align="left" style="width:1%;">&nbsp;</td>
                 <td align="right" style="width:5%;">&nbsp;</td>
                <td align="left" style="width:10%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" style="width:5%;">&nbsp;</td>
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
                runat="server" Width="98px" Text="Tạo phụ lục" 
                        Height="24px" onclick="m_cmd_luu_du_lieu_Click" />
                </td>
			   <td align="left" style="width:1%;"></td>
                 <td align="left" colspan="2">
                     <asp:Button ID="m_cmd_cap_nhat_pl" runat="server" accessKey="s" 
                         CssClass="cssButton" Height="24px" 
                         Text="Cập nhật phụ lục" Width="98px" onclick="m_cmd_cap_nhat_pl_Click" />
                 </td>
                <td align="left" style="width:1%;"></td>
                <td align="left" style="width:10%;">
                    <asp:Button ID="m_cmd_thoat0" runat="server" CausesValidation="False" 
                        CssClass="cssButton" Height="25px" onclick="m_cmd_thoat_Click" Text="Xóa trắng" 
                        Width="98px" />
                </td>  
                  <td align="left" style="width:10%;">
                      &nbsp;</td>  
            </tr>
        </table>

		</td>
	</tr>
	<tr>
    <td>
        <div id="ConversationBody" class=" ">
            <div id="RecentHistory" style="DISPLAY: block">
                <div id="ms__id30" class="conversationItem  userSent YID_Hong Linh" 
                    senderid="Hong Linh">
                </div>
            </div>
            <div id="ms__id1" class="iln">
                <table id="show_hide_recent" border="0" cellpadding="0" cellspacing="0" 
                    class="status" style="DISPLAY: block">
                    <tr>
                        <td class="style1">
                            <div id="show_hide_descr">
                                <a class="style2" href="file:///c://#" 
                                    onclick="PostMessage(273,46388,0); return false">Hide Recent Messages</a>
                                <span class="shortcut">(F3)</span></div>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="ms__id2" class="iln">
                <table id="noprompt" border="0" cellpadding="0" cellspacing="0" class="event">
                    <tr>
                        <td class="style1" valign="top" width="1%">
                            <img class="icon" 
                                src="file:///C:/Program%20Files/Yahoo!/Messenger/Skins/Default/images/offline.png" /></td>
                        <td class="style1">
                            <h3>
                                You currently appear offline to Thầy Tú.</h3>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <iframe id="I1" name="I1" style="DISPLAY: none"></iframe>
<SCRIPT type=text/javascript defer>
IMVironment=IMV=null;InputSelection=Path=Redirect="";IsBuddy=false;Filters=true;YMSGR={IMV_Version:1,IE_Version:6};try{YMSGR.IE_Version=parseFloat(navigator.appVersion.substr(navigator.appVersion.indexOf("MSIE")+4))}catch(exception){}NAMES={sender:{id:"",display:""},receiver:{id:"",display:""}};RPC={$fn:[],$reg:function(C,B){var A=this.$fn.length;this.$fn[A]=function(E){var D=Unmarshal(E);IMV[C](D)};this[C]=function(D){YAHOO.Msgr.Host.sendIMVMessage(A,B,Marshal(D))}},$clear:function(){for(var A in this){if(A.charAt(0)!="$"){delete this[A]}}this.$fn=[]}};if(typeof YAHOO=="undefined"){YAHOO={}}YAHOO.namespace=function(){var A=arguments,E=null,C,B,D;for(C=0;C<A.length;C=C+1){D=A[C].split(".");E=YAHOO;for(B=(D[0]=="YAHOO")?1:0;B<D.length;B=B+1){E[D[B]]=E[D[B]]||{};E=E[D[B]]}}return E};YAHOO.namespace("YAHOO.Msgr");YAHOO.Msgr.hasClass=function(C,A){C=$(C);if(!C||typeof C.className=="undefined"||!A){return false}var B=new RegExp("(?:^|\\s+)"+A+"(?:\\s+|$)");return B.test(C.className)};YAHOO.Msgr.addClass=function(C,A,B){C=$(C);if(!C||typeof C.className=="undefined"||!A){return }if(this.hasClass(C,A)){return }if(B){C.className=A+" "+C.className}else{C.className+=" "+A}};YAHOO.Msgr.removeClass=function(B,A){B=$(B);if(!B||typeof B.className=="undefined"||!A){return }B.className=B.className.replace(new RegExp("(?:^|\\s+)"+A+"(?:\\s+|$)","g")," ")};YAHOO.Msgr.bindGlobalToMethod=function(C,B,A){window[B]=function(){return C[A].apply(C,arguments)}};YAHOO.Msgr.supplant=function(E,D){var B=/{([^{}]*)}/g;if(typeof E!=="string"){return""}else{if(arguments.length==2){D=D||{};return E.replace(B,function(F,H){var G=D[H],I=typeof G;if(I=="function"){return G.call(D,H)}else{if(I!="undefined"){return G}else{return F}}})}else{var C=Array.prototype.slice.call(arguments,1);var A=C.length;return E.replace(B,function(F,J){var I,K;for(var H=0;H<A;H++){var G=C[H]||{};I=G[J];K=typeof I;if(K=="function"){return I.call(G,J,H,C)}else{if(K!="undefined"){return I}}}return F})}}};String.prototype.parseJSON=function(){try{return !(/[^,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]/.test(this.replace(/"(\\.|[^"\\])*"/g,"")))&&eval("("+this+")")}catch(e){return false}};YAHOO.Msgr.SkinColors={background:"#f9f9f2",buttonText:"#333333",highlight:"#ffffff",selected:"#eff0e6",selectedText:"#000000",shadow:"#b3b6b0"};YAHOO.Msgr.Host={clientAPI:window.external||YAHOO.Msgr.Host,invokeCommand:function(B,A){return this.clientAPI.InvokeCommand(B,A)},startPhotoSharing:function(A){return this.clientAPI.PhotoSharing(A)},startPlugin:function(A){return this.clientAPI.startPlugin(A.id,A.version||"",A.intl||YAHOO.Msgr.Conversation.getInfo("intl"),A.name||"",A.userCount||2,A.messageData||"")},getPref:function(A){return this.clientAPI.PrefsGet(A)},setPref:function(B,A){return this.clientAPI.PrefsSet(B,A)},getPrefForContact:function(A){return this.clientAPI.PrefsBuddyGet(A)},setPrefForContact:function(B,A){return this.clientAPI.PrefsBuddySet(B,A)},openURL:function(A,B){return this.clientAPI.openURL(A,B)},sendIMVMessage:function(B,C,A){return this.clientAPI.SendIMVMsg(B,C,A)},postMessage:function(A,C,B){return this.clientAPI.PostMessage(A,C,B)},setHelpMenu:function(B,A){return this.clientAPI.SetHelpMenu(B,A)},onRightClick:function(A){return this.clientAPI.RightClickEvent(A)},moveFocus:function(A){return this.clientAPI.MoveFocus(A)}};YAHOO.Msgr.Conversation={k:{GlobalFunctions:{$Append:"onAppend",$AppendRecent:"onAppendRecent",$FTPlayFiles:"onPlayableFTFinished",$SetContext:"onSetContext",$PluginOpened:"onPluginOpened",$PluginClosed:"onPluginClosed",$Copy:"copySelection",$LoadIMScannersManager:"loadIMPManager",$SetSkinColors:"setSkinColors",$BackgroundImage:"setBackgroundImage",$SetRegionLimiting:"setRegionLimiting",$EatMessages:"hideMessagesFromID",$VomitMessages:"showMessagesFromID",$HandleViewRecent:"showRecentMessages",$ViewTimestamps:"showTimestamps",$HandleNames:"onNamesChanged",$HandleIsBuddy:"onIsBuddyChanged",$HandleActivate:"onWindowActivated",$HandleStatus:"onHandleStatus",$HandleAudible:"onAudible",$OverlayNotify:"onIMVOverlayUpdated",$HandleInputSelection:"onInputSelection",$HandleAction:"onAction",$HandleP2PState:"onP2PStateChanged",$UpdateProgressBar:"onFTProgressBarUpdated",$UpdateProgressBarDescription:"onFTFilenameChanged",$UpdateShowHideDescr:"onRecentMessagesPromptChanged",$ShowAdditionalFiles:"toggleFTFileList",$SetScrolling:"setAutoScrollEnabled",$ShowScrollbar:"showScrollbar",$SetBase:"setPath",$SetInfo:"setInfo",$RemoveElements:"removeILN",urlUp:"anchorOnMouseUp",urlClick:"anchorOnClick",selectElement:"selectElement",Clear:"clearAll",SetConversationLayer:"setContainer",ResetConversationLayer:"resetContainer",ShowConversationLayer:"showContainer",Scroll:"autoScroll",AddStyle:"addStyle",GetStyle:"getStyle",InsertInline:"appendHTML",Insert:"appendHTML",RestoreStyles:"restoreDefaultStyles"},MaxMessages:500,MaxMessagesRemove:10,MaxAudibles:8,TimestampPattern:/ \([^)]+\):( |\r\n )/g,MessageType:{TT_SENT:0,TT_RCVD:1,TT_YMSGR:2,TT_ACTION_MSG_RED:3,TT_ACTION_MSG_GREEN:4,TT_STATUS_CHANGE:5,TT_STATUS_CHANGE_IMUNIFIED:6,TT_IMV_NOTIFY:7,TT_TEXT:9,TT_CHAT_JOIN_HEADER:10,TT_CHAT_JOIN_LEAVE:11,TT_CHAT_MSG_SENT:12,TT_CHAT_MSG_RCVD:13,TT_CHAT_ACT_SENT:14,TT_CHAT_ACT_RCVD:15,TT_CHAT_IGNORE:16,TT_JSON:23},LastTypingILNHTML:'<div id="LastTypingILN" class="conversationItem recvername"></div>',LastMessageReceivedDelay:60*1000,EmptyConversationHTML:"",Version:"$Revision: 1.62 $".match(/ ([0-9.]+) /)[1]},host:YAHOO.Msgr.Host,context:"IM",container:null,scrollElement:null,styles:{},imvMgr:null,lastSenderID:null,lastRHSenderID:null,lastClickedURL:null,lastMessageSent:{},lastMessageReceived:{},lastMessageReceivedTimer:null,lastActiveSourceIndex:-1,messageSentCount:0,messageReceivedCount:0,currentPluginID:null,timestampsShown:0,limitMessages:false,autoScrollEnabled:true,doAutoScroll:true,timerBeforeIMV:0,cachedIMPMatches:[],audibles:[],jsonMessageHandlers:{},init:function(){for(var E in this.k.GlobalFunctions){YAHOO.Msgr.bindGlobalToMethod(this,E,this.k.GlobalFunctions[E])}var C=$("ConversationBody");this.k.EmptyConversationHTML=C.innerHTML;this.imvMgr=YAHOO.Msgr.IMVManager;this.imvMgr.init();this.setContainer(C);this.onMessageStyleChanged();var D=YAHOO.Msgr.Styles;for(var A in D){this.addDefaultStyle(A,D[A])}delete YAHOO.Msgr.Styles;var B=this;document.body.attachEvent("onkeydown",function(){return B.onKeyDown(window.event)});document.body.attachEvent("onmousedown",function(){return B.onMouseDown(window.event)});document.body.attachEvent("onbeforeactivate",function(){return B.onBeforeActivate(window.event)});window.attachEvent("onresize",function(){B.onResize(window.event)})},loadIMPManager:function(inCode,inData){try{window.eval(inCode);YAHOO.Msgr.IMPManager.init(inData);YAHOO.Msgr.IMPManager.setConversationContainer(this.container.id);if(this.cachedIMPMatches.length){for(var i=0;i<this.cachedIMPMatches.length;i++){this.onIMPMatched(this.cachedIMPMatches[i])}this.cachedIMPMatches=null}}catch(exception){}},updateIsRepeatSender:function(B,C){if(C){var A=(this.lastRHSenderID==B);this.lastRHSenderID=B}else{var A=(this.lastSenderID==B);this.lastSenderID=B}return A},resetRepeatSender:function(){this.lastSenderID=null;this.lastRHSenderID=null},setContainer:function(A,B){if(A&&A!=this.container){if(this.container){var C=this.container;var D=document.createDocumentFragment();var F;while(F=C.firstChild){D.appendChild(F)}C.innerHTML="";A.appendChild(D);this.scrollElement.detachEvent("onscroll",this.onScrollHandler)}this.container=A;this.scrollElement=B||A;this.scrollElement.attachEvent("onscroll",this.onScrollHandler)}this.scrollToBottom();try{YAHOO.Msgr.IMPManager.setConversationContainer(this.container.id,this.scrollElement.id)}catch(E){}},resetContainer:function(){var A=$("ConversationBody");this.showContainer(true);this.setContainer(A,A)},getContainer:function(){return this.container},getScrollContainer:function(){return this.scrollElement},showContainer:function(A){this.container.style.display=A?"":"none"},autoScroll:function(){if(this.autoScrollEnabled&&this.doAutoScroll&&this.scrollElement){this.scrollElement.scrollTop=this.scrollElement.scrollHeight+1000000000}},updateAutoScroll:function(A){if(typeof A=="boolean"){this.doAutoScroll=A}else{if(this.scrollElement){this.doAutoScroll=(this.scrollElement.scrollTop+this.scrollElement.clientHeight>=this.scrollElement.scrollHeight-40)}}},setAutoScrollEnabled:function(A){this.autoScrollEnabled=A},scrollToBottom:function(){this.updateAutoScroll(true);this.autoScroll()},showScrollbar:function(A){if(A){YAHOO.Msgr.addClass(this.container,"nonscrollableConversation")}else{YAHOO.Msgr.removeClass(this.container,"nonscrollableConversation")}},clearAll:function(){this.resetRepeatSender();try{YAHOO.Msgr.IMPManager.onBeforeClearAll()}catch(A){}if(this.container==$("ConversationBody")){this.container.innerHTML=this.k.EmptyConversationHTML}else{this.container.innerHTML=""}},appendHTML:function(A){this.updateAutoScroll();InsertHTML(A,this.container);this.autoScroll()},showRecentMessages:function(B,D){if(!this.imvMgr.handle("ViewRecent",B)){return }this.updateAutoScroll();$("RecentHistory").style.display=(B==0||D==0)?"none":"block";var C=$("show_hide_recent");if(C){C.style.display=(D==0)?"none":"block"}YAHOO.Msgr.addClass(this.container,"HACK");YAHOO.Msgr.removeClass(this.container,"HACK");var A=this;setTimeout(function(){A.autoScroll()},1)},showTimestamps:function(A){this.timestampsShown=((typeof A=="boolean"&&A)||(A>0))?1:0;this.imvMgr.handle("ViewTimestamps",this.timestampsShown);YAHOO.Msgr.Conversation.updateAutoScroll();if(this.timestampsShown==1){YAHOO.Msgr.addClass(this.container,"showTimestamps")}else{YAHOO.Msgr.removeClass(this.container,"showTimestamps")}this.autoScroll()},showTypingNotification:function(){var B=this.getInfo("remoteDisplayName");if(!B){return }var A=$("LastTypingILN");this.updateAutoScroll();if(!A){this.appendHTML(this.k.LastTypingILNHTML);A=$("LastTypingILN")}else{this.container.appendChild(A)}A.innerHTML=YMSGR.TypingString.replace("%s",B);YAHOO.Msgr.removeClass(A,"LastMessageReceived");A.style.display="block";A.style.visibility="visible";this.autoScroll();this.resetLastMessageReceivedTimer()},hideTypingNotification:function(B){var A=$("LastTypingILN");if(A){if(B){A.style.display="none"}else{A.style.visibility="hidden"}this.resetLastMessageReceivedTimer(true)}},isTypingNotificationVisible:function(){var A=$("LastTypingILN");return(A&&A.style.visibility=="visible"&&A.style.display=="block"&&!YAHOO.Msgr.hasClass(A,"LastMessageReceived"))},showLastMessageReceived:function(){if(this.lastMessageReceived.date){this.showTypingNotification();var A=$("LastTypingILN");if(A){var B=this.getInfo("LastMessageString").replace("%s",this.lastMessageReceived.date);B=B.replace("%s",this.lastMessageReceived.time);A.innerHTML=B;YAHOO.Msgr.addClass(A,"LastMessageReceived");this.autoScroll()}}},resetLastMessageReceivedTimer:function(A){clearTimeout(this.lastMessageReceivedTimer);if(A){this.lastMessageReceivedTimer=setTimeout(this.onLastMessageReceivedTimeout,this.k.LastMessageReceivedDelay)}},getCurrentPluginID:function(){return this.currentPluginID},setInfo:function(B,A){YMSGR[B]=A},getInfo:function(A){switch(A){case"isBuddy":return IsBuddy;case"intl":return YMSGR.Intl;case"messengerVersion":return YMSGR.YPager_Version;case"remoteID":return NAMES.receiver.id;case"remoteDisplayName":return NAMES.receiver.display;case"localID":return NAMES.sender.id;case"localDisplayName":return NAMES.sender.display;case"version":return this.k.Version;case"messageSentCount":return this.messageSentCount;case"messageReceivedCount":return this.messageReceivedCount;default:return YMSGR[A]}},setPath:function(A){Path=A},getContext:function(){return this.context},getUniqueID:function(){return document.uniqueID},setRegionLimiting:function(A){this.limitMessages=(A!=0)},setMessageStyle:function(A){this.host.setPref("MessageFormat",A.toString());this.onMessageStyleChanged()},setSkinColors:function(F,E,B,C,D,A){YAHOO.Msgr.SkinColors={background:F.toLowerCase(),highlight:E.toLowerCase(),shadow:B.toLowerCase(),selected:C.toLowerCase(),buttonText:D.toLowerCase(),selectedText:A.toLowerCase()}},setBackgroundImage:function(D,B,C,F,A,G){var E=this.container.style;if(!D){E.background=""}else{E.backgroundPosition=(C||"center")+" "+(F||"center");E.backgroundImage="url("+D+")";E.backgroundRepeat=A||"no-repeat";E.backgroundAttachment="fixed";E.backgroundColor=G||"#ffffff"}},selectElement:function(B){var A=document.body.createTextRange();A.moveToElementText(B);A.select()},copySelection:function(){var A=document.selection.createRange().text;if(this.timestampsShown!=1){A=A.replace(this.k.TimestampPattern,": ")}if(A){YAHOO.Msgr.Host.invokeCommand(10,A)}},removeILN:function(C){if(this.imvMgr.handle("InlineNotification",C,false,"")){var B=$(C);if(B){if(typeof B.length=="number"){for(var A=B.length-1;A>=0;A--){RemoveHTML(B[A].parentNode)}}else{RemoveHTML(B.parentNode)}}}},removeOldChatMessages:function(){if(!IMV&&this.limitMessages){var C=this.container.childNodes;if(C.length>this.k.MaxMessages){for(var B=0,A=this.k.MaxMessagesRemove;B<A;B++){C[0].removeNode(true)}YAHOO.Msgr.removeClass(C[0],"repeatSender")}}},hideMessagesFromID:function(D){var C=this.container.childNodes;for(var A=C.length-1;A>=0;A--){var B=C[A];if(B.senderID==D){B.removeNode(true)}}this.scrollToBottom()},showMessagesFromID:function(A){},toggleFTFileList:function(A,B){var C=$(B);var D=$(A);if(C&&D){if(C.style.display=="none"){C.style.display="inline";D.src=D.expandedImage;C.scrollIntoView()}else{C.style.display="none";D.src=D.collapsedImage}}},registerJSONMessageHandler:function(B,A){this.jsonMessageHandlers[B]=A},onFTFilenameChanged:function(B,E,D){var C=$(B);if(C){C.innerHTML=D;var A=this;setTimeout(function(){A.updateAutoScroll();A.autoScroll()},1)}},onFTProgressBarUpdated:function(A,F,H){if(!this.imvMgr.handle("UpdateProgressBar",A,H)){return }var J=$(F);var D=$(F+"Left");var I=$(F+"LeftText");var C=$(F+"RightText");var B=H/100;B=B<0?0:(B>1?1:B);var G=Math.floor(B*160);var E=Math.floor(B*100);if(C&&D&&I&&J){C.innerHTML=E+"%";if(G==0){D.style.visibility="hidden";J.leftHidden="true"}else{D.style.width=G;I.innerHTML=C.innerHTML;if(J.leftHidden=="true"){D.style.visibility="visible";J.leftHidden="false"}}J.currentValue=H}},onAppend:function(K,N,E,F,I,G,L,D,C,J){var A={type:I,text:N,date:E,time:F};if(K){A.sender={id:K,displayName:L,isIgnored:G}}if(D){A.imp={id:D,url:C,data:J}}var H=this.k.MessageType,M="",B=this.isTypingNotificationVisible();this.hideTypingNotification(true);switch(I){case H.TT_CHAT_MSG_SENT:case H.TT_CHAT_MSG_RCVD:case H.TT_SENT:case H.TT_RCVD:case H.TT_YMSGR:M=this.onMessage(A);break;case H.TT_ACTION_MSG_RED:case H.TT_ACTION_MSG_GREEN:case H.TT_STATUS_CHANGE:case H.TT_STATUS_CHANGE_IMUNIFIED:M=this.onStatusChange(A);break;case H.TT_IMV_NOTIFY:M=this.onIMVNotify(A);break;case H.TT_TEXT:if(this.getContext()=="Alert"){M=this.onAlert(A)}else{M=this.onILN(A)}break;case H.TT_CHAT_JOIN_HEADER:M=this.onChatJoinHeader(A);break;case H.TT_CHAT_IGNORE:case H.TT_CHAT_JOIN_LEAVE:case H.TT_CHAT_ACT_SENT:case H.TT_CHAT_ACT_RCVD:M=this.onChatEvent(A);break;case H.TT_JSON:M=this.onJSONMessage(A);break;default:break}if(M){this.removeOldChatMessages();if(A.sender){if(A.type==H.TT_SENT){this.resetLastMessageReceivedTimer()}else{if(A.type==H.TT_RCVD){this.resetLastMessageReceivedTimer(true);B=false}}}else{this.resetLastMessageReceivedTimer();B=false}if(B){this.showTypingNotification()}if(D){this.onIMPMatched({type:D,url:C,messageText:N,messageID:M,messageType:I,senderID:K,senderDisplayName:L,userIsSender:I==H.TT_SENT||I==H.TT_CHAT_MSG_SENT,data:J})}}},onAppendRecent:function(H,J,D,E,G,B,C,I){if(!this.imvMgr.handle("Recent",H,J,G,D,E)){return }var A={type:G,text:J,date:D,time:E};if(H){A.sender={id:H,displayName:H,isIgnored:false}}if(B){A.imp={id:B,url:C,data:I}}var F=this.k.MessageType;switch(G){case F.TT_SENT:case F.TT_RCVD:case F.TT_YMSGR:this.onMessage(A,true);break;case F.TT_TEXT:this.resetRepeatSender();InsertHTML('<div class="iln"><div>'+J+"</div></div>",$("RecentHistory"));break;default:break}},onMessage:function(F,D){var H=this.k.MessageType;if(F.type==H.TT_CHAT_MSG_SENT){F.type=H.TT_SENT}else{if(F.type==H.TT_CHAT_MSG_RCVD){F.type=H.TT_RCVD}}var K={date:F.date.replace(/(\d{1,2}\/\d{2})\/\d{2,4}/,"$1"),time:F.time.replace(/(\d{1,2}:\d{2}):\d{2}/,"$1")};if(F.type==H.TT_SENT){this.lastMessageSent=K;if(!D){this.messageSentCount++}}else{if(F.type==H.TT_RCVD){this.lastMessageReceived=K;if(!D){this.messageReceivedCount++}}}if(F.type==H.TT_SENT||F.type==H.TT_RCVD){var G=F.text;var C=this.imvMgr.filterMessage(F.sender.id,F.text,F.type);if(C!=G){F.imp=null;F.text=C}}var J=this.updateIsRepeatSender(F.sender.id,D);if(!this.imvMgr.handle("Message",F.sender.id,F.text,F.type,F.date,F.time)){return }var B=["sendername","recvername","ymsgrname"][F.type]||"";var A=this.getUniqueID();var I=["conversationItem",(J?"repeatSender":""),(["userSent","contactSent",""][F.type]||""),"YID_"+F.sender.id].join(" ");var E=['<div id="',A,'" class="',I,'" senderID="',F.sender.id,'">','<span class="',B,'">',F.sender.displayName,'<span class="timestamp"> (',F.date," ",F.time,')</span>:</span> <span class="usertext">',F.text,"</span></div>"].join("");if(!D){if(F.type==H.TT_SENT){this.scrollToBottom()}this.appendHTML(E)}else{InsertHTML(E,$("RecentHistory"))}return A},onHandleStatus:function(A,B){this.onStatusChange({text:A,type:B})},onStatusChange:function(A){if(!this.imvMgr.handle("Status",A.text,A.type)){return }var D="ystatus";RemoveHTML(D);if(A.text){var B=this.k.MessageType;switch(A.type){case B.TT_ACTION_MSG_RED:case B.TT_ACTION_MSG_GREEN:var C=(A.type==B.TT_ACTION_MSG_RED)?"error":"event";this.appendHTML('<div id="'+D+'" class="iln"><div class="'+C+' bd">'+A.text+"</div></div>");return D;break}}},onILN:function(B){this.resetRepeatSender();var C=B.text.match(/<table.*?id\s*=\s*(.*?)(\s|>)/);var D="";if(C){D=C[1].replace(/'"/g,"")}if(D&&!this.imvMgr.handle("InlineNotification",D,true,B.text)){return }var A=this.getUniqueID();this.appendHTML('<div id="'+A+'" class="iln">'+B.text+"</div>");return A},onJSONMessage:function(inEvent){try{var message=eval("("+inEvent.text+")")}catch(exception){return null}if(typeof message!="object"||message===null){return null}if(!this.imvMgr.handle("JSONMessage",message)){return }var messageID=this.getUniqueID();var handler=this.jsonMessageHandlers[message.type];var html=null;if(typeof handler=="function"){html=handler(message,messageID)}if(html){this.appendHTML(html);this.resetRepeatSender();return messageID}else{return null}},onAudible:function(P,I,H,J,C,D,F,N,E){this.resetRepeatSender();if(!this.imvMgr.handle("Audible",P,I,H,J,C,D,F,N,E)){return }if(this.audibles.length>=this.k.MaxAudibles){var M=this.audibles.shift();var O=$("aud"+M);if(O){O.outerHTML='<img src="file://'+D+'Media\\Audibles\\replace.gif">';O=null}}this.audibles.push(I);var B=this.getUniqueID();var L="aud"+I;var G="caption_"+I;var A=["sendername","recvername","ymsgrname"][E]||"";var K=["<div id='",B,"' class='conversationItem'><span class='",A,"'>",P,":</span> ","<div class='audibleContainer'>","<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' id='",L,"' title='",J,"'>","<param name='movie' value='",D,"Media\\Audibles\\head.swf?audURL=",F,"&instanceId=",N,"&audibleId=",H,"'/>","<param name='quality' value='high' />","<param name='wmode' value='transparent' />","<param name='flashVars' value='isCurrent=1' />","<param name='menu' value='false' />","</object><span class='usertext' id='",G,"'></span><br></div></div>"].join("");this.appendHTML(K);setTimeout(function(){var Q=$(L);if(!Q){return }if(Q.readyState==4){var R=$(G);if(R){setTimeout(function(){try{var V,U=$(G),T=$(L);U.innerHTML=T.GetVariable("/head:caption")}catch(V){}U=null;T=null},100)}}else{var S=arguments.callee;S.retryCount=(S.retryCount||0)+1;if(S.retryCount<4){setTimeout(S,100)}S=null}R=null;Q=null},100)},onChatJoinHeader:function(A){A.text='<div class="status bd">'+A.text+"</div>";return this.onILN(A)},onChatEvent:function(A){var B=YAHOO.Msgr.Conversation.k.MessageType;var C="status";var D=A.sender?A.sender.id:"";switch(A.type){case B.TT_CHAT_JOIN_LEAVE:C="joinLeave";break;case B.TT_CHAT_IGNORE:C="event";break}A.text='<div class="'+C+' bd" senderID="'+D+'"><strong class="recvername">'+A.sender.displayName+"</strong> "+A.text+"</div>";return this.onILN(A)},onIMPMatched:function(A){if(!YAHOO.Msgr.IMPManager){this.cachedIMPMatches.push(A)}else{try{YAHOO.Msgr.IMPManager.onIMPMatched(A)}catch(B){}}},onAlert:function(A){var E=this.getUniqueID();var C=['<div id="',E,'" class="alertBody">',A.text,"</div>"].join("");this.appendHTML(C);var B=$(E);if(B){var D=B.getElementsByTagName("b")[0];if(D&&D.innerText=="Yahoo! Alerts"){D.removeNode(true)}B.scrollIntoView(true)}return B?E:null},onIMVLoaded:function(A){},onIMVUnloaded:function(A){this.resetContainer();this.restoreDefaultStyles()},onIMVNotify:function(A){if(!this.imvMgr.handle("Notify",A.text)){return }RemoveHTML("$imvnotify");if(A.text){this.appendHTML('<div id="$imvnotify" class="iln"><div class="event bd">'+A.text+"</div></div>")}},onIMVOverlayUpdated:function(A){var B=$("$overlay");if(B){if(A==""){B.filters[0].apply();B.firstChild.style.display="none";B.filters[0].play();setTimeout(function(){RemoveHTML("$overlay")},3000)}else{B.firstChild.innerHTML=A}}else{if(A){InsertHTML('<div id="$overlay" class="imvOverlay"><div>&nbsp;</div></div>');B=$("$overlay");B.firstChild.innerHTML=A;B.firstChild.style.display="block"}}B=null},onMessageStyleChanged:function(){var D=parseInt(this.host.getPref("MessageFormat"),10);D=(isNaN(D)||D<0||D>2)?2:D;var C="font-family: Tahoma; font-size: 8pt; font-weight: bold; padding: .4em 0 1px 0;";var B={".sendername":"color:#808080;"+C,".recvername":"color:#333399;"+C,".conversationItem":"position: relative; margin: 0px 0 .3em 13px; padding-right: 6px;",".conversationItem.repeatSender .sendername":"display: none",".conversationItem.repeatSender .recvername":"display: none"};if(D>0){if(D==2){B[".sendername"]+="display: inline;";B[".recvername"]+="display: inline;"}else{B[".sendername"]+="display: block;";B[".recvername"]+="display: block;"}}else{B[".sendername"]+="display: inline;";B[".recvername"]+="display: inline;";B[".conversationItem"]="margin: 0px 0 1px 13px; padding-right: 6px;";B[".conversationItem.repeatSender .sendername"]=B[".conversationItem.repeatSender .recvername"]="display: inline;"}this.updateAutoScroll();for(var A in B){this.addDefaultStyle(A,B[A])}this.restoreDefaultStyles()},onRecentMessagesPromptChanged:function(B){var A=$("show_hide_descr");if(A){A.innerHTML=B}},onSetContext:function(A){this.context=A;YAHOO.Msgr.addClass(document.body,this.context);if(this.context=="Chat"){this.setRegionLimiting(1)}},onNamesChanged:function(B,A,D,C){NAMES={sender:{id:D,display:B},receiver:{id:C,display:A}};this.imvMgr.handle("Names",B,A,D,C)},onIsBuddyChanged:function(A){IsBuddy=(A==1);this.imvMgr.handle("IsBuddy",A)},onP2PStateChanged:function(A){this.setInfo("P2P",A);this.imvMgr.handle("P2PState",A)},onWindowActivated:function(A){this.imvMgr.handle("Activate",A)},onWindowMinimized:function(A){},onWindowClosed:function(){},onTyping:function(B,A){if(B==0){if(A==1){this.showTypingNotification()}else{this.hideTypingNotification()}}},onLastMessageReceivedTimeout:function(){YAHOO.Msgr.Conversation.showLastMessageReceived()},onAction:function(C,B,A){this.resetRepeatSender();if(!this.imvMgr.handle("Action",C,B)){return }if(C==0){this.appendHTML('<div class="buzzMessage">'+A+"</div>");Buzz("")}},onInputSelection:function(A){InputSelection=A;this.imvMgr.handle("InputSelection",A)},onPluginOpened:function(A){this.currentPluginID=A;try{YAHOO.Msgr.IMPManager.onPluginEvent({type:"PluginOpened",id:this.currentPluginID})}catch(B){}},onPluginClosed:function(A){this.currentPluginID=null;try{YAHOO.Msgr.IMPManager.onPluginEvent({type:"PluginClosed",id:this.currentPluginID})}catch(B){}},onPlayableFTFinished:function(D,A,C){if(this.context!="IM"){return }var B=A.split("|");this.onIMPMatched({type:C,paths:B,messageID:D})},onMouseDown:function(A){var B=A.srcElement;var C=this.getContext();if((C=="Chat"||C=="Conference")&&YAHOO.Msgr.hasClass(B,"recvername")){if(A.button==2){YAHOO.Msgr.Host.invokeCommand(1,B.parentNode.senderID)}else{YAHOO.Msgr.Host.invokeCommand(2,B.parentNode.senderID)}}},onKeyDown:function(A){var C=A.keyCode,B=-1;switch(C){case 48:case 49:case 50:B=C-48;break;case 51:B=0;break;case 9:if(document.activeElement){this.lastActiveSourceIndex=document.activeElement.sourceIndex}else{this.lastActiveSourceIndex=-1}break}if(B>-1){this.setMessageStyle(B)}},onBeforeActivate:function(A){if(!A.fromElement&&this.lastActiveSourceIndex>-1){A.cancelBubble=true;A.srcElement.setActive();YAHOO.Msgr.Host.moveFocus("next");return false}else{return true}},onScrollHandler:function(){YAHOO.Msgr.Conversation.onScroll(window.event)},onScroll:function(A){this.updateAutoScroll()},onResize:function(B){this.autoScroll();var A=document.body;if(!this.imvMgr.handle("Resize",A.clientWidth,A.clientHeight)){return }},anchorOnClick:function(A){this.host.openURL(A.href,false);event.cancelBubble=true;event.returnValue=false;return false},anchorOnMouseUp:function(A){if(event.button==2){this.selectElement(A);this.host.onRightClick(A.href)}},addStyle:function(B,A,F){if(typeof B!="string"||B.length==0){return }if(typeof A=="object"){var D=[];for(var E in A){D.push(E,":",A[E],";")}A=D.join("")}var C=document.styleSheets(0);this.styles[B]={css:A,index:C.rules.length,isDefault:F};C.addRule(B,A)},addDefaultStyle:function(B,A){this.addStyle(B,A,true)},getStyle:function(A){var B=this.styles["."+A]||this.styles[A];if(B){return document.styleSheets(0).rules(B.index).style}else{return{}}},restoreDefaultStyles:function(){document.body.background="";document.body.style.background="#fff";if(document.styleSheets==null){return }try{var C=document.styleSheets(0);if(C&&C.rules){while(C.rules.length>0){C.removeRule()}}for(var A in this.styles){var D=this.styles[A];if(D.isDefault){D.index=C.rules.length;C.addRule(A,D.css)}else{delete this.styles[A]}}}catch(B){}this.autoScroll()},getPref:function(A){return this.host.getPref(A)},setPref:function(B,A){return this.host.setPref(B,A)},getPrefForContact:function(A){return this.host.getPrefForContact(A)},setPrefForContact:function(B,A){return this.host.setPrefForContact(B,A)},startPhotoSharing:function(A){return this.host.startPhotoSharing(A)},startPlugin:function(A){return this.host.startPlugin(A)}};YAHOO.Msgr.IMVManager={k:{GlobalFunctions:{$Load:"load",$Unload:"unload",$Handler:"handleClientEvents",$HandleLastMessage:"onLastMessage",$HandleLocalData:"onLocalData",$ExecRPC:"onRPCReceived"}},conv:YAHOO.Msgr.Conversation,markedElementsToKeep:false,timerBeforeIMV:0,currentIMVName:"",init:function(){for(var A in this.k.GlobalFunctions){YAHOO.Msgr.bindGlobalToMethod(this,A,this.k.GlobalFunctions[A])}},load:function(inIMVName,inCode){var exception;this.unload();Redirect="http://rd.yahoo.com/messenger/imv/"+inIMVName+"/?";var children=document.body.childNodes;for(var i=children.length-1;i>=0;i--){try{children[i].keep=true}catch(exception){}}this.markedElementsToKeep=true;this.timerBeforeIMV=setTimeout(function(){},1);function LoadIMV(){}try{eval(inCode);var base=document.all.tags("BASE")[0];if(base){base.href=Path}LoadIMV();IMV=IMVironment;IMV.Start();this.currentIMVName=inIMVName;this.conv.onIMVLoaded(inIMVName)}catch(exception){this.unload();IMV=IMVironment=null;this.currentIMVName="";Redirect="";return }},unload:function(){if(IMV){IMV.Stop();RPC.$clear();this.conv.onIMVUnloaded(this.currentIMVName);if(this.markedElementsToKeep){var C=setTimeout(function(){},1);for(var B=this.timerBeforeIMV;B<C;B++){clearTimeout(B)}var A=document.body.childNodes;for(var B=A.length-1;B>=0;B--){var D=A[B];if(!D.keep){D.outerHTML=""}}}}IMV=IMVironment=null},set:function(A){YAHOO.Msgr.Host.invokeCommand(24,A);return false},handle:function(B){var A=true;if(IMV){var D=Array.prototype.slice.call(arguments,1),C="Handle"+B;if(B=="Action"&&typeof IMV[C]!="function"){C="HandleBuzz"}if(typeof IMV[C]=="function"){A=IMV[C].apply(IMV,D)}}return A},handleClientEvents:function(A){var C=A.replace(/^Handle/,""),D=Array.prototype.slice.call(arguments,1),E,B={Minimize:"onWindowMinimized",Close:"onWindowClosed",Typing:"onTyping"};E=this.conv[B[C]];if(typeof E=="function"){E.apply(this.conv,D)}D.unshift(C);this.handle.apply(this,D)},filterMessage:function(C,A,B){if(IMV&&typeof IMV.FilterMessage=="function"){return IMV.FilterMessage.apply(IMV,arguments)}else{return A}},onLastMessage:function(B,C,D,A){var E=this.filterMessage(B,C,1);this.handle("LastMessage",B,E,D,C)},onLocalData:function(A){this.handle("LocalData",Unmarshal(A))},onRPCReceived:function(C,A){var B=RPC.$fn[C];if(typeof B=="function"){B(A)}}};YAHOO.Msgr.VitalityManager={k:{ILNTemplate:'<div id="{messageID}" class="iln status vitality">                           <a href="#" onclick=\'YAHOO.Msgr.VitalityManager.removeInlineVitality("{vitalityID}"); return false;\' class="CloseBox {closeBoxClass}"><img src="{closeBoxPath}"></a>                          <div id="{vitalityID}" class="Content">                                 <h1>{longForm}</h1>                                     <div class="Description {bodyClass}">{thumbnailImages}{descriptionText}</div>                                   <div class="ft"><div class="PubDate">{localtime} <a class="Source" href="{loc_toplevelurl}" title="{loc_localizedname}"><img src="{loc_iconurl}"></a></div></div>                                       <br>                            </div>                  </div>',ThumbnailImage:'<a href="{link}" title="{linkTip}"><img src="{imgurl}"></a>',LongFormStyling:{profile_nickname:"<em>{displayName}</em>",title:'<a href="{link}" class="UpdateLink title" title="{linkTip}">{title}</a>'},LongFormLink:'<a href="{hrefToken}" class="UpdateLink {className}" title="{hrefTooltipToken}" target="_blank">{linkTextToken}</a>',MaxDescriptionLength:100,MaxTooltipLength:80,ILNID:"IMVitality",Styles:{".vitality .Content":{padding:"4px 6px 5px 7px","font-family":"Tahoma","font-size":"8pt"},".vitality br":{height:0,clear:"both"},".vitality h1":{font:"menu",margin:0,"padding-right":"20px"},".vitality h1 em":{"font-weight":"bold","font-style":"normal",color:"#666666"},".vitality a":{color:"#3399cc"},".vitality .Description":{"margin-top":".5em",padding:"top"},".vitality .Description img":{height:"48px","float":"left",margin:".25em .75em .5em 0",border:"none","-ms-interpolation-mode":"bicubic"},".vitality .ft":{color:"#999999",padding:"5px 0px 5px 0",clear:"both"},".vitality .Source":{"margin-left":".25em","vertical-align":"middle"},".vitality .PubDate":{"float":"right","font-size":"7pt"},".vitality .hidden":{display:"none"},".vitality .CloseBox":{position:"absolute",top:"4px",right:"4px",cursor:"default"}}},ilnCount:0,init:function(){var C=YAHOO.Msgr.Conversation;var D=this.k.Styles;for(var A in D){C.addDefaultStyle(A,D[A])}var B=this;C.registerJSONMessageHandler("IMVitality",function(){return B.messageHandler.apply(B,arguments)})},messageHandler:function(H,N){var D=YAHOO.Msgr.Conversation;var A=YAHOO.Msgr.supplant;var P=this;var K=H.data.updates;var J="";if(!K.length){return null}try{var G=K[0];var M=G.loc_longformraw;if(!M){return""}G.groupCount=parseInt(G.vitagrp_count);G.isGroup=G.groupCount>1;var Q={closeBoxPath:H.data.closeBoxPath,closeBoxClass:"",displayName:D.getInfo("remoteDisplayName"),linkTip:this.clipString(G.link,this.k.MaxTooltipLength),bodyClass:((G.description&&!G.isGroup)||G.imgurl)?"":"hidden",messageID:N,thumbnailImages:"",descriptionText:""};if(G.description&&!G.isGroup){var L=G.description;this.clipString(L,this.k.MaxDescriptionLength,"&hellip;");Q.descriptionText=L.replace(/\n\n/g,"<br><br>")}if(G.isGroup&&G.vitagrp_imgurl_1){var E=[];for(var I=1;I<=G.groupCount;I++){var O=G["vitagrp_imgurl_"+I];if(O){E.push(A(this.k.ThumbnailImage,{imgurl:O,linkTip:G["vitagrp_title_"+I]||"",link:G["vitagrp_link_"+I]||""}))}}Q.thumbnailImages=E.join("")}else{if(G.imgurl){Q.thumbnailImages=A(this.k.ThumbnailImage,G,Q)}}if(D.getInfo("messageSentCount")>0||D.getInfo("messageReceivedCount")>0){Q.vitalityID=this.k.ILNID+"_"+this.ilnCount++;Q.closeBoxClass="hidden"}else{D.removeILN(this.k.ILNID);Q.vitalityID=this.k.ILNID}var F=M.replace(/{([^{}]+)}/g,function(R,T){T=T.toLowerCase();var S=P.k.LongFormStyling[T];if(!S){if(!G[T]){return""}var U;if(T.slice(-3)=="txt"){U=T.replace(/txt$/,"url");if(!G[U]){U="link"}}else{if(T.indexOf("vitagrp_title")>-1){U=T.replace("vitagrp_title","vitagrp_link")}}if(G[U]&&U!=T){Q[U+"Tip"]=P.clipString(G[U],P.k.MaxTooltipLength);S=A(P.k.LongFormLink,{hrefToken:"{"+U+"}",linkTextToken:"{"+T+"}",hrefTooltipToken:"{"+U+"Tip}",className:T})}else{if(G[T]){S="{"+T+"}"}}}return S});var C=A(F,G,Q);Q.longForm=C;J=A(this.k.ILNTemplate,G,Q)}catch(B){}return J},removeInlineVitality:function(A){YAHOO.Msgr.Host.invokeCommand(89);YAHOO.Msgr.Conversation.removeILN(A)},clipString:function(C,A,B){B=B||"...";if(C&&C.length>A){var D=C.lastIndexOf(" ",A);if(D>-1){A=D}C=C.slice(0,A)+B}return C}};YAHOO.Msgr.VitalityManager.init();(function(){var H="font-family: Arial; font-size: 10pt;";var D="font-family: Tahoma; font-size: 8pt;";var F="font-weight: bold;";var B=D+"line-height: 1.3em; margin-bottom: 2px;";var E=D+"line-height: 1.3em; padding: 4px 0px 5px 6px;";var G="width: 100%; border-bottom: solid 1px #e0e0e0; margin: 0; border-collapse: collapse;";var C=D+F+"padding: 4px 4px 3px 5px;";var A="border-bottom: 1px dashed #999; cursor: pointer; color: black; background-color: transparent; text-decoration: none;";var I="border-bottom: 1px solid #008; cursor: pointer; background-color: #ddd;";YAHOO.Msgr.Styles={body:{background:"#fff","background-color":"#fff",position:"relative",padding:0,margin:0},"#ConversationBody":"position: absolute; top: 0; left: 0; width: 100%; height:100%; overflow-y: auto; overflow-x: auto; z-index: 0; word-wrap: break-word; padding-bottom: .75em;","#RecentHistory":"display: none",".nonscrollableConversation":{"overflow-y":"hidden","padding-bottom":0},".usertext":H+"color: #000",".ymsgrname":[H,F,"color:#FF0000;"].join(" "),".timestamp":{display:"none","font-weight":"normal"},".conversationItem .sendername":{"text-indent":"-8px"},".conversationItem .recvername":{"text-indent":"-8px"},".usertext img":{"verical-align":"middle !important"},".showTimestamps .sendername":{display:"inline",padding:"1px 0"},".showTimestamps .recvername":{display:"inline",padding:"1px 0"},".showTimestamps .conversationItem.repeatSender .sendername":{display:"inline",padding:"1px 0"},".showTimestamps .conversationItem.repeatSender .recvername":{display:"inline",padding:"1px 0"},".showTimestamps .timestamp":{display:"inline"},".redstatus":C+"color: #dd3333;",".buzzMessage":C+"color: #dd3333;",".greenstatus":C+"color: #33dd33;",".graystatus":C+"color: #888888;",".chataction":C+"color: #880088;",".imvnotify":C+"color: #000088;",a:"color: #0000FF;","a img":"border: none;",p:"text-indent:-7;margin-left:10;margin-top:1;margin-bottom:1;","#LastTypingILN":"font-style: italic; font-weight: normal; width: 100%; margin: 7px 0 .3em 5px; padding: 0 6px 0 0; display: none;","#LastTypingILN.LastMessageReceived":"text-align: center;",".iln":"position: relative; word-wrap: break-word; margin: 4px 0;",".iln td":E,".iln .bd":E,".iln p":"text-indent: 0; margin: 0; padding:4px 0 0 0;",".iln h3":B,".iln strong":B,".iln a":"color: #0066cc;",".iln .icon":"margin: 2px 1px;",".ilnicon":"margin: 4px 2px 2px 2px;",".iln .sendername":{"text-indent":0},".iln .recvername":{"text-indent":0},".iln button":{font:"menu",color:"#000",padding:"2px 5px",margin:"5px 6px 2px 0",width:"1px",overflow:"visible",background:"#eaebec",border:"1px solid #b3b6b0","-ms-filter":'"progid:DXImageTransform.Microsoft.gradient(StartColorStr=#ffeaebec, EndColorStr=#ffb3b6b6)"',filter:"progid:DXImageTransform.Microsoft.gradient(StartColorStr=#ffeaebec, EndColorStr=#ffb3b6b6)"},".prompt":G+"background-color: #fbfaf3; border-bottom-color: #dfdcc4;",".prompt h3":"color: #77714a;",".prompt strong":"color: #77714a;",".status":G+"background-color: #f7f7f7; border-bottom-color: #e0e0e0;",".status h3":"color: #666666;",".status strong":"color: #666666;",".event":G+"background-color: #f0f6fb; border-bottom-color: #c1cdd7;",".event h3":"color: #5b7b96;",".event strong":"color: #5b7b96;",".error":G+"background-color: #ffeeee; border-bottom-color: #ffcccc;",".error h3":"color: #660000;",".error strong":"color: #660000;",".imvOverlay":'position:absolute; bottom:0; left:0; height:20px; width:100%; z-index:1000; -ms-filter: "progid:DXImageTransform.Microsoft.Fade(duration=1, overlap=0.5)"; filter: progid:DXImageTransform.Microsoft.Fade(duration=1, overlap=0.5);',".imvOverlay div":"display: none; width: 100%; height: 100%; padding:2px; background-color:#132D71; color:#FFFFFF; font-weight:bold; text-align: center;"+D,".pmBar":"height: 10px; width: 160px; font-size: 12px; line-height: 12px; font-weight: bold; font-family: monospace; text-align: left; border-style: inset; border-color: ThreeDShadow; border-width: 1px;",".pmBarLeft":"width: 160px; height: 8px; font-size: 8px; line-height: 8px; font-weight: bold; font-family: monospace; position: absolute; overflow: hidden; visibility: hidden; background-color: #b5c3cf; color: #ffffef;",".pmBarRight":"position: normal; background-color: Window; color: WindowText; width: 160px; height: 8px;",".pmBarLeftText":"margin-left: 55px; width: 40px; text-align: center; display:none;",".pmBarRightText":"margin-left: 55px; width: 40px; text-align: center; display:none;",".minicta":"font-size: 7pt;font-weight: bold;",".cta":"font-weight: bold;",".shortcut":"font-size: 7pt; color: #333333;",".cobrand":"vertical-align: top; width: 1%;","span.phoneTag":A,"span.phoneTagHover":I,"span.emailTag":A,"span.emailTagHover":I,"a.phoneTag":A,"a.phoneTag:hover":I,"a.emailTag":A,"a.emailTag:hover":I,".audibleContainer":{padding:"3px 2px 0 0",width:"99%"},".audibleContainer br":{clear:"both"},".audibleContainer object":{"float":"left",width:"48px",height:"48px",margin:"0 6px 0 0","vertical-align":"baseline"},".audibleContainer img":{"float":"left",width:"48px",height:"48px",margin:"0 6px 0 0","vertical-align":"baseline"},".audibleContainer .usertext":{"float":"left"},".Alert p":"margin: 10px 8px 2px 8px; text-indent: 0;",".Alert div.im_main p":"margin: 10px 0px 2px 0px; text-indent: 0;",".Alert div.im_main":"padding: 0 2px;",".Alert td":"padding: 2px 4px;",".Alert br":"padding: 0; margin: 0; line-height: 0;",".Alert alertBody":"margin-bottom: 0.5em;",".Chat .userSent .usertext":{color:"#666"},".Chat .contactSent .usertext":{color:"#000"},".Chat .recvername":{cursor:"pointer"},".Chat .iln .recvername":{color:"#888",cursor:"pointer","text-indent":0,display:"inline",padding:0},".Chat .iln .joinLeave":{color:"#888"},".Conference .userSent .usertext":{color:"#666"},".Conference .contactSent .usertext":{color:"#000"},".Conference .recvername":{cursor:"pointer"},".Conference .iln .recvername":{color:"#888",cursor:"pointer","text-indent":0,display:"inline",padding:0},"":null}})();$=Id=function(D){if(D&&(D.tagName||D.item)){return D}if(typeof D==="string"||!D){return document.getElementById(D)}if(D.length!==undefined){var E=[];var B=arguments.callee;for(var C=0,A=D.length;C<A;++C){E[E.length]=B(D[C])}return E}return D};function InsertHTML(A,B,C){B=$(B)||document.body;C=C||"BeforeEnd";B.insertAdjacentHTML(C,A)}function RemoveHTML(A){A=$(A);if(A){A.outerHTML=""}}function Left(A,B){A=$(A);if(typeof B=="undefined"){return A.style.pixelLeft}else{return A.style.pixelLeft=B}}function Top(A,B){A=$(A);if(typeof B=="undefined"){return A.style.pixelTop}else{return A.style.pixelTop=B}}function Width(A,B){A=$(A);if(typeof B=="undefined"){return A.style.pixelWidth}else{return A.style.pixelWidth=B}}function Height(A,B){A=$(A);if(typeof B=="undefined"){return A.style.pixelHeight}else{return A.style.pixelHeight=B}}function Right(A,B){A=$(A);if(typeof B=="undefined"){return Left(A)+Width(A)}else{return Left(A,B-Width(A))+Width(A)}}function Bottom(A,B){A=$(A);if(typeof B=="undefined"){return Top(A)+Height(A)}else{return Top(A,B-Height(A))+Height(A)}}function AppendInput(A){$Invoke(23,A)}function GetInput(A){$Invoke(25,A)}function SetInput(A){$Invoke(26,A)}function ReplaceInputSelection(A){$Invoke(27,A)}function GetCustomData(A){$Invoke(33,A)}function SetCustomData(B,A){$Invoke(32,B+"="+A)}function GetExternalData(A){$Invoke(21,A)}function SetLocalData(A){$Invoke(20,Marshal(A))}function Marshal(C){if((typeof C=="undefined")||(C==null)){return"null"}switch(C.constructor){case Number:case Boolean:return C.toString();case Function:return"null";case String:return'"'+C.replace(/\"/g,'\\"')+'"';case Array:var B="[";for(var A=0;A<C.length;A++){B+=Marshal(C[A])+((A<C.length-1)?",":"")}return B+"]";case Object:default:var B="{";for(var A in C){B+=A+":"+Marshal(C[A])+","}return B.substring(0,B.length-1)+"}"}}function Unmarshal(I){var J=/^(-?[0-9]+.?[0-9]*|-?Infinity|NaN)$/;var E=/^true|false$/;var L=/^null$/;var F=/^"([^"\\]|\\[^"]|\\")*"$/;var Q=I.charAt(0);var M=I.charAt(I.length-1);if(L.exec(I)){return null}if(J.exec(I)){return I-0}if(E.exec(I)){return(I=="true")}if(F.exec(I)){return I.substring(1,I.length-1).split('\\"').join('"')}if((Q=="[")&&(M=="]")){var B=1}else{if((Q=="{")&&(M=="}")){var S=1}}if(B||S){var A=0;var C=false;if(B){var K=[]}else{var K={}}var H=I.substring(1,I.length-1);var O=0;for(var P=0;P<H.length;P++){var R=H.charAt(P);if((R==",")&&(A==0)){if(B){var G=Unmarshal(H.substring(O,P));K.push(G)}else{var D=H.substring(O,P);var N=D.indexOf(":");var G=Unmarshal(D.substr(N+1));K[D.substring(0,N)]=G}O=P+1}else{if((R=="[")||(R=="(")||(R=="{")){A++}else{if((R=="]")||(R==")")||(R=="}")){A--}else{if(R=='"'){if(C){if(H.charAt(P-1)!="\\"){C=false;A--}}else{C=true;A++}}}}}}if(O<P){if(B){var G=Unmarshal(H.substring(O,P));K.push(G)}else{var D=H.substring(O,P);var N=D.indexOf(":");var G=Unmarshal(D.substr(N+1));K[D.substring(0,N)]=G}}return K}return null}function Buzz(A){$Invoke(6,A)}function PlaySound(A){$Invoke(5,A)}function ReplaceSmiley(B,A,D){var C=new RegExp('<img sm="([0-9]+)" src=[^>]+\\\\'+B+"\\.[^>]+>","g");return A.replace(C,D)}function MarkSmileys(){var A=Array.prototype.join.call(arguments,",");$Invoke(31,A)}function SetIMV(A){$Invoke(24,A)}function SetClosePrompt(A){$Invoke(28,A)}function PostMessage(A,C,B){YAHOO.Msgr.Host.postMessage(A,C,B)}function RegisterRPCMethod(B,A){RPC.$reg(B,A)}function SetMinSizeIMV(A,B){$Invoke(29,A+","+B)}function ResizeIMV(A,B){$Invoke(30,A+","+B)}function SetCustomStatus(A){$Invoke(22,A)}function SetHelpMenu(B,A){YAHOO.Msgr.Host.setHelpMenu(B,A)}function $Invoke(B,A){YAHOO.Msgr.Host.invokeCommand(B,A)}function $InlineAction(A){$Invoke(34,A);return false}function phoneClick(B){var A=B.innerText;$Invoke(36,A);return false}function emailClick(B){var A=B.innerText;$Invoke(35,A);return false}YAHOO.Msgr.Conversation.init();

</SCRIPT>

<SCRIPT for=FLASH1 defer event=FSCommand>YAHOO.Msgr.IMVManager.handle("FSCommand", arguments[0], arguments[1]);</SCRIPT>

<SCRIPT for=FLASH2 defer event=FSCommand>YAHOO.Msgr.IMVManager.handle("FSCommand", arguments[0], arguments[1]);</SCRIPT>

<SCRIPT for=FLASH3 defer event=FSCommand>YAHOO.Msgr.IMVManager.handle("FSCommand", arguments[0], arguments[1]);</SCRIPT>

<SCRIPT for=FLASH4 defer event=FSCommand>YAHOO.Msgr.IMVManager.handle("FSCommand", arguments[0], arguments[1]);</SCRIPT>

<SCRIPT for=FLASH5 defer event=FSCommand>YAHOO.Msgr.IMVManager.handle("FSCommand", arguments[0], arguments[1]);</SCRIPT>
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
                <asp:Button ID="m_cmd_exit" runat="server" accessKey="s" CssClass="cssButton" 
                          Height="24px" Text="Thoát" Width="98px" CausesValidation="false" 
                          onclick="m_cmd_exit_Click" /><br />
                          <asp:Label ID="m_lbl_thong_bao" CssClass="cssManField" runat="server"></asp:Label>
                <asp:HiddenField ID="hdf_id_gv" runat="server" />
        </td>
        <td >
		    &nbsp;</td>
	</tr>	
	<tr>
		<td align="center" colspan="3" style="height:450px;" valign="top">
		    &nbsp;
   <asp:GridView ID="m_grv_gd_hop_dong_noi_dung_tt" AllowPaging="True" 
                runat="server" AutoGenerateColumns="False" 
                Width="100%" DataKeyNames="ID"
                CellPadding="4" ForeColor="#333333" 
            AllowSorting="True" 
                
                onselectedindexchanging="m_grv_dm_danh_sach_hop_dong_khung_SelectedIndexChanging" 
                onrowdeleting="m_grv_gd_hop_dong_noi_dung_tt_RowDeleting" >
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
                     <asp:TemplateField HeaderText="Đơn giá (VNĐ)" ItemStyle-HorizontalAlign="Right">
                       <ItemTemplate><%#CIPConvert.ToStr(CIPConvert.ToDecimal(Eval("DON_GIA_HD")),"#,###0")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                    </asp:TemplateField>  
                     <asp:BoundField DataField="TAN_SUAT" HeaderText="Tần suất thanh toán">
                     <ItemStyle Width="10%" />
                    </asp:BoundField>               
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

