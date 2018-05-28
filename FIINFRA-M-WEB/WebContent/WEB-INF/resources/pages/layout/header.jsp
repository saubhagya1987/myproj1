<%@page import="java.io.File"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <script src="${pageContext.request.contextPath}/resources/js/jstree/jstree.min.js"></script> --%>

<script src="${_cdn}/assets/js/common-tree/js/jstree/jstree.min.js"></script>








<style>

@media (max-width: 767px) {
   
  #testaditya {
    float: left; 
  }
  
}
 
 
.jstree-node,.jstree-children,.jstree-container-ul{display:block;margin:0;padding:0;list-style-type:none;list-style-image:none; font-family: "verdana",Helvetica,Arial,sans-serif; font-size: 12px; text-shadow:none; color:#3a3a3e; text-transform: none; font-weight:normal;}.jstree-node{white-space:nowrap}.jstree-anchor{display:inline-block;color:#000;white-space:nowrap;padding:0 4px 0 1px;margin:0;vertical-align:top}.jstree-anchor:focus{outline:0}.jstree-anchor,.jstree-anchor:link,.jstree-anchor:visited,.jstree-anchor:hover,.jstree-anchor:active{text-decoration:none;color:inherit}.jstree-icon{display:inline-block;text-decoration:none;margin:0;padding:0;vertical-align:top;text-align:center}.jstree-icon:empty{display:inline-block;text-decoration:none;margin:0;padding:0;vertical-align:top;text-align:center}.jstree-ocl{cursor:pointer}.jstree-leaf>.jstree-ocl{cursor:default}.jstree .jstree-open>.jstree-children{display:block}.jstree .jstree-closed>.jstree-children,.jstree .jstree-leaf>.jstree-children{display:none}.jstree-anchor>.jstree-themeicon{margin-right:2px}.jstree-no-icons .jstree-themeicon,.jstree-anchor>.jstree-themeicon-hidden{display:none}.jstree-rtl .jstree-anchor{padding:0 1px 0 4px}.jstree-rtl .jstree-anchor>.jstree-themeicon{margin-left:2px;margin-right:0}.jstree-rtl .jstree-node{margin-left:0}.jstree-rtl .jstree-container-ul>.jstree-node{margin-right:0}.jstree-wholerow-ul{position:relative;display:inline-block;min-width:100%}.jstree-wholerow-ul .jstree-leaf>.jstree-ocl{cursor:pointer}.jstree-wholerow-ul .jstree-anchor,.jstree-wholerow-ul .jstree-icon{position:relative}.jstree-wholerow-ul .jstree-wholerow{width:100%;cursor:pointer;position:absolute;left:0;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.vakata-context{display:none}.vakata-context,.vakata-context ul{margin:0;padding:2px;position:absolute;background:#f5f5f5;border:1px solid #979797;-moz-box-shadow:5px 5px 4px -4px #666;-webkit-box-shadow:2px 2px 2px #999;box-shadow:2px 2px 2px #999; z-index:60;}.vakata-context ul{list-style:none;left:100%;margin-top:-2.7em;margin-left:-4px}.vakata-context .vakata-context-right ul{left:auto;right:100%;margin-left:auto;margin-right:-4px}.vakata-context li{list-style:none;display:inline}.vakata-context li>a{display:block;padding:0 2em;text-decoration:none;width:auto;color:#000;white-space:nowrap;line-height:2.4em;-moz-text-shadow:1px 1px 0 #fff;-webkit-text-shadow:1px 1px 0 #fff;text-shadow:1px 1px 0 #fff;-moz-border-radius:1px;-webkit-border-radius:1px;border-radius:1px}.vakata-context li>a:hover{position:relative;background-color:#e8eff7;-moz-box-shadow:0 0 2px #0a6aa1;-webkit-box-shadow:0 0 2px #0a6aa1;box-shadow:0 0 2px #0a6aa1}.vakata-context li>a.vakata-context-parent{background-image:url(data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAIORI4JlrqN1oMSnmmZDQUAOw==);background-position:right center;background-repeat:no-repeat}.vakata-context li>a:focus{outline:0}.vakata-context .vakata-context-hover>a{position:relative;background-color:#e8eff7;-moz-box-shadow:0 0 2px #0a6aa1;-webkit-box-shadow:0 0 2px #0a6aa1;box-shadow:0 0 2px #0a6aa1}.vakata-context .vakata-context-separator>a,.vakata-context .vakata-context-separator>a:hover{background:#fff;border:0;border-top:1px solid #e2e3e3;height:1px;min-height:1px;max-height:1px;padding:0;margin:0 0 0 2.4em;border-left:1px solid #e0e0e0;-moz-text-shadow:0 0 0 transparent;-webkit-text-shadow:0 0 0 transparent;text-shadow:0 0 0 transparent;-moz-box-shadow:0 0 0 transparent;-webkit-box-shadow:0 0 0 transparent;box-shadow:0 0 0 transparent;-moz-border-radius:0;-webkit-border-radius:0;border-radius:0}.vakata-context .vakata-contextmenu-disabled a,.vakata-context .vakata-contextmenu-disabled a:hover{color:silver;background-color:transparent;border:0;box-shadow:0 0 0}.vakata-context li>a>i{text-decoration:none;display:inline-block;width:2.4em;height:2.4em;background:0 0;margin:0 0 0 -2em;vertical-align:top;text-align:center;line-height:2.4em}.vakata-context li>a>i:empty{width:2.4em;line-height:2.4em}.vakata-context li>a .vakata-contextmenu-sep{display:inline-block;width:1px;height:2.4em;background:#fff;margin:0 .5em 0 0;border-left:1px solid #e2e3e3}.vakata-context .vakata-contextmenu-shortcut{font-size:.8em;color:silver;opacity:.5;display:none}.vakata-context-rtl ul{left:auto;right:100%;margin-left:auto;margin-right:-4px}.vakata-context-rtl li>a.vakata-context-parent{background-image:url(data:image/gif;base64,R0lGODlhCwAHAIAAACgoKP///yH5BAEAAAEALAAAAAALAAcAAAINjI+AC7rWHIsPtmoxLAA7);background-position:left center;background-repeat:no-repeat}.vakata-context-rtl .vakata-context-separator>a{margin:0 2.4em 0 0;border-left:0;border-right:1px solid #e2e3e3}.vakata-context-rtl .vakata-context-left ul{right:auto;left:100%;margin-left:-4px;margin-right:auto}.vakata-context-rtl li>a>i{margin:0 -2em 0 0}.vakata-context-rtl li>a .vakata-contextmenu-sep{margin:0 0 0 .5em;border-left-color:#fff;background:#e2e3e3}#jstree-marker{position:absolute;top:0;left:0;margin:-5px 0 0 0;padding:0;border-right:0;border-top:5px solid transparent;border-bottom:5px solid transparent;border-left:5px solid;width:0;height:0;font-size:0;line-height:0}#jstree-dnd{line-height:16px;margin:0;padding:4px}#jstree-dnd .jstree-icon,#jstree-dnd .jstree-copy{display:inline-block;text-decoration:none;margin:0 2px 0 0;padding:0;width:16px;height:16px}#jstree-dnd .jstree-ok{background:green}#jstree-dnd .jstree-er{background:red}#jstree-dnd .jstree-copy{margin:0 2px}.jstree-default .jstree-node,.jstree-default .jstree-icon{background-repeat:no-repeat;background-color:transparent}.jstree-default .jstree-anchor,.jstree-default .jstree-wholerow{transition:background-color .15s,box-shadow .15s}.jstree-default .jstree-hovered{background:#e7f4f9;border-radius:2px;box-shadow:inset 0 0 1px #ccc}.jstree-default .jstree-clicked{background:#beebff;border-radius:2px;box-shadow:inset 0 0 1px #999}.jstree-default .jstree-no-icons .jstree-anchor>.jstree-themeicon{display:none}.jstree-default .jstree-disabled{background:0 0;color:#666}.jstree-default .jstree-disabled.jstree-hovered{background:0 0;box-shadow:none}.jstree-default .jstree-disabled.jstree-clicked{background:#efefef}.jstree-default .jstree-disabled>.jstree-icon{opacity:.8;filter:url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'jstree-grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#jstree-grayscale");filter:gray;-webkit-filter:grayscale(100%)}.jstree-default .jstree-search{font-style:italic;color:#8b0000;font-weight:700}.jstree-default .jstree-no-checkboxes .jstree-checkbox{display:none!important}.jstree-default.jstree-checkbox-no-clicked .jstree-clicked{background:0 0;box-shadow:none}.jstree-default.jstree-checkbox-no-clicked .jstree-clicked.jstree-hovered{background:#e7f4f9}.jstree-default.jstree-checkbox-no-clicked>.jstree-wholerow-ul .jstree-wholerow-clicked{background:0 0}.jstree-default.jstree-checkbox-no-clicked>.jstree-wholerow-ul .jstree-wholerow-clicked.jstree-wholerow-hovered{background:#e7f4f9}#jstree-dnd.jstree-default .jstree-ok,#jstree-dnd.jstree-default .jstree-er{background-image:url(${_cdn}/assets/images/common-images/px.png);background-repeat:no-repeat;background-color:transparent}#jstree-dnd.jstree-default i{background:0 0;width:16px;height:16px}#jstree-dnd.jstree-default .jstree-ok{background-position:-9px -71px}#jstree-dnd.jstree-default .jstree-er{background-position:-39px -71px}.jstree-default>.jstree-striped{background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAkCAMAAAB/qqA+AAAABlBMVEUAAAAAAAClZ7nPAAAAAnRSTlMNAMM9s3UAAAAXSURBVHjajcEBAQAAAIKg/H/aCQZ70AUBjAATb6YPDgAAAABJRU5ErkJggg==) left top repeat}.jstree-default>.jstree-wholerow-ul .jstree-hovered,.jstree-default>.jstree-wholerow-ul .jstree-clicked{background:0 0;box-shadow:none;border-radius:0}.jstree-default .jstree-wholerow{-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}.jstree-default .jstree-wholerow-hovered{background:#e7f4f9}.jstree-default .jstree-wholerow-clicked{background:#beebff;background:-moz-linear-gradient(top,#beebff 0,#a8e4ff 100%);background:-webkit-gradient(linear,left top,left bottom,color-stop(0,#beebff),color-stop(100%,#a8e4ff));background:-webkit-linear-gradient(top,#beebff 0,#a8e4ff 100%);background:-o-linear-gradient(top,#beebff 0,#a8e4ff 100%);background:-ms-linear-gradient(top,#beebff 0,#a8e4ff 100%);background:linear-gradient(to bottom,#beebff 0,#a8e4ff 100%)}.jstree-default .jstree-node{min-height:24px;line-height:24px;margin-left:24px;min-width:24px}.jstree-default .jstree-anchor{line-height:24px;height:24px}.jstree-default .jstree-icon{width:24px;height:24px;line-height:24px}.jstree-default .jstree-icon:empty{width:24px;height:24px;line-height:24px}.jstree-default.jstree-rtl .jstree-node{margin-right:24px}.jstree-default .jstree-wholerow{height:24px}.jstree-default .jstree-node,.jstree-default .jstree-icon{background-image:url(${_cdn}/assets/images/common-images/px.png)}.jstree-default .jstree-node{background-position:-292px -4px;background-repeat:repeat-y}.jstree-default .jstree-last{background:0 0}.jstree-default .jstree-open>.jstree-ocl{background-position:-1${pageContext.request.contextPath}/resources/images/px -4px}.jstree-default .jstree-closed>.jstree-ocl{background-position:-100px -4px}.jstree-default .jstree-leaf>.jstree-ocl{background-position:-68px -4px}.jstree-default .jstree-themeicon{background-position:-265px -35px}.jstree-default>.jstree-no-dots .jstree-node,.jstree-default>.jstree-no-dots .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default>.jstree-no-dots .jstree-open>.jstree-ocl{background-position:-36px -4px}.jstree-default>.jstree-no-dots .jstree-closed>.jstree-ocl{background-position:-4px -4px}.jstree-default .jstree-disabled{background:0 0}.jstree-default .jstree-disabled.jstree-hovered{background:0 0}.jstree-default .jstree-disabled.jstree-clicked{background:#efefef}.jstree-default .jstree-checkbox{background-position:-164px -4px}.jstree-default .jstree-checkbox:hover{background-position:-164px -36px}.jstree-default.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,.jstree-default .jstree-checked>.jstree-checkbox{background-position:-228px -4px}.jstree-default.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,.jstree-default .jstree-checked>.jstree-checkbox:hover{background-position:-228px -36px}.jstree-default .jstree-anchor>.jstree-undetermined{background-position:-196px -4px}.jstree-default .jstree-anchor>.jstree-undetermined:hover{background-position:-196px -36px}.jstree-default>.jstree-striped{background-size:auto 48px}.jstree-default.jstree-rtl .jstree-node{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==);background-position:100% 1px;background-repeat:repeat-y}.jstree-default.jstree-rtl .jstree-last{background:0 0}.jstree-default.jstree-rtl .jstree-open>.jstree-ocl{background-position:-1${pageContext.request.contextPath}/resources/images/px -36px}.jstree-default.jstree-rtl .jstree-closed>.jstree-ocl{background-position:-100px -36px}.jstree-default.jstree-rtl .jstree-leaf>.jstree-ocl{background-position:-68px -36px}.jstree-default.jstree-rtl>.jstree-no-dots .jstree-node,.jstree-default.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl{background-position:-36px -36px}.jstree-default.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl{background-position:-4px -36px}.jstree-default .jstree-themeicon-custom{background-color:transparent;background-image:none;background-position:0 0}.jstree-default>.jstree-container-ul .jstree-loading>.jstree-ocl{background:url(throbber.gif) center center no-repeat}.jstree-default .jstree-file{background:url(${pageContext.request.contextPath}/resources/images/px.png) -100px -68px no-repeat}.jstree-default .jstree-folder{background:url(${pageContext.request.contextPath}/resources/images/px.png) -260px -4px no-repeat}.jstree-default.jstree-rtl .jstree-node{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==)}.jstree-default.jstree-rtl .jstree-last{background:0 0}.jstree-default-small .jstree-node{min-height:18px;line-height:18px;margin-left:18px;min-width:18px}.jstree-default-small .jstree-anchor{line-height:18px;height:18px}.jstree-default-small .jstree-icon{width:18px;height:18px;line-height:18px}.jstree-default-small .jstree-icon:empty{width:18px;height:18px;line-height:18px}.jstree-default-small.jstree-rtl .jstree-node{margin-right:18px}.jstree-default-small .jstree-wholerow{height:18px}.jstree-default-small .jstree-node,.jstree-default-small .jstree-icon{background-image:url(${pageContext.request.contextPath}/resources/images/px.png)}.jstree-default-small .jstree-node{background-position:-295px -7px;background-repeat:repeat-y}.jstree-default-small .jstree-last{background:0 0}.jstree-default-small .jstree-open>.jstree-ocl{background-position:-135px -7px}.jstree-default-small .jstree-closed>.jstree-ocl{background-position:-103px -7px}.jstree-default-small .jstree-leaf>.jstree-ocl{background-position:-71px -7px}.jstree-default-small .jstree-themeicon{background-position:-263px -7px}.jstree-default-small>.jstree-no-dots .jstree-node,.jstree-default-small>.jstree-no-dots .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default-small>.jstree-no-dots .jstree-open>.jstree-ocl{background-position:-39px -7px}.jstree-default-small>.jstree-no-dots .jstree-closed>.jstree-ocl{background-position:-7px -7px}.jstree-default-small .jstree-disabled{background:0 0}.jstree-default-small .jstree-disabled.jstree-hovered{background:0 0}.jstree-default-small .jstree-disabled.jstree-clicked{background:#efefef}.jstree-default-small .jstree-checkbox{background-position:-167px -7px}.jstree-default-small .jstree-checkbox:hover{background-position:-167px -39px}.jstree-default-small.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,.jstree-default-small .jstree-checked>.jstree-checkbox{background-position:-231px -7px}.jstree-default-small.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,.jstree-default-small .jstree-checked>.jstree-checkbox:hover{background-position:-231px -39px}.jstree-default-small .jstree-anchor>.jstree-undetermined{background-position:-199px -7px}.jstree-default-small .jstree-anchor>.jstree-undetermined:hover{background-position:-199px -39px}.jstree-default-small>.jstree-striped{background-size:auto 36px}.jstree-default-small.jstree-rtl .jstree-node{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==);background-position:100% 1px;background-repeat:repeat-y}.jstree-default-small.jstree-rtl .jstree-last{background:0 0}.jstree-default-small.jstree-rtl .jstree-open>.jstree-ocl{background-position:-135px -39px}.jstree-default-small.jstree-rtl .jstree-closed>.jstree-ocl{background-position:-103px -39px}.jstree-default-small.jstree-rtl .jstree-leaf>.jstree-ocl{background-position:-71px -39px}.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-node,.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl{background-position:-39px -39px}.jstree-default-small.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl{background-position:-7px -39px}.jstree-default-small .jstree-themeicon-custom{background-color:transparent;background-image:none;background-position:0 0}.jstree-default-small>.jstree-container-ul .jstree-loading>.jstree-ocl{background:url(throbber.gif) center center no-repeat}.jstree-default-small .jstree-file{background:url(${pageContext.request.contextPath}/resources/images/px.png) -103px -71px no-repeat}.jstree-default-small .jstree-folder{background:url(${pageContext.request.contextPath}/resources/images/px.png) -263px -7px no-repeat}.jstree-default-small.jstree-rtl .jstree-node{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAACAQMAAABv1h6PAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMHBgAAiABBI4gz9AAAAABJRU5ErkJggg==)}.jstree-default-small.jstree-rtl .jstree-last{background:0 0}.jstree-default-large .jstree-node{min-height:${pageContext.request.contextPath}/resources/images/px;line-height:${pageContext.request.contextPath}/resources/images/px;margin-left:${pageContext.request.contextPath}/resources/images/px;min-width:${pageContext.request.contextPath}/resources/images/px}.jstree-default-large .jstree-anchor{line-height:${pageContext.request.contextPath}/resources/images/px;height:${pageContext.request.contextPath}/resources/images/px}.jstree-default-large .jstree-icon{width:${pageContext.request.contextPath}/resources/images/px;height:${pageContext.request.contextPath}/resources/images/px;line-height:${pageContext.request.contextPath}/resources/images/px}.jstree-default-large .jstree-icon:empty{width:${pageContext.request.contextPath}/resources/images/px;height:${pageContext.request.contextPath}/resources/images/px;line-height:${pageContext.request.contextPath}/resources/images/px}.jstree-default-large.jstree-rtl .jstree-node{margin-right:${pageContext.request.contextPath}/resources/images/px}.jstree-default-large .jstree-wholerow{height:${pageContext.request.contextPath}/resources/images/px}.jstree-default-large .jstree-node,.jstree-default-large .jstree-icon{background-image:url(${pageContext.request.contextPath}/resources/images/px.png)}.jstree-default-large .jstree-node{background-position:-288px 0;background-repeat:repeat-y}.jstree-default-large .jstree-last{background:0 0}.jstree-default-large .jstree-open>.jstree-ocl{background-position:-128px 0}.jstree-default-large .jstree-closed>.jstree-ocl{background-position:-96px 0}.jstree-default-large .jstree-leaf>.jstree-ocl{background-position:-64px 0}.jstree-default-large .jstree-themeicon{background-position:-256px 0}.jstree-default-large>.jstree-no-dots .jstree-node,.jstree-default-large>.jstree-no-dots .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default-large>.jstree-no-dots .jstree-open>.jstree-ocl{background-position:-${pageContext.request.contextPath}/resources/images/px 0}.jstree-default-large>.jstree-no-dots .jstree-closed>.jstree-ocl{background-position:0 0}.jstree-default-large .jstree-disabled{background:0 0}.jstree-default-large .jstree-disabled.jstree-hovered{background:0 0}.jstree-default-large .jstree-disabled.jstree-clicked{background:#efefef}.jstree-default-large .jstree-checkbox{background-position:-160px 0}.jstree-default-large .jstree-checkbox:hover{background-position:-160px -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,.jstree-default-large .jstree-checked>.jstree-checkbox{background-position:-224px 0}.jstree-default-large.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,.jstree-default-large .jstree-checked>.jstree-checkbox:hover{background-position:-224px -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large .jstree-anchor>.jstree-undetermined{background-position:-192px 0}.jstree-default-large .jstree-anchor>.jstree-undetermined:hover{background-position:-192px -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large>.jstree-striped{background-size:auto 64px}.jstree-default-large.jstree-rtl .jstree-node{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAACAQMAAAB49I5GAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjAAMOBgAAGAAJMwQHdQAAAABJRU5ErkJggg==);background-position:100% 1px;background-repeat:repeat-y}.jstree-default-large.jstree-rtl .jstree-last{background:0 0}.jstree-default-large.jstree-rtl .jstree-open>.jstree-ocl{background-position:-128px -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large.jstree-rtl .jstree-closed>.jstree-ocl{background-position:-96px -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large.jstree-rtl .jstree-leaf>.jstree-ocl{background-position:-64px -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-node,.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-open>.jstree-ocl{background-position:-${pageContext.request.contextPath}/resources/images/px -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large.jstree-rtl>.jstree-no-dots .jstree-closed>.jstree-ocl{background-position:0 -${pageContext.request.contextPath}/resources/images/px}.jstree-default-large .jstree-themeicon-custom{background-color:transparent;background-image:none;background-position:0 0}.jstree-default-large>.jstree-container-ul .jstree-loading>.jstree-ocl{background:url(throbber.gif) center center no-repeat}.jstree-default-large .jstree-file{background:url(${pageContext.request.contextPath}/resources/images/px.png) -96px -64px no-repeat}.jstree-default-large .jstree-folder{background:url(${pageContext.request.contextPath}/resources/images/px.png) -256px 0 no-repeat}.jstree-default-large.jstree-rtl .jstree-node{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAACAQMAAAAD0EyKAAAABlBMVEUAAAAdHRvEkCwcAAAAAXRSTlMAQObYZgAAAAxJREFUCNdjgIIGBgABCgCBvVLXcAAAAABJRU5ErkJggg==)}.jstree-default-large.jstree-rtl .jstree-last{background:0 0}@media (max-width:768px){#jstree-dnd.jstree-dnd-responsive{line-height:40px;font-weight:700;font-size:1.1em;text-shadow:1px 1px #fff}#jstree-dnd.jstree-dnd-responsive>i{background:0 0;width:40px;height:40px}#jstree-dnd.jstree-dnd-responsive>.jstree-ok{background-image:url(${pageContext.request.contextPath}/resources/images/40px.png);background-position:0 -200px;background-size:120px 240px}#jstree-dnd.jstree-dnd-responsive>.jstree-er{background-image:url(${pageContext.request.contextPath}/resources/images/40px.png);background-position:-40px -200px;background-size:120px 240px}#jstree-marker.jstree-dnd-responsive{border-left-width:10px;border-top-width:10px;border-bottom-width:10px;margin-top:-10px}}@media (max-width:768px){.jstree-default-responsive .jstree-icon{background-image:url(${pageContext.request.contextPath}/resources/images/40px.png)}.jstree-default-responsive .jstree-node,.jstree-default-responsive .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default-responsive .jstree-node{min-height:40px;line-height:40px;margin-left:40px;min-width:40px;white-space:nowrap}.jstree-default-responsive .jstree-anchor{line-height:40px;height:40px}.jstree-default-responsive .jstree-icon,.jstree-default-responsive .jstree-icon:empty{width:40px;height:40px;line-height:40px}.jstree-default-responsive>.jstree-container-ul>.jstree-node{margin-left:0}.jstree-default-responsive.jstree-rtl .jstree-node{margin-left:0;margin-right:40px}.jstree-default-responsive.jstree-rtl .jstree-container-ul>.jstree-node{margin-right:0}.jstree-default-responsive .jstree-ocl,.jstree-default-responsive .jstree-themeicon,.jstree-default-responsive .jstree-checkbox{background-size:120px 240px}.jstree-default-responsive .jstree-leaf>.jstree-ocl{background:0 0}.jstree-default-responsive .jstree-open>.jstree-ocl{background-position:0 0!important}.jstree-default-responsive .jstree-closed>.jstree-ocl{background-position:0 -40px!important}.jstree-default-responsive.jstree-rtl .jstree-closed>.jstree-ocl{background-position:-40px 0!important}.jstree-default-responsive .jstree-themeicon{background-position:-40px -40px}.jstree-default-responsive .jstree-checkbox,.jstree-default-responsive .jstree-checkbox:hover{background-position:-40px -80px}.jstree-default-responsive.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox,.jstree-default-responsive.jstree-checkbox-selection .jstree-clicked>.jstree-checkbox:hover,.jstree-default-responsive .jstree-checked>.jstree-checkbox,.jstree-default-responsive .jstree-checked>.jstree-checkbox:hover{background-position:0 -80px}.jstree-default-responsive .jstree-anchor>.jstree-undetermined,.jstree-default-responsive .jstree-anchor>.jstree-undetermined:hover{background-position:0 -120px}.jstree-default-responsive .jstree-anchor{font-weight:700;font-size:1.1em;text-shadow:1px 1px #fff}.jstree-default-responsive>.jstree-striped{background:0 0}.jstree-default-responsive .jstree-wholerow{border-top:1px solid rgba(255,255,255,.7);border-bottom:1px solid rgba(64,64,64,.2);background:#ebebeb;height:40px}.jstree-default-responsive .jstree-wholerow-hovered{background:#e7f4f9}.jstree-default-responsive .jstree-wholerow-clicked{background:#beebff}.jstree-default-responsive .jstree-children .jstree-last>.jstree-wholerow{box-shadow:inset 0 -6px 3px -5px #666}.jstree-default-responsive .jstree-children .jstree-open>.jstree-wholerow{box-shadow:inset 0 6px 3px -5px #666;border-top:0}.jstree-default-responsive .jstree-children .jstree-open+.jstree-open{box-shadow:none}.jstree-default-responsive .jstree-node,.jstree-default-responsive .jstree-icon,.jstree-default-responsive .jstree-node>.jstree-ocl,.jstree-default-responsive .jstree-themeicon,.jstree-default-responsive .jstree-checkbox{background-image:url(${_cdn}/assets/images/common-images/40px.png);background-size:120px 240px}.jstree-default-responsive .jstree-node{background-position:-80px 0;background-repeat:repeat-y}.jstree-default-responsive .jstree-last{background:0 0}.jstree-default-responsive .jstree-leaf>.jstree-ocl{background-position:-40px -120px}.jstree-default-responsive .jstree-last>.jstree-ocl{background-position:-40px -160px}.jstree-default-responsive .jstree-themeicon-custom{background-color:transparent;background-image:none;background-position:0 0}.jstree-default-responsive .jstree-file{background:url(${_cdn}/assets/images/common-images/40px.png) 0 -160px no-repeat;background-size:120px 240px}.jstree-default-responsive .jstree-folder{background:url(${_cdn}/assets/images/common-images/40px.png) -40px -40px no-repeat;background-size:120px 240px}}.jstree-default>.jstree-container-ul>.jstree-node{margin-left:0;margin-right:0}.jstree-default>.jstree-container-ul>.jstree-node { margin-left:0; margin-right:0 }.jstree .icn { width: 20px; height: 20px; display: inline-block; background: url(${_cdn}/assets/images/common-images/jstree.png) no-repeat 0 0 transparent }.jstree .icn.plus { background-position: -15px -20px }.jstree .icn.area { background-position: -2px -3px }.jstree .icn.user { background-position: -25px -3px }.jstree .icn.star { background-position: -50px -3px }
.jstree-default .jstree-open > .jstree-ocl { background: url(${_cdn}/assets/images/common-images/jstree.png) no-repeat -3px -25px transparent }.jstree-default .jstree-closed > .jstree-ocl { background: url(${_cdn}/assets/images/common-images/jstree.png) no-repeat -28px -25px transparent }.jstree-default .jstree-clicked { background: none; border-radius: 0; box-shadow: none; color: #AE2760; font-family: "verdana", Helvetica, Arial, sans-serif; font-size: 12px; font-weight:normal; text-shadow:none; }ul.jstree-container-ul { /* background: #8F8F8F; overflow: hidden*/ }li.jstree-open > ul { /*  background: #DADADA;*/ display: block; }li.jstree-open > ul li.jstree-open > ul { /*background: #F2F2F2;*/ position: relative; left: -24px; padding-left: 24px; width: 100%; }/*Hierarchy box*/
/*Hierarchy box*/
.normal-fonts-location{
font-weight: normal;
}
</style>

<script>
$(document).ready(function(){
	/* code to read add from xml 
	*/
	var isPartnerChanged= "${isPartnerChanged}";
	var nodeID = '${nodeId}';	
	if(isPartnerChanged=="true"){
		$('.chang_pass').addClass("inactiveLink");
		}
	if(nodeID > 0)
		{
		$('.myaccount_btn').addClass("inactiveLink");
		}	
	// Code for role based security
	var partnerSetupLinks = "${partnerSetupLinks}";
	var pieces = partnerSetupLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
			if(pieces[i].indexOf("save")>-1)
			{
				if(document.forms[0] != undefined){
					document.forms[0].action = "";
				}
			}
		}
	}

	var roleBaseLinks = "${roleBaseLinks}";
	var links = roleBaseLinks.split(",");
	if(links != ""){
		for(var i=0;i<links.length;i++){
			$("."+links[i]).attr("href","#");
			$("."+links[i]).addClass("inactiveLink");
			if(links[i].indexOf("save")>-1)
			{
				if(document.forms[0] != undefined){
				document.forms[0].action = "";
				}
			}
		}
	}
	// end code of role based security
	
	var SectionName;
	var ImagePathForAdInDc1;
	var Url;
	var buIdInSession = ${userSession.buId};
	$.ajax({
        type: "GET",
        url : '${pageContext.request.contextPath}/resources/xml/BuConfuguration.xml',
		dataType: "xml",
        success: function(xml) {
            var flag=0;
        	$(xml).find('Bu').each(function(i,obj){
        		var buId= $(this).attr('Id');
        		  $(obj).find('Section').each(function(i,obj){
        			  SectionName = $(this).attr('Name');
        			  if(buId==buIdInSession){
            			    if(SectionName=='Header_add')
	        				  {
		        				  $(obj).find('Configuration').each(function(i,obj){ 
		        					  ImagePathForAdInDc1 =$(this).attr('ImagePath');
		        					  if(i==0){/* if image not present */
		        						if(ImagePathForAdInDc1==null || ImagePathForAdInDc1==""){
		        							 $(".header_add.add1").css('display','none');	
			        						}
		        						else{
		        						ImagePathForAdInDc1 = '${pageContext.request.contextPath}/'+ImagePathForAdInDc1;	
			        			    	$(".header_add.add1 img").attr("src",ImagePathForAdInDc1);
		        						}
		        					  }
		        					  else if(i==1){/* if image not present */
		        						if(ImagePathForAdInDc1==null || ImagePathForAdInDc1==""){
			        						$(".header_add.add2").css('display','none');	
				        				}
		        						else{
		        						ImagePathForAdInDc1 = '${pageContext.request.contextPath}/'+ImagePathForAdInDc1;
		        						$(".header_add.add2 img").attr("src",ImagePathForAdInDc1);
		        						}
		        					  }
			        				
			        			  });   
		        			     
	        				  }
	        				 flag=1;  
        			  }
        			  if(flag==1)
            		{
                  		return false;
            		}
        			  else
            		 {
                 		  $(".header_add.add2").css('display','none');
        				  $(".header_add.add1").css('display','none');
            		 }   
        						 					       			  
        		  });
        		
        		
        	});
        }	
	 });
});
</script>

