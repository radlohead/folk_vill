<!--#include virtual="/common/lib/encoding.asp"-->
<%
    '**************************************************************************
	' 파일명 : hs_cnfrm_popup3.asp
	'
	' 본인확인서비스 결과 화면(return url)
	' 암호화된 인증결과정보를 복호화한다.
	'**************************************************************************
    function fixNumber(numX, sizeX)
		fixNumber = right(string(sizeX, "0") & trim(numX), sizeX)
    end function

	' 공통 리턴 항목
	idcfMbrComCd		= request("idcf_mbr_com_cd")		'고객사코드
	hsCertSvcTxSeqno	= request("hs_cert_svc_tx_seqno")	'거래번호
	rqstSiteNm			= request("rqst_site_nm")			'접속도메인	
	hsCertMsrCd			= request("hs_cert_msr_cd")			'인증요청수단코드(00:전체, 10:휴대폰, 20:신용카드, 30:공인인증서)
	hsCertRqstCausCd	= request("hs_cert_rqst_caus_cd")	'인증요청사유코드 2byte  (00:회원가입, 01:성인인증, 02:회원정보수정, 03:비밀번호찾기, 04:상품구매, 99:기타) 

	gubun				= request("gubun")					'회원구분
	rqstIp				= request("rqst_ip")				'사용자접속IP
	resultCd			= request("result_cd")				'결과코드
	resultMsg			= request("result_msg")				'결과메세지
	certDtTm			= request("cert_dt_tm")				'인증일시

'/**************************************************************************
'// 모듈 호출	; 데이터 검증 
'**************************************************************************/
	
	encInfo			= request.form("encInfo")				'처리결과 암호화 정보.
	WEBPUBKEY		= request.form("WEBPUBKEY")				'KCB서버 공개키
	WEBSIGNATURE	= trim(request.form("WEBSIGNATURE"))	'KCB서버 서명값

'	response.write encPsnlInfo&"<br>"
'	response.write WEBPUBKEY&"<br>"
'	response.write WEBSIGNATURE&"<br>"

	' ########################################################################
	' # 운영전환시 변경 필요
	' ########################################################################
	'endPointURL = "http://tsafe.ok-name.co.kr:29080/KcbWebService/OkNameService"	'//테스트 서버
	endPointURL = "http://safe.ok-name.co.kr/KcbWebService/OkNameService"	'// 운영 서버

	cpubkey	= WEBPUBKEY			'server publickey
	csig	= WEBSIGNATURE		'server signature
	encData = encInfo			'PERSONALINFO
	
	' ########################################################################
	' # 암호화키 파일 설정 (절대경로) - 파일은 주어진 파일명으로 자동 생성되며, 매월마다 갱신됨 
	' # 만일 키파일이 갱신되지 않으면 복화화데이터가 깨지는 현상이 발생됨.
	' ########################################################################
	keyPath = "C:\\okname\\safecert_"+idcfMbrComCd+".key"

	' ########################################################################
	' # 로그 경로 지정 및 권한 부여 (hs_cnfrm_popup2.asp에서 설정된 값과 동일하게 설정)
	' ########################################################################
	logPath = "C:\\okname\\log"

	' ########################################################################
	' # 옵션값에 'L'을 추가하는 경우에만 로그가 생성됨.
	' ########################################################################
	options = "SL"		' S:인증결과복호화
		
    Dim cmd(7)
    cmd(0) = keyPath
    cmd(1) = idcfMbrComCd
    cmd(2) = endPointURL
    cmd(3) = cpubkey
    cmd(4) = csig
    cmd(5) = encData
    cmd(6) = logPath
    cmd(7) = options

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

	If ret = 0 Then '성공일 경우 변수를 결과에서 얻음
		'response.write "복호화 요청 호출 성공.<br/>"		 
	    resultData = Split(mOut, vbLf )
	Else 
		'response.write "복호화 요청 호출 에러. 리턴값 : "&ret&"<br/>"
	    Dim resultData(20)
	End If 

	'객체삭제
    Set myObject = Nothing

    'response.write mOut
    '**************************************************************************
    'okname 응답 정보
    '**************************************************************************

    Set mOut = Nothing

