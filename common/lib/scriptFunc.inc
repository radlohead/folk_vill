<%

'** ---------------------------------------------------------------------------
' 함 수 명 : AlertBack(ByVal msg)	
' 목    적 : 경고후 뒤로가기
'** ---------------------------------------------------------------------------
Sub ErrMsg(ByVal msg)
	echo "<script language=javascript>"
	echo "alert('"& msg &"');"
	echo "history.back();"
	echo "</script>"
	response.end
End Sub

'** ---------------------------------------------------------------------------
' 함 수 명 : AlertClose(ByVal msg)	
' 목    적 : 경고후 창 닫기
'** ---------------------------------------------------------------------------
Sub MsgClose(ByVal msg)
	echo "<script language=javascript>"
	echo "alert('"& msg &"');"
	echo "window.close();"
	echo "</script>"
	response.end
End Sub

'** ---------------------------------------------------------------------------
' 함 수 명 : AlertClose(ByVal msg)	
' 목    적 : 경고후 부모창을 리프레쉬하고 창 닫기
'** ---------------------------------------------------------------------------
Sub MsgReClose(ByVal msg)
	echo "<script language=javascript>"
	echo "alert('"& msg &"');"
	If url = "" Then
		echo "opener.location.reload();"
	Else
		echo "opener.location.href='"& href & "';"
	End If
	echo "window.close();"
	echo "</script>"
	response.end
End Sub

'** ---------------------------------------------------------------------------
' 함 수 명 : AlertClose(ByVal msg)	
' 목    적 : 부모창을 리프레쉬하고 창 닫기
'** ---------------------------------------------------------------------------
Sub ReClose()
	echo "<script language=javascript>"
	echo "opener.location.reload();"
	echo "window.close();"
	echo "</script>"
	response.end
End Sub

'** ---------------------------------------------------------------------------
' 함 수 명 : AlertClose(ByVal msg)	
' 목    적 : 경고후 부모창을 해당페이지로 이동하고 창 닫기
'** ---------------------------------------------------------------------------
Sub MsgGoClose(ByVal msg, href)
	echo "<script language=javascript>"
	echo "alert('"& msg &"');"
	If url = "" Then
		echo "opener.location.reload();"
	Else
		echo "opener.location.href='"& href & "';"
	End If
	echo "window.close();"
	echo "</script>"
	response.end
End Sub

'** ---------------------------------------------------------------------------
' 함 수 명 : Alertlocation(ByVal msg,href)	
' 목    적 : target에 해당 페이지로 가기
'** ---------------------------------------------------------------------------
Sub GoTarget(href, target)
	echo "<script language=javascript>"
	echo target&".location.href='"& href & "';"
	echo "</script>"
	response.end
End Sub


'** ---------------------------------------------------------------------------
' 함 수 명 : Alertlocation(ByVal msg,href)	
' 목    적 : 경고후 해당 페이지로 가기
'** ---------------------------------------------------------------------------
Sub MsgGo(msg,href)
	echo "<script language=javascript>"
	echo "alert('"& msg &"');"
	echo "location.href='"& href & "';"
	echo "</script>"
	response.end
End Sub

'** ---------------------------------------------------------------------------
' 함 수 명 : Alertlocation(ByVal msg,href)	
' 목    적 : 경고후 target에 해당페이지로 가기
'** ---------------------------------------------------------------------------
Sub MsgGoTarget(msg,href,target)
	echo "<script language=javascript>"
	echo "alert('"& msg &"');"
	echo target&".location.href='"& href & "';"
	echo "</script>"
	response.end
End Sub



%>