<!--Hierarchy Submenu Starts Here -->

<script> $(document).ready(function(){
	createTree1();
	
 $(".hierarchy-submenu-btn").click(function(){
     $(".hierarchy-submenu-bx").fadeToggle("slow");
 });
}) ;
 $(document).ready(function (e) {

     $(document).click(function () {
		
   if($(".hierarchy-submenu-bx").css("display") == "block") {
           $(".hierarchy-submenu-bx").fadeOut("slow");
		 
         }
    
      });
     $(".hierarchy-submenu-bx,.hierarchy-submenu-btn").click(function (e) {
         e.stopPropagation();
 });
 });
</script>

<!--Hierarchy Submenu Ends Here -->



<script>
var option="";
var childrenArray = new Array();
var treeArray = new Array();
var myObj = new Object();
var currentArryToIterate = new Array();
var currentObj=new Object();
var locationId=0;
function customMenu1(node) {

//     var tree = $("#jstree1").jstree(true);

    if (node.type == 'root') {
        var items = {
            addLocationItem: {
                label: "Add Location",
                action: function(obj) {
                    //alert("Edit User");
                    //tree.delete_node(node);
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
					});
					
                },
                icon: "fa fa-trash-o"

            },
            editItem: {
                label: "Edit Location",
                action: function(obj) {
                    //alert("Edit");
                    //tree.delete_node(node);
                	$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Edit Location');
					 	$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						//$('#locationId').val(locationId);
					});
                },
                icon: "fa fa-trash-o"

            },
			
            addUserItem: {
                label: "Add User",
                action: function(obj) {
                    //alert("Edit User");
                    //tree.delete_node(node);
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Add User');
						$('#manageHeirarchySavePartnerForm #partyId').val(0);
					});
                },
                icon: "fa fa-trash-o"

            }
			
        };
    } else if (node.type == 'area') {
        var items = {
			addLocationItem: {
                label: "Add Location",
                action: function(obj) {
                 //  alert("Add Location");
                    //tree.delete_node(node);
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
					});
                },
                icon: "fa fa-trash-o"

            },

            editItem: {
                label: "Edit Location",
                action: function(obj) {
                  //  alert("Edit Location");
                    //tree.delete_node(node);
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Edit Location');
						$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						//$('#locationId').val(locationId);
					});
                },
                icon: "fa fa-trash-o"

            },
              deleteItem: {
                label: "Delete Location",
                action: function(obj) {
                  //  alert("Add User");
                    //tree.delete_node(node);
					//$('#pnl-mhaddedit .mh-action').hide(function() {
					//	$('#pnl-mhaddedit #mh-sec-deletelocation').show();
				//	});
			    },
                icon: "fa fa-trash-o"

            },
            addUserItem: {
                label: "Add User",
                action: function(obj) {
                  //  alert("Add User");
                    //tree.delete_node(node);
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Add User');
						$('#manageHeirarchySavePartnerForm #partyId').val(0);
					});
                },
                icon: "fa fa-trash-o"

            }
        };
    } else if (node.type == 'user') {
        var items = {
            editUserItem: {
                label: "Edit User",
                action: function(obj) {
                 //   alert("Edit User");
                    //tree.delete_node(node);
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Edit User');
						getEditPartner($('#manageHeirarchySavePartnerForm #partyId').val());
					});
                },
                icon: "fa fa-trash-o"

            },                        deleteItem: {
                label: "Delete User",
                action: function(obj) {
                   // alert("Add User");
                    //tree.delete_node(node);
				//	$('#pnl-mhaddedit .mh-action').hide(function() {
				//		$('#pnl-mhaddedit #mh-advisor-delete-user').show();
				//	});
                },
                icon: "fa fa-trash-o"

            }

        };
    }

    return items;
}