'   response.write "복호화처리결과코드:"&ret&"<br/>"		 
'   response.write "처리결과코드:"&resultData(0)&"<br/>"		 
'   response.write "처리결과메시지:"&resultData(1)&"<br/>"		 
'	response.write "거래일련번호:"&resultData(2)&"<br/>"		 
'	response.write "인증일시:"&resultData(3)&"<br/>"		 
'	response.write "DI:"&resultData(4)&"<br/>"		 
'	response.write "CI:"&resultData(5)&"<br/>"		 
'	response.write "PK:"&resultData(6)&"<br/>"		'  (안심실명확인 가입회원사인 경우)
'	response.write "성명:"&resultData(7)&"<br/>"		 
'	response.write "생년월일:"&resultData(8)&"<br/>"		 
'	response.write "성별:"&resultData(9)&"<br/>"		 
'	response.write "내외국인구분:"&resultData(10)&"<br/>"	 
'	response.write "통신사코드:"&resultData(11)&"<br/>"	 
'	response.write "휴대폰번호:"&resultData(12)&"<br/>"	 
'	response.write "리턴메시지:"&resultData(16)&"<br/>"	 
%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>KCB 본인확인</title>
    <script language="javascript" type="text/javascript" >
	function fncOpenerSubmit() {
		opener.document.kcbResultForm.idcf_mbr_com_cd.value = "<%=idcfMbrComCd%>";
		opener.document.kcbResultForm.hs_cert_rqst_caus_cd.value = "<%=hsCertRqstCausCd%>";
		opener.document.kcbResultForm.result_cd.value = "<%=resultData(0)%>";
		opener.document.kcbResultForm.result_msg.value = "<%=resultData(1)%>";
		opener.document.kcbResultForm.hs_cert_svc_tx_seqno.value = "<%=resultData(2)%>";
		opener.document.kcbResultForm.cert_dt_tm.value = "<%=resultData(3)%>";
		opener.document.kcbResultForm.di.value = "<%=resultData(4)%>";
		opener.document.kcbResultForm.ci.value = "<%=resultData(5)%>";
		opener.document.kcbResultForm.name.value = "<%=resultData(7)%>";
		opener.document.kcbResultForm.birthday.value = "<%=resultData(8)%>";
		opener.document.kcbResultForm.gender.value = "<%=resultData(9)%>";
		opener.document.kcbResultForm.nation.value = "<%=resultData(10)%>";
		opener.document.kcbResultForm.tel_com_cd.value = "<%=resultData(11)%>";
		opener.document.kcbResultForm.tel_no.value = "<%=resultData(12)%>";
		opener.document.kcbResultForm.return_msg.value = "<%=resultData(16)%>";

		//opener.document.kcbResultForm.action = "hs_cnfrm_popup4.asp";
		<%if gubun = "G" then%>
		opener.document.kcbResultForm.action = "https://www.koreanfolk.co.kr/mobile/member/join_general_form.asp";
		<%elseif gubun = "C" then%>
		opener.document.kcbResultForm.action = "https://www.koreanfolk.co.kr/mobile/member/join_child_form.asp";
		<%else%>
		opener.document.kcbResultForm.action = "https://www.koreanfolk.co.kr/mobile/member/join_foreigner_form.asp";
		<%end if%>
		opener.document.kcbResultForm.submit();
		
		self.close();
	}	
	</script>
	</head>
<body>
</body>
<%
 	if ret = 0 Then
		'인증결과 복호화 성공
		If resultCd = "B000" Then
			response.write ("<script>alert('인증이 성공 하였습니다.');fncOpenerSubmit();</script>")
		Else
			response.write ("<script>alert('인증이 실패 하였습니다.\n\n다시 시도해 주십시오.');self.close();</script>")
		End If
	else
		'인증결과 복호화 실패
		response.write ("<script>alert('인증결과복호화 실패 : "&ret&"'); self.close();</script>")
	end if 
%>
</html>