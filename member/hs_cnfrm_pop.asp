<!--#include virtual="/common/lib/encoding.asp"-->
<%
    '**************************************************************************
	' 파일명 : hs_cnfrm_pop.asp
	'
	' 본인확인서비스 개인정보 암호화 및 인증페이지 호출 화면
    '
    ' ※주의
    ' 	실제 운영시에는 
    ' 	response.write를 사용하여 화면에 보여지는 데이터를 
    ' 	삭제하여 주시기 바랍니다. 방문자에게 사이트데이터가 노출될 수 있습니다.
    '**************************************************************************

    Function fixNumber(numX, sizeX)
		fixNumber = right(string(sizeX, "0") & trim(numX), sizeX)
    End Function 

	' 거래일련번호 생성 함수
	Function generateSvcTxSeqno()
		Dim num,numlen,r
		Dim svcTxSeqno
		Dim rCnt
		str = "0123456789"
		strlen = 6  '자릿수

		svcTxSeqno = Year(now)&Month(now)&Day(now)&Hour(now)& Minute(Now)&Second(time)
		Randomize  '랜덤초기화
		For i = 1 To strlen
			r = Int((10-1+1) * Rnd + 1) '15는 str의 갯수
			'Response.Write Mid(str,r,1)   '랜덤으로 추출된 하나의 값 확인 최종적으로는 모두 덧붙여진 값이 확인됨
			svcTxSeqno = svcTxSeqno+Mid(str,r,1)
		Next
		generateSvcTxSeqno = svcTxSeqno
	End Function 

    '**************************************************************************
    'okname 본인확인서비스 파라미터
    '**************************************************************************
    gubun		= request("gubun")						' 회원구분
	inTpBit		= request("in_tp_bit")					' 입력구분코드
    name		= "x"									' 성명 
    birthday	= "x"									' 생년월일 
    gender		= "x"									' 성별
    nation		= "x"									' 내외국인구분
    telComCd	= "x"									' 이동통신사코드
    telNo		= "x"									' 휴대폰번호 

	inTpBitVal	= cint(inTpBit)

	If (inTpBitVal And 1) = 1 Then 
		name		= request("name")					' 성명
	End If
	
	If (inTpBitVal And 2) = 2 Then 
		birthday	= request("birthday")				' 생년월일
	End If 
	
	If (inTpBitVal And 4) = 4 Then 
		gender		= request("gender")					' 성별
		nation		= request("nation")					' 내외국인구분
	End If 
	
	If (inTpBitVal And 8) = 8 Then 
		telComCd	= request("tel_com_cd")				' 통신사코드
		telNo		= request("tel_no")					' 휴대폰번호
	End If 

	' ########################################################################
	' # 운영전환시 확인 필요
	' ########################################################################
	memId			= "V05690000000"					' 회원사코드
    clientIp		= "118.219.234.217"					' 모듈설치 서버에 설정된 IP
	clientDomain	= "koreanfolk.co.kr"				' 회원사 도메인. (휴대폰인증번호 발송시 제휴사명에 노출) 실제 도메인

    svcTxSeqno = generateSvcTxSeqno()					' 거래일련번호 (동일 번호가 두번 생성되지 않도록 함. 0-9,A-Z,a-z 범위 30자 이내 )

    // 예약 항목
    rsv1 = "0"
    rsv2 = "0"
    rsv3 = "0"

    hsCertMsrCd		= "10"			' 인증수단코드 2byte  (10:핸드폰)
    rqstCausCd		= "00"			' 인증요청사유코드 2byte  (00:회원가입, 01:성인인증, 02:회원정보수정, 03:비밀번호찾기, 04:상품구매, 99:기타)

    'okname을 호출할 파라미터 정보(내부에서 암호화하여 리턴함. 팝업창에 미리 세팅하는 경우 암호화된 값을 팝업으로 전달할 수 있다.)
    returnMsg		= "x"			' (고정값 'x')

	' ########################################################################
	' # 리턴 URL 설정
	' ########################################################################
	' opener(hs_cnfrm_popup1.asp)의 도메일과 일치하도록 설정해야 함. (http://www.test.co.kr과 http://test.co.kr는 다른 도메인으로 인식하며, http 및 https도 일치해야 함)

	' 본인인증 완료후 리턴될 URL (도메인 포함 full path)
    returnUrl = "https://www.koreanfolk.co.kr/mobile/member/hs_cnfrm_pop_rtn.asp?gubun=" & gubun & ""
    'returnUrl = "http://www.koreanfolk.co.kr/mobile/member/hs_cnfrm_pop_rtn.asp?gubun="&gubun&""

	' ########################################################################
	' # 운영전환시 변경 필요
	' ########################################################################
	'endPointURL = "http://tsafe.ok-name.co.kr:29080/KcbWebService/OkNameService"	' 테스트 서버
    endPointURL = "http://safe.ok-name.co.kr/KcbWebService/OkNameService"			' 운영 서버

	' ########################################################################
	' # 로그 경로 지정 및 권한 부여 (절대경로)
	' ########################################################################
    logPath = "c:\\okname\\log"								' 로그파일 생성 경로

	' ########################################################################
	' # 옵션값에 'L'을 추가하는 경우에만 로그(logPath변수에 설정된)가 생성됨.
	' ########################################################################
	options = "QL"					' Q:인증요청데이터 암호화

    Dim cmd(20)
    cmd(0) = svcTxSeqno
    cmd(1) = name
    cmd(2) = birthday
    cmd(3) = gender
    cmd(4) = nation
    cmd(5) = telComCd
    cmd(6) = telNo
    cmd(7) = rsv1
    cmd(8) = rsv2
    cmd(9) = rsv3
    cmd(10) = returnMsg
    cmd(11) = returnUrl
    cmd(12) = inTpBit
    cmd(13) = hsCertMsrCd
    cmd(14) = rqstCausCd
    cmd(15) = memId
    cmd(16) = clientIp
    cmd(17) = clientDomain
    cmd(18) = endPointURL
    cmd(19) = logPath
    cmd(20) = options

    '**************************************************************************
    'okname 실행
    '**************************************************************************
	'객체 생성
	Dim myObject 
	Set myObject = Server.CreateObject("OkNameCom.OkName")


	'객체 생성 실패시 에러
	if myObject is nothing then
		response.write "S201:OkNameCom Initialization Failure"
	end If


	'모듈을 호출하고 실행결과를 가져옵니다.
	' ########################################################################
	' # OkNameCom.dll버전 3.65 미만인 경우
	' ########################################################################
	'ret = myObject.OkName( cmd )
	'mOut = myObject.getOkNameResult
	' ########################################################################
	' # OkNameCom.dll버전 3.65 이상인 경우
	' ########################################################################
	ret = myObject.callOkName( cmd, mOut )

	'객체삭제
    Set myObject = Nothing