function createTree1(){
// 	alert(result)
// 	result = JSON.parse(result);

	//return;
<%-- 	var nodeList=<%=locationData%>; --%>
<%-- 	var userList=<%=partnerHeirarchyData%>; --%>

	var nodeList='${sessionScope.lstLocationData}';
	var userList='${sessionScope.lstPartnerHeirarchyData}';
	try{
	nodeList=JSON.parse(nodeList);
	userList=JSON.parse(userList);
	}catch(e){
		return;
	}
	
	childrenArray= new Array();
	myObj = new Object();
	var cntr=0;
	$(nodeList).each(function(i,obj) {
		//alert(obj.locationId);
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		if(cntr==0){
			typeName='root';
			if('${sessionScope.nodeId}'==locationId)
				myObj.text='<b  onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			else
				myObj.text='<b class="normal-fonts-location" onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			myObj.state='{opened": "true","selected":"true"}';
			myObj.type=typeName;
			myObj.nodeId=locationId;
			myObj.level=level;
			myObj.children=childrenArray;
			currentArryToIterate=childrenArray;
			createChildNodes1(locationId,level,nodeList);
			createChildUsers1(locationId,level,userList);
			cntr+=1;
		}else{
			createChildNodes1(locationId,level,nodeList);
			createChildUsers1(locationId,level,userList);
		}
	});
<%-- 	$.getScript('<%=request.getContextPath()%>/js/jstree/jstree.min.js', function () { --%>
        // When it's done loading, create your jsTree stuff.
//         $('#jstree1').jstree();
    try{
	
	$('#jstree1').jstree({
//         "contextmenu": {
//             "select_node": true,
//             "show_at_node": false
//             //"items": customMenu1
//         },
        "types": {
            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
            "root": {"icon": "", "valid_children": ["area"]},
            "default": {"valid_children": ["default", "file"]},
            "user": {"icon": "icn user", "valid_children": []},
            "area": {"icon": "icn area", "valid_children": []}
        },
         "plugins": ["contextmenu", "types"],
        'core': {
            'data': [
				myObj
            ]
        }

    });
    }catch(e){
        
    	try{
    		$('#jstree1').jstree({
    	        "types": {
    	            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
    	            "root": {"icon": "", "valid_children": ["area"]},
    	            "default": {"valid_children": ["default", "file"]},
    	            "user": {"icon": "icn user", "valid_children": []},
    	            "area": {"icon": "icn area", "valid_children": []}
    	        },
    	        'core': {
    	            'data': [
    					myObj
    	            ]
    	        }

    	    });
    	}catch(e){
    		$jq_1_9_2('#jstree1').jstree({
    	        "types": {
    	            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
    	            "root": {"icon": "", "valid_children": ["area"]},
    	            "default": {"valid_children": ["default", "file"]},
    	            "user": {"icon": "icn user", "valid_children": []},
    	            "area": {"icon": "icn area", "valid_children": []}
    	        },
    	        'core': {
    	            'data': [
    					myObj
    	            ]
    	        }

    	    });
    	}
    }
    $("#jstree1").on('open_node.jstree', function(e, data) {
        $('li.jstree-open > ul li.jstree-open > ul').css({
            'width': ($(this).width() + 0) + 'px'
        });
    });
    
	//});
}

function locationClick1(nodeId,level,locationName,locDescription){
	//alert('here')
	updateNodeUserInSession(nodeId,0);
}
function userClick1(nodeId,partyId){
	//alert('there')
	updateNodeUserInSession(0,partyId);
}

function updateNodeUserInSession(nodeId,partyId){
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/hierarchy/updateNode?nodeId="+nodeId+"&partyId="+partyId,
		success : function(result) {
			//location.reload();
			if(nodeId==0){
				$("#successDialog").html('User selected');
				$("#successDialog").dialog( "open" );
				window.location.reload();
				}
			else{
				$("#successDialog").html('Node selected');
				$("#successDialog").dialog( "open" );
				window.location.reload();	
			}
		}
	});
}
function createChildNodes1(nodeId,nodeLevel,nodeList){
	$(nodeList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		var childArray=new Array();
		getChildArray3(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			if('${sessionScope.nodeId}'==locationId)
				obj.text='<b  onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			else
				obj.text='<b class="normal-fonts-location" onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray1(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray1(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}
function createChildUsers1(nodeId,nodeLevel,userList){
	$(userList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
// 		var parentNodeId=obj.parentNodeId;
		var parentNodeId=locationId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var name=obj.userName;
		var partyId=obj.partyId;
		var headOfNode=obj.headOfNode;
		var typeName='user';
		var childArray=new Array();
		getChildArray3(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			if('${sessionScope.HPartyId}'==partyId && headOfNode==true)
				obj.text='<span class="icn star"></span><b  onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
			else if('${sessionScope.HPartyId}'==partyId && headOfNode==false)
				obj.text='<b  onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
			else if(headOfNode==true)
				obj.text='<span class="icn star"></span><b class="normal-fonts-location" onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
			else
				obj.text='<b class="normal-fonts-location" onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
// 			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray1(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray1(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

function getChildArray3(nodeId,nodeLevel){
// 	if(currentArryToIterate=='' || currentArryToIterate==undefined){
// 		//alert('in if')
// 		currentArryToIterate=myObj['children'];
// 	}
// 		var obj=currentArryToIterate[0];
// 		if(obj==undefined || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
// 			currentObj=myObj;
// 			return;
// 			}
// 		var level=obj['level'];
// 		var nodeId1=obj['nodeId'];
// 		if(level==nodeLevel && nodeId1==nodeId){
// 			currentArryToIterate=obj['children'];
// 			currentObj=obj;
// 		}else{
// 			currentArryToIterate = jQuery.grep(currentArryToIterate, function( a ) {
// 	 			  return a !== obj;
// 	 			});
			
// 			setTimeout(function() {
// 				getChildArray3(nodeId,nodeLevel);
// 			}, 3000);
// 		}
	//alert(myObj['level']);
	currentArryToIterate=myObj['children'];
	if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
		currentObj=myObj;
			return;
		}
		var i=0;
		while(i<currentArryToIterate.length){
			var obj=currentArryToIterate[i];
			var level=obj['level'];
			var nodeId1=obj['nodeId'];
			if(level==nodeLevel && nodeId1==nodeId){
				currentArryToIterate=obj['children'];
	 			currentObj=obj;
				return;
			}else{
				var isToReturn=getChildArray32(nodeId,nodeLevel,obj);
				if(isToReturn==true){
					return;
				}
			}
			i+=1;
		}
}

function getChildArray32(nodeId,nodeLevel,newObj){
	var currentArryToIterate1=new Array();
	currentArryToIterate1=newObj['children'];
	if(currentArryToIterate1.length==0 || (newObj['level']==nodeLevel && newObj['nodeId']==nodeId)){
		//currentObj=newObj;
			return false;
		}
		var i=0;
		while(i<currentArryToIterate1.length){
			var obj=currentArryToIterate1[i];
			var level=obj['level'];
			var nodeId1=obj['nodeId'];
			if(level==nodeLevel && nodeId1==nodeId){
				currentArryToIterate=obj['children'];
	 			currentObj=obj;
				return true;
			}else{
				var isToReturn=getChildArray32(nodeId,nodeLevel,obj);
				if(isToReturn==true){
					return;
				}
			}
			i+=1;
		}
}
function setChildArray1(nodeId,nodeLevel,childArray){
	currentArryToIterate=myObj['children'];
	if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
		myObj.children=childArray;
		return;
		}
	
// 	alert(myObj.level==nodeLevel && myObj.nodeId==nodeId)
	var i=0;
	while(i<currentArryToIterate.length){
	var obj=currentArryToIterate[i];
	//alert(obj.nodeId)
	var level=obj['level'];
	var nodeId1=obj['nodeId'];
	var level2=currentObj['level'];
	var nodeId2=currentObj['nodeId'];
	//alert(level+"-----------"+nodeId1+"--------"+level2+"-----------"+nodeId2)
	if(level==level2 && nodeId1==nodeId2){
		obj.children=childArray;
		currentArryToIterate[i]=obj;
		//alert(obj.locationName)
// 		currentArryToIterate = $.map(currentArryToIterate, function (obj, i) {
// 		    return {
// 		        regex: new RegExp('\\b' + i + '\\b', 'g'),
// 		        value: obj
// 		    };
// 		});
		myObj.children=currentArryToIterate;
		return;
	}else{
// 		currentArryToIterate = jQuery.grep(currentArryToIterate, function( a ) {
//  			  return a !== obj;
//  			});
		
// 		setTimeout(function() {
// 			setChildArray1(nodeId,nodeLevel,childArray)
// 		}, 3000);
	}
	i+=1;
	}
	}

</script>
<jsp:include page="../layout/common_header.jsp"></jsp:include>
<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<!-- <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>
 -->
				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class=""><!--navbar-brand-->
                    
                    	  <a href="#" class="header_add add2"><img src="" /></a><a href="#" class="header_add add1"><img src="" /></a>
                                 <div class="fl" id="logo" style="max-height:61px; max-width:140px"><a href="${pageContext.request.contextPath}/partner/dashboard?flag=0">
							<%
                            String photoPath = null;
                            UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
                            if(userSession != null){
                                photoPath = userSession.getLogo();
                            }
                            %>
            
                <%-- <img src="<%=FiinfraUtility.getImagePath(request, photoPath, "/resources/images/temp_logo.png") %>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a> --%>
            <%-- <c:choose>
               <c:when test="${not empty photoPath}">
                    <img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
               </c:when>
               <c:otherwise>
                    <img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>	
               </c:otherwise>
            </c:choose> --%>
            <%-- <% if (photoPath==null || photoPath.isEmpty()) { %> 
                <img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>
           <% } else { %>
                <img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
            <% } %> --%>
            
            
							<%
                                String x = "D:/Ffreedom-DI/images/"+photoPath;
                                File file = new File(x);
                            %>
                            <%-- <c:out value="<%=x %>"></c:out> --%>
                            <% if (file.exists() && !file.isDirectory()) { %>
                            <img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="height:100%;min-height:40px;max-height:61px" alt=""/></a>
                            <% } else { %>
                            <img src="${_cdn}/assets/images/common-images/temp_logo.png" alt="" /></a>
                            <% } %>
                          </div>
                    
						<!--<small>
							<i class="fa fa-leaf"></i>
							Ace Admin
						</small>-->
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div style="margin-top: 6px;" class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">						

						<li class="magento">
							<a href="${pageContext.request.contextPath}/alert/showAlerts" class="hit_area">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
                                <span class="count badge badge-important">${alerts}</span>
								<!--<span class="badge badge-important">8</span>-->
							</a>

							<!--<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-exclamation-triangle"></i>
									8 Notifications
								</li>

								<li class="dropdown-content ace-scroll" style="position: relative;"><div class="scroll-track" style="display: none;"><div class="scroll-bar"></div></div><div class="scroll-content" style="max-height: 200px;">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														New Comments
													</span>
													<span class="pull-right badge badge-info">+12</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<i class="btn btn-xs btn-primary fa fa-user"></i>
												Bob just signed up as an editor ...
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
														New Orders
													</span>
													<span class="pull-right badge badge-success">+8</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
														Followers
													</span>
													<span class="pull-right badge badge-info">+11</span>
												</div>
											</a>
										</li>
									</ul>
								</div></li>

								<li class="dropdown-footer">
									<a href="#">
										See all notifications
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>-->
						</li>

						<li class="magento">
							<a  href="${pageContext.request.contextPath}/query" class="hit_area">
								<i class="ace-icon fa fa-question icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<!--<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-envelope-o"></i>
									5 Messages
								</li>

								<li class="dropdown-content ace-scroll" style="position: relative;"><div class="scroll-track" style="display: none;"><div class="scroll-bar"></div></div><div class="scroll-content" style="max-height: 200px;">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#" class="clearfix">
												<img src="../assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar">
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Alex:</span>
														Ciao sociis natoque penatibus et auctor ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>a moment ago</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="../assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar">
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Susan:</span>
														Vestibulum id ligula porta felis euismod ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 minutes ago</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="../assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar">
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Bob:</span>
														Nullam quis risus eget urna mollis ornare ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>3:15 pm</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="../assets/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar">
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Kate:</span>
														Ciao sociis natoque eget urna mollis ornare ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>1:33 pm</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="../assets/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar">
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Fred:</span>
														Vestibulum id penatibus et auctor  ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>10:09 am</span>
													</span>
												</span>
											</a>
										</li>
									</ul>
								</div></li>

								<li class="dropdown-footer">
									<a href="inbox.html">
										See all messages
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>-->
						</li>

						<!-- #section:basics/navbar.user_menu -->
                        
                        
        <li class="light-magento"> <a data-toggle="dropdown" href="#" class="dropdown-toggle"> <i class="ace-icon fa fa-user"></i> <span class="user-info"> <small>Welcome,</small> ${sessionScope.userSession.name} </span> <i class="ace-icon fa fa-caret-down"></i> </a>
          <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close"> 
          
                                 
           <li>
           	<div> 
            	<a  class="myaccount_btn myAccountLink"> 
                	<i class="ace-icon fa fa-user"></i>
                    <span onclick="$('#account').modal('show')">MY ACCOUNT</span>
                </a>
              </div>
              <!-- Modal -->
<div class="modal fade" id="account" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog widthh">
    <div class="modal-content bgg">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">My Account</h4>
      </div>
      <div class="modal-body">
                    
            <div class="menu_section">
              <ul class="clearfix reset">
                <li class="menu chng_prof"><a href="${pageContext.request.contextPath}/partner/personal/info" class="anch changeProfileLink"></span> <i class="ace-icon fa fa-user"></i>&nbsp; <span class="txt"> Change Profile</span></a></li>
                <li class=" menu adv_assum"><a href="${pageContext.request.contextPath}/partner/assumption" class="anch adviceAssumptionLink"><i class="ace-icon fa fa-user"></i>&nbsp; <span class="txt"> Advice Assumptions</span></a></li>
                <li class="menu chang_pass"><a href="${pageContext.request.contextPath}/password/changePassword" class="anch changePasswordLink"><i class="ace-icon fa fa-user"></i>&nbsp; <span class="txt"> Change Password</span></a> </li>
                <li class=" menu adv_recomm"><a href="${pageContext.request.contextPath}/partner/recommendation" class="anch adviceRecommendationLink"><i class="ace-icon fa fa-user"></i>&nbsp; <span class="txt"> Advice Recommendations</span></a></li>
                <li class=" menu interested_fp"><a href="${pageContext.request.contextPath}/partner/getInterstedFpSection" class="anch fpSectionLink"><i class="ace-icon fa fa-user"></i>&nbsp; <span class="txt"> FP Section </span></a></li>
                <li class=" menu personalizationLink"><a href="${pageContext.request.contextPath}/partner/personal/info?viewId=8" class="anch personalizationLink"><i class="ace-icon fa fa-user"></i>&nbsp; <span class="txt"> Personalization</span></a></li>
              </ul>
            </div>
            
            <a href="${pageContext.request.contextPath}/alert/reportIssue" class="anchor report_issue"><span class="icon fl"></span><span class="label fr">Report Issue</span></a> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
              
              

              </li>

            
            
            <li class="divider"></li>
            <li> <a href="<%=request.getContextPath()%>/common/logout.htm"> <i class="ace-icon fa fa-power-off"></i> Logout </a> </li>
          </ul>
        </li>        
          </ul>

        				
                        
                        
                      
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>
        
        


        
<!-- /***************************************** old header *******************************************/--> 


        


