<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" NAME="ADODB Type Library" -->
<%
	Response.Buffer = True
	Response.Expires = 0
	Response.ExpiresAbsolute = Now() - 1
	Response.AddHeader "cache-control", "private"
	Response.AddHeader "pragma", "no-cache"
	Response.AddHeader "P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"
%>
<!--#include virtual="/common/config/config.inc" -->
<!--#include virtual="/common/lib/connect.inc" -->
<!--#include virtual="/common/lib/stringFunc.inc" -->
<!--#include virtual="/common/lib/htmlFunc.inc" -->
<!--#include virtual="/common/lib/dateFunc.inc" -->
<!--#include virtual="/common/lib/scriptFunc.inc" -->
<!--#include virtual="/common/lib/utilFunc.inc" -->