'    response.write "ret="&ret&"<br>"
'    response.write mOut

    '**************************************************************************
    'okname 응답 정보
    '**************************************************************************
    retcode		= ""			' 응답코드
    retmsg		= ""			' 응답메시지
    e_rqstData	= ""			' 암호화된 요청데이터

    resultData = Split(mOut, vbLf )

    Set mOut = Nothing

    If ret = 0 Then				' 성공일 경우 변수를 결과에서 얻음
	    retcode		= resultData(0)
	    retmsg		= resultData(1)
	    e_rqstData	= resultData(2)
    Else
		if ret <=200 then
			retcode = "B"&fixNumber(ret, 3)
		else
			retcode = "S"&fixNumber(ret, 3)
		end if
    End If

    '**************************************************************************
    'hs_cnfrm_popup3.asp 실행 정보(SOAP호출에서는 사용하지 않고 POPUP시에만 사용함)
    '**************************************************************************
    targetId = "" '타겟ID (결과를 전달할 팝업이 따로 있을 경우 해당 팝업명(window.name 설정값)을 설정. 일반적으로 ""으로 설정)

	' ########################################################################
	' # 운영전환시 변경 필요
	' ########################################################################
    'commonSvlUrl = "https://tsafe.ok-name.co.kr:2443/CommonSvl"		' 테스트 URL
    commonSvlUrl = "https://safe.ok-name.co.kr/CommonSvl"				' 운영 URL
%>
<html>
	<title>KCB 본인확인서비스</title>
	<head>
	<script language="javascript">
		function request(){
			window.name = "<%=targetId%>";
			document.form1.action = "<%=commonSvlUrl%>";
			document.form1.method = "post";
			document.form1.submit();
		}
	</script>
	</head>

 <body>
	<form name="form1">
	<!-- 인증 요청 정보 -->
	<!--// 필수 항목 -->
	<input type="hidden" name="tc" value="kcb.oknm.online.safehscert.popup.cmd.P901_CertChoiceCmd">				<!-- 변경불가-->
	<input type="hidden" name="rqst_data" value="<%=e_rqstData%>"><!-- 요청데이터 -->
	<input type="hidden" name="target_id" value="<%=targetId%>"><!-- 타겟ID --> 
	<!-- 필수 항목 //-->	
	</form>
 </body>
<%
 	if retcode = "B000" then
		'인증요청
		response.write ("<script>request();</script>")
	else
		'요청 실패 페이지로 리턴
		response.write ("<script>alert('"+retcode+"'); self.close();</script>")
	end if 
%>
</html>