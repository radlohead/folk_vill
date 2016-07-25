<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code
	Dim code_name
	Dim Df_Psize

	Debug		= false		' SQL ����� ����(true : ���, false : ������)
	DebugMode	= 2			' SQL ����� ���(1 : COUNT ������ ���, 2 : LIST ������ ���)
	Df_Psize	= 1

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	seq			= SQLInjectionFilter(Nvl(Request("card_seq"),"53"))

	If IsNumeric(pg) = False Then f_AlertBack("������ ������ �ƴմϴ�.")

	code		= SQLInjectionFilter(Nvl(Request("code"),""))
	param		= "&code="&code
	today		= Date()

	If IsNumeric(pg) = False Then f_AlertBack("������ ������ �ƴմϴ�.")

	' ����¡ ó�� �κ�
	pgSize		= Df_Psize
	UniqueField	= "SEQ" ' �������ʵ�
	TableName	= "TBL_PARTNERSHIP" ' ���̺��
	SelectField	= "SEQ"
	WhereClause = "SEQ = " & seq
	OrderBy		= "SEQ"

	Call OpenDbConnection()			' �����ͺ��̽� ����
	Call ProcRecordSQL()			' ����¡ ó�� ���� ȣ��

	If Not(Rs.BOF OR Rs.EOF) Then
		rValue = Rs.GetRows
	Else
		rValue = Null
	End If

	totalpage = int(TotalRecordCount / pgSize)

	Nam = TotalRecordCount Mod pgSize

	If Nam > 0 Then
	   totalpage = totalpage + 1
	End If

	Call RsClose()
	Call CloseDbConnection()

	If (TotalRecordCount < 1) Then

		Response.Buffer = True
		Response.ContentType = "text/xml"
		Response.Write "<?xml version=""1.0"" encoding=""utf-8"" ?>" & vbCrLf
'		Response.Write "<?xml:stylesheet type=""text/xsl"" ?>" & vbCrLf
		Response.Write "<result>" & vbCrLf
		Response.Write "<item>" & vbCrLf
		Response.Write "<flag>nodata</flag>" & vbCrLf
		Response.Write "<seq_no></seq_no>" & vbCrLf
		Response.Write "<chkcnt>1</chkcnt>" & vbCrLf
		Response.Write "</item>" & vbCrLf
		Response.Write "</result>" & vbCrLf

	Else

		' ����¡ ó�� �κ�
		pgSize		= Df_Psize
		UniqueField	= "SEQ" ' �������ʵ�
		TableName	= "TBL_PARTNERSHIP" ' ���̺��
		SelectField	= "SEQ,CODE,TITLE,STATUS,FILES,ALT,SUMMARY,DISCOUNT,WEBSITE,CONTENTS1,CONTENTS2,CONTENTS3,CONTENTS4,CONTENTS5,WRITER,REGDATE"
		WhereClause = "SEQ = " & seq
		OrderBy		= "SEQ"


		Call OpenDbConnection() '�����ͺ��̽� ����
		Call ProcRecordSQL() ' ����¡ ó�� ���� ȣ��

		If Not(Rs.BOF OR Rs.EOF) Then
			rValue = Rs.GetRows
		Else
			rValue = Null
		End If

		totalpage = int(TotalRecordCount / pgSize)

		Nam = TotalRecordCount Mod pgSize
		If Nam > 0 Then
		   totalpage = totalpage + 1
		End If

		Response.Buffer = True
		Response.ContentType = "text/xml"
		Response.Write "<?xml version=""1.0"" encoding=""utf-8"" ?>" & vbCrLf
		Response.Write "<result>" & vbCrLf

		j = 1

		If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then

			For i = Lbound(rValue, 2) To UBound(rValue, 2)

				rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

				seq				= rValue(0,i)
				code			= rValue(1,i)
				title			= rValue(2,i)
				status			= rValue(3,i)
				files			= rValue(4,i)
				alt				= rValue(5,i)							
				summary			= rValue(6,i)
				discount		= rValue(7,i)
				website			= rValue(8,i)
				contents1		= rValue(9,i)
				contents1		= Replace(contents1,vblf,"<br />") '������ ������� ������ ��ȯ
				contents2		= rValue(10,i)
				contents2		= Replace(contents2,vblf,"<br />") '������ ������� ������ ��ȯ
				contents3		= rValue(11,i)
				contents3		= Replace(contents3,vblf,"<br />") '������ ������� ������ ��ȯ
				contents4		= rValue(12,i)
				contents4		= Replace(contents4,vblf,"<br />") '������ ������� ������ ��ȯ
				contents5		= rValue(13,i)
				contents5		= Replace(contents5,vblf,"<br />") '������ ������� ������ ��ȯ

				Response.Write "<item>" & vbCrLf
				Response.Write "<flag>success</flag>" & vbCrLf
				Response.Write "<seq>" & seq & "</seq>" & vbCrLf
				Response.Write "<code><![CDATA[" & code & "]]></code>" & vbCrLf
				Response.Write "<title><![CDATA[" & title & "]]></title>" & vbCrLf
				Response.Write "<status><![CDATA[" & status & "]]></status>" & vbCrLf
				Response.Write "<files><![CDATA[" & files & "]]></files>" & vbCrLf
				Response.Write "<alt><![CDATA[" & alt & "]]></alt>" & vbCrLf
				Response.Write "<summary><![CDATA[" & summary & "]]></summary>" & vbCrLf
				Response.Write "<discount><![CDATA[" & discount & "]]></discount>" & vbCrLf
				Response.Write "<website><![CDATA[" & website & "]]></website>" & vbCrLf
				Response.Write "<contents1><![CDATA[" & contents1 & "]]></contents1>" & vbCrLf
				Response.Write "<contents2><![CDATA[" & contents2 & "]]></contents2>" & vbCrLf
				Response.Write "<contents3><![CDATA[" & contents3 & "]]></contents3>" & vbCrLf
				Response.Write "<contents4><![CDATA[" & contents4 & "]]></contents4>" & vbCrLf
				Response.Write "<contents5><![CDATA[" & contents5 & "]]></contents5>" & vbCrLf
				Response.Write "</item>" & vbCrLf

				j = j + 1
			Next
		End If


		Response.Write "</result>" & vbCrLf
'		Set Rs = Nothing

		Call RsClose()
		Call CloseDbConnection()
	End If

%>