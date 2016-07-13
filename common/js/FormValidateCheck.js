<!--
//우편번호찾기
function goSearchPost() {
	var targetUrl = "/member/post.asp";
	//centerPopupWindow(targetUrl, 'pop', {width : 437, height : 276});
	centerPopupWindow(targetUrl, 'pop', {width : 373, height : 363});
}

function goSearchPostTemp() {
	var targetUrl = "/member/post_temp.asp";
	//centerPopupWindow(targetUrl, 'pop', {width : 437, height : 276});
	centerPopupWindow(targetUrl, 'pop', {width : 373, height : 363});
}

/*2015/02/10 이메일 인증 회원가입 관련 테스트 스크립트 시작*/
//아이디 중복체크 테스트 - 이메일 인증 회원가입 개발후 삭제 예정
function goMemberIdCheckTemp() {
	var form = document.frm;
	if(!HasContent(form.id.value)) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return ;
	}
	var memId = form.id.value;
	//var targetUrl = "/member/pop_check_id.asp?id=" + memId;
	//centerPopupWindow(targetUrl, 'pop', {width : 335, height : 258});

	var targetUrl = "/member/idDupleCheckTemp.asp?id=" + memId;
	centerPopupWindow(targetUrl, 'pop', {width : 310, height : 297});
}

//중복체크전 아이디 확인 테스트 - 이메일 인증 회원가입 개발후 삭제 예정
function checkid_mode_temp() {
	var userid = document.frm.id.value;
	if(userid == "") {
		alert("아이디 중복 확인하기 위해서는 먼저 아이디를 입력해 주세요.");
		document.frm.id.focus();
		return;
	} else if(userid.length < 6 || userid.length > 14) {
		alert("아이디는 최소 6자 최대 14자 까지 입력하실수 있습니다.");
		document.frm.id.focus();
		return;
	} else if(!isUniChar(userid)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		document.frm.id.focus();
		return;
	} else {
		goMemberIdCheckTemp();
	}
}
/*2015/02/10 이메일 인증 회원가입 관련 테스트 스크립트 종료*/

//아이디 중복체크
function goMemberIdCheck() {
	var form = document.frm;
	if(!HasContent(form.id.value)) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return ;
	}
	var memId = form.id.value;
	//var targetUrl = "/member/pop_check_id.asp?id=" + memId;
	//centerPopupWindow(targetUrl, 'pop', {width : 335, height : 258});

	var targetUrl = "/member/idDupleCheck.asp?id=" + memId;
	centerPopupWindow(targetUrl, 'pop', {width : 310, height : 297});
}

//아이디 중복체크 (아이디입력)
function goMemberIdCheck_m(frm_id) {
	//var form = document.frm;
	if(!HasContent(frm_id)) {
		alert("아이디를 입력해 주세요.");
		//form.id.focus();
		return ;
	}
	var memId = frm_id;

	$(".id_chk_pop").css("visibility",'visible');
	id_dup_form.id_dup_chk.value = frm_id;
	//var targetUrl = "/member/idDupleCheck.asp?id=" + memId;
	//centerPopupWindow(targetUrl, 'pop', {width : 310, height : 297});
}

function IdCheck_m(frm_id) {

	if(frm_id == "") {
		alert("아이디 중복 확인하기 위해서는 먼저 아이디를 입력해 주세요.");
		return;
	} else if(frm_id.length < 6 || frm_id.length > 14) {
		alert("아이디는 최소 6자 최대 14자 까지 입력하실수 있습니다.");
		return;
	} else if(!isUniChar(frm_id)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		return;
	} else {
		//goMemberIdCheck_m(frm_id);
		$(".id_chk_pop").css("visibility",'visible');
		id_dup_form.id_dup_chk.value = frm_id;
		//var targetUrl = "/member/idDupleCheck.asp?id=" + memId;
		//centerPopupWindow(targetUrl, 'pop', {width : 310, height : 297});
	}

}

//중복체크전 아이디 확인
function checkid_mode() {
	var userid = document.frm.id.value;
	if(userid == "") {
		alert("아이디 중복 확인하기 위해서는 먼저 아이디를 입력해 주세요.");
		document.frm.id.focus();
		return;
	} else if(userid.length < 6 || userid.length > 14) {
		alert("아이디는 최소 6자 최대 14자 까지 입력하실수 있습니다.");
		document.frm.id.focus();
		return;
	} else if(!isUniChar(userid)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		document.frm.id.focus();
		return;
	} else {
		goMemberIdCheck();
	}
}

//중복체크전 아이디 확인 (아이디입력)
function checkid_mode_m(frm_id) {
	var userid = frm_id;
	//alert(frm_id);
	//alert(userid);
	if(userid == "") {
		alert("아이디 중복 확인하기 위해서는 먼저 아이디를 입력해 주세요.");
		//document.frm.id.focus();
		return;
	} else if(userid.length < 6 || userid.length > 14) {
		alert("아이디는 최소 6자 최대 14자 까지 입력하실수 있습니다.");
		//document.frm.id.focus();
		return;
	} else if(!isUniChar(userid)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		//document.frm.id.focus();
		return;
	} else {
		goMemberIdCheck_m(userid);
	}
}

//이메일 중복체크
function goEmailCheck() {
	var frm = document.frm;
	var email = frm.email1.value + "@" + frm.email2.value;
	if (!isValid_email(email)) {
		return;
	}
	var targetUrl = "/member/emailDupleCheck.asp?email=" + email;
	centerPopupWindow(targetUrl, 'pop', {width : 580, height : 400});
}

//이메일 도메인 체크
function changeEmailDomain(obj) {
	var frm = document.frm;
	if (obj.value == "") {
		frm.email2.readOnly = false;
		frm.email2.value = "직접입력";
	} else {
		frm.email2.readOnly = true;
		frm.email2.value = obj.value;
	}
	/*
	if (frm.emailDupleChecked != undefined) {
		frm.emailDupleChecked.value = "N";
	}
	*/
}

//우편번호 부모창에 넣기
//값전달후 포커스 이동이 잘 안되는 현상 발생
/*function setAddr(arg) {
	document.getElementById("zipcode1").value = arg.substring(0,3);
	document.getElementById("zipcode2").value = arg.substring(4,7);
	document.getElementById("address").value = arg.substring(7);
	document.getElementById("address_detail").focus();
}*/

//휴대폰 인증 회원정보 등록 체크/submit
function FormInsertCheck() {
	var form = document.frm;

	if(!HasContent(form.birthyear.value)) {
		alert("생년월일에 년도를 선택해 주세요.");
		form.birthyear.focus();
		return;
	} else if(!HasContent(form.birthmonth.value)) {
		alert("생년월일에 월을 선택해 주세요.");
		form.birthmonth.focus();
		return;
	} else if(!HasContent(form.birthday.value)) {
		alert("생년월일에 일을 선택해 주세요.");
		form.birthday.focus();
		return;
	} else if(!$(':input:radio[name=birth_umyang]:checked').val()) {
		alert("양력/음력을 선택해 주세요.");
		//$(':input:radio[name=birth_umyang]:first-child').focus();
		return;
	} else if( form.idDupleChecked.value != "Y" ) {
		alert("아이디 중복 확인을 검색해 주세요.");
		form.id.focus();
		return;
	} else  if(!HasContent(form.id.value)) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if( Trim(form.id.value).length < 6 || Trim(form.id.value).length > 16 ) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if(!isUniChar(form.id.value)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.id.focus();
		return;
	} else if(!HasContent(form.password1.value)) {
		alert("비밀번호를 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.password1.value.length < 6 || Trim(form.password1.value).length > 14) {
		alert("비밀번호는 6~14자이어야 합니다.");
		form.password1.focus();
		return;
	} else if(!isUniChar(form.password1.value)) {
		alert("비밀번호는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password1.focus();
		return;
	} else if(!HasContent(form.password2.value)) {
		alert("비밀번호 확인을 입력해 주세요.");
		form.password2.focus();
		return;
	} else if(form.password2.value.length < 6 || Trim(form.password2.value).length > 14) {
		alert("비밀번호 확인은 6~14자이어야 합니다.");
		form.password2.focus();
		return;
	} else if(!isUniChar(form.password2.value)) {
		alert("비밀번호 확인은 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password2.focus();
		return;
	} else if(form.password1.value != form.password2.value ) {
		alert("비밀번호와 확인이 일치하지 않습니다.");
		//form.password1.focus();
		return;
	} else if(!isValid_passwd(form.password1.value)) {
		//alert("비밀번호를 바르게 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.zipcode1.value == "" ||  form.zipcode2.value == "") {
		alert("우편번호를 입력해 주세요.");
		return;
	} else if(form.address.value == "" ) {
		alert("주소를 입력해 주세요.");
		return;
	} else if(form.address_detail.value == "" ) {
		alert("나머지 주소를 입력해 주세요.");
		form.address_detail.focus();
		return;
	} else if(!$(':input:radio[name=sms]:checked').val()) {
	//} else if($(':checkbox[name=sms]:checked').length == 0) {
		alert("SMS 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	//} else if( form.emailDupleChecked.value != "Y" ) {
	//	alert("이메일 중복 확인을 검색해 주세요.");
	//	form.email1.focus();
	//	return;
	} else if(!HasContent(form.email1.value)) {
		alert("메일주소를 입력해 주세요.");
		form.email1.focus();
		return;
	} else if( !IsEmail(form.email1.value +  "@" + form.email2.value) ) {
		alert("메일주소를 바르게 입력해 주세요.");
		form.email1.focus();
		return;
	} else if(!$(':input:radio[name=mailling]:checked').val()) {
	//} else if($(':checkbox[name=mailling]:checked').length == 0) {
		alert("뉴스레터 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	} else {
		//form.jumin2.value = getRandom_num();
		//form.juminNo.value    = form.jumin1.value +  form.jumin2.value;
		//form.email.value    = form.emailId.value +  "@" + form.emailDomain.value;
		//form.birthday.value = form.yearBirthday.value + form.monthBirthday.value + form.dayBirthday.value;
		//form.weddingAnniversary.value = form.yearMarry.value + form.monthMarry.value + form.dayMarry.value;
		form.target = "blank_frame";
		form.submit();
	}
}


//휴대폰 인증 14세 회원정보 등록 체크/submit
function FormInsertCheckM() {
	var form = document.frm;

	if(!HasContent(form.cname.value)) {
		alert("이름 입력해 주세요.");
		form.cname.focus();
		return;
	} else if(!HasContent(form.csex.value)) {
		alert("성별을 입력해 주세요.");
		form.csex.focus();
		return;
	} else if(!HasContent(form.birthyear.value)) {
		alert("생년월일에 년도를 선택해 주세요.");
		form.birthyear.focus();
		return;
	} else if(!HasContent(form.birthmonth.value)) {
		alert("생년월일에 월을 선택해 주세요.");
		form.birthmonth.focus();
		return;
	} else if(!HasContent(form.birthday.value)) {
		alert("생년월일에 일을 선택해 주세요.");
		form.birthday.focus();
		return;
	} else if(!$(':input:radio[name=birth_umyang]:checked').val()) {
		alert("양력/음력을 선택해 주세요.");
		//$(':input:radio[name=birth_umyang]:first-child').focus();
		return;
	} else if( form.idDupleChecked.value != "Y" ) {
		alert("아이디 중복 확인을 검색해 주세요.");
		form.id.focus();
		return;
	} else  if(!HasContent(form.id.value)) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if( Trim(form.id.value).length < 6 || Trim(form.id.value).length > 16 ) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if(!isUniChar(form.id.value)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.id.focus();
		return;
	} else if(!HasContent(form.password1.value)) {
		alert("비밀번호를 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.password1.value.length < 6 || Trim(form.password1.value).length > 14) {
		alert("비밀번호는 6~14자이어야 합니다.");
		form.password1.focus();
		return;
	} else if(!isUniChar(form.password1.value)) {
		alert("비밀번호는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password1.focus();
		return;
	} else if(!HasContent(form.password2.value)) {
		alert("비밀번호 확인을 입력해 주세요.");
		form.password2.focus();
		return;
	} else if(form.password2.value.length < 6 || Trim(form.password2.value).length > 14) {
		alert("비밀번호 확인은 6~14자이어야 합니다.");
		form.password2.focus();
		return;
	} else if(!isUniChar(form.password2.value)) {
		alert("비밀번호 확인은 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password2.focus();
		return;
	} else if(form.password1.value != form.password2.value ) {
		alert("비밀번호와 확인이 일치하지 않습니다.");
		//form.password1.focus();
		return;
	} else if(!isValid_passwd(form.password1.value)) {
		//alert("비밀번호를 바르게 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.zipcode1.value == "" ||  form.zipcode2.value == "") {
		alert("우편번호를 입력해 주세요.");
		return;
	} else if(form.address.value == "" ) {
		alert("주소를 입력해 주세요.");
		return;
	} else if(form.address_detail.value == "" ) {
		alert("나머지 주소를 입력해 주세요.");
		form.address_detail.focus();
		return;
	} else if(!$(':input:radio[name=sms]:checked').val()) {
	//} else if($(':checkbox[name=sms]:checked').length == 0) {
		alert("SMS 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	//} else if( form.emailDupleChecked.value != "Y" ) {
	//	alert("이메일 중복 확인을 검색해 주세요.");
	//	form.email1.focus();
	//	return;
	} else if(!HasContent(form.email1.value)) {
		alert("메일주소를 입력해 주세요.");
		form.email1.focus();
		return;
	} else if( !IsEmail(form.email1.value +  "@" + form.email2.value) ) {
		alert("메일주소를 바르게 입력해 주세요.");
		form.email1.focus();
		return;
	} else if(!$(':input:radio[name=mailling]:checked').val()) {
	//} else if($(':checkbox[name=mailling]:checked').length == 0) {
		alert("뉴스레터 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	} else {
		//form.jumin2.value = getRandom_num();
		//form.juminNo.value    = form.jumin1.value +  form.jumin2.value;
		//form.email.value    = form.emailId.value +  "@" + form.emailDomain.value;
		//form.birthday.value = form.yearBirthday.value + form.monthBirthday.value + form.dayBirthday.value;
		//form.weddingAnniversary.value = form.yearMarry.value + form.monthMarry.value + form.dayMarry.value;
		form.target = "blank_frame";
		form.submit();
	}
}


//이메일 인증 일반회원정보 등록 체크/submit
function EmailFormGeneralInsertCheck() {
	var form = document.frm;

	if(!$(':input:radio[name=gender]:checked').val()) {
		alert("성별을 선택해 주세요.");
		//$(':input:radio[name=gender]:first-child').focus();
		return;
	} else if(!HasContent(form.birthyear.value)) {
		alert("생년월일에 년도를 선택해 주세요.");
		form.birthyear.focus();
		return;
	} else if(!HasContent(form.birthmonth.value)) {
		alert("생년월일에 월을 선택해 주세요.");
		form.birthmonth.focus();
		return;
	} else if(!HasContent(form.birthday.value)) {
		alert("생년월일에 일을 선택해 주세요.");
		form.birthday.focus();
		return;
	} else if(!$(':input:radio[name=birth_umyang]:checked').val()) {
		alert("양력/음력을 선택해 주세요.");
		//$(':input:radio[name=birth_umyang]:first-child').focus();
		return;
	} else if( form.idDupleChecked.value != "Y" ) {
		alert("아이디 중복 확인을 검색해 주세요.");
		form.id.focus();
		return;
	} else  if(!HasContent(form.id.value)) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if( Trim(form.id.value).length < 6 || Trim(form.id.value).length > 16 ) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if(!isUniChar(form.id.value)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.id.focus();
		return;
	} else if(!HasContent(form.password1.value)) {
		alert("비밀번호를 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.password1.value.length < 6 || Trim(form.password1.value).length > 14) {
		alert("비밀번호는 6~14자이어야 합니다.");
		form.password1.focus();
		return;
	} else if(!isUniChar(form.password1.value)) {
		alert("비밀번호는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password1.focus();
		return;
	} else if(!HasContent(form.password2.value)) {
		alert("비밀번호 확인을 입력해 주세요.");
		form.password2.focus();
		return;
	} else if(form.password2.value.length < 6 || Trim(form.password2.value).length > 14) {
		alert("비밀번호 확인은 6~14자이어야 합니다.");
		form.password2.focus();
		return;
	} else if(!isUniChar(form.password2.value)) {
		alert("비밀번호 확인은 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password2.focus();
		return;
	} else if(form.password1.value != form.password2.value ) {
		alert("비밀번호와 확인이 일치하지 않습니다.");
		//form.password1.focus();
		return;
	} else if(!isValid_passwd(form.password1.value)) {
		//alert("비밀번호를 바르게 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.zipcode1.value == "" ||  form.zipcode2.value == "") {
		alert("우편번호를 입력해 주세요.");
		return;
	} else if(form.address.value == "" ) {
		alert("주소를 입력해 주세요.");
		return;
	} else if(form.address_detail.value == "" ) {
		alert("나머지 주소를 입력해 주세요.");
		form.address_detail.focus();
		return;
	} else if(!HasContent(form.mobile1.value)) {
		alert("휴대폰 첫번째 번호를 선택해 주세요.");
		form.mobile1.focus();
		return;
	} else if(!HasContent(form.mobile2.value)) {
		alert("휴대폰 번호를 입력해 주세요.");
		form.mobile2.focus();
		return;
	/*
	} else if(!HasContent(form.mobile3.value)) {
		alert("휴대폰 마지막 번호를 입력해 주세요.");
		form.mobile3.focus();
		return;
	*/
	} else if(!$(':input:radio[name=sms]:checked').val()) {
	//} else if($(':checkbox[name=sms]:checked').length == 0) {
		alert("SMS 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	//} else if( form.emailDupleChecked.value != "Y" ) {
	//	alert("이메일 중복 확인을 검색해 주세요.");
	//	form.email1.focus();
	//	return;
	} else if(!HasContent(form.email1.value)) {
		alert("메일주소를 입력해 주세요.");
		form.email1.focus();
		return;
	} else if( !IsEmail(form.email1.value +  "@" + form.email2.value) ) {
		alert("메일주소를 바르게 입력해 주세요.");
		form.email1.focus();
		return;
	} else if(!$(':input:radio[name=mailling]:checked').val()) {
	//} else if($(':checkbox[name=mailling]:checked').length == 0) {
		alert("뉴스레터 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	} else {
		//form.jumin2.value = getRandom_num();
		//form.juminNo.value    = form.jumin1.value +  form.jumin2.value;
		//form.email.value    = form.emailId.value +  "@" + form.emailDomain.value;
		//form.birthday.value = form.yearBirthday.value + form.monthBirthday.value + form.dayBirthday.value;
		//form.weddingAnniversary.value = form.yearMarry.value + form.monthMarry.value + form.dayMarry.value;
		form.target = "blank_frame";
		form.submit();
	}
}

//이메일 인증 14세미만회원정보 등록 체크/submit
function EmailFormChildInsertCheck() {
	var form = document.frm;

	if(!HasContent(form.pname.value)) {
		alert("보호자 이름을 입력해 주세요.");
		form.pname.focus();
		return;
	} else if(!$(':input:radio[name=gender]:checked').val()) {
		alert("성별을 선택해 주세요.");
		//$(':input:radio[name=gender]:first-child').focus();
		return;
	} else if(!$(':input:radio[name=pgender]:checked').val()) {
		alert("보호자 성별을 선택해 주세요.");
		//$(':input:radio[name=pgender]:first-child').focus();
		return;
	} else if(!HasContent(form.birthyear.value)) {
		alert("생년월일에 년도를 선택해 주세요.");
		form.birthyear.focus();
		return;
	} else if(!HasContent(form.birthmonth.value)) {
		alert("생년월일에 월을 선택해 주세요.");
		form.birthmonth.focus();
		return;
	} else if(!HasContent(form.birthday.value)) {
		alert("생년월일에 일을 선택해 주세요.");
		form.birthday.focus();
		return;
	} else if(!$(':input:radio[name=birth_umyang]:checked').val()) {
		alert("양력/음력을 선택해 주세요.");
		//$(':input:radio[name=birth_umyang]:first-child').focus();
		return;
	} else if(!HasContent(form.pbirthyear.value)) {
		alert("보호자 생년월일에 년도를 선택해 주세요.");
		form.pbirthyear.focus();
		return;
	} else if(!HasContent(form.pbirthmonth.value)) {
		alert("보호자 생년월일에 월을 선택해 주세요.");
		form.pbirthmonth.focus();
		return;
	} else if(!HasContent(form.pbirthday.value)) {
		alert("보호자 생년월일에 일을 선택해 주세요.");
		form.pbirthday.focus();
		return;
	} else if( form.idDupleChecked.value != "Y" ) {
		alert("아이디 중복 확인을 검색해 주세요.");
		form.id.focus();
		return;
	} else  if(!HasContent(form.id.value)) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if( Trim(form.id.value).length < 6 || Trim(form.id.value).length > 16 ) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if(!isUniChar(form.id.value)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.id.focus();
		return;
	} else if(!HasContent(form.password1.value)) {
		alert("비밀번호를 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.password1.value.length < 6 || Trim(form.password1.value).length > 14) {
		alert("비밀번호는 6~14자이어야 합니다.");
		form.password1.focus();
		return;
	} else if(!isUniChar(form.password1.value)) {
		alert("비밀번호는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password1.focus();
		return;
	} else if(!HasContent(form.password2.value)) {
		alert("비밀번호 확인을 입력해 주세요.");
		form.password2.focus();
		return;
	} else if(form.password2.value.length < 6 || Trim(form.password2.value).length > 14) {
		alert("비밀번호 확인은 6~14자이어야 합니다.");
		form.password2.focus();
		return;
	} else if(!isUniChar(form.password2.value)) {
		alert("비밀번호 확인은 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password2.focus();
		return;
	} else if(form.password1.value != form.password2.value ) {
		alert("비밀번호와 확인이 일치하지 않습니다.");
		//form.password1.focus();
		return;
	} else if(!isValid_passwd(form.password1.value)) {
		//alert("비밀번호를 바르게 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.zipcode1.value == "" ||  form.zipcode2.value == "") {
		alert("우편번호를 입력해 주세요.");
		return;
	} else if(form.address.value == "" ) {
		alert("주소를 입력해 주세요.");
		return;
	} else if(form.address_detail.value == "" ) {
		alert("나머지 주소를 입력해 주세요.");
		form.address_detail.focus();
		return;
	} else if(!HasContent(form.pmobile1.value)) {
		alert("보호자 휴대폰 첫번째 번호를 선택해 주세요.");
		form.pmobile1.focus();
		return;
	} else if(!HasContent(form.pmobile2.value)) {
		alert("보호자 휴대폰 가운데 번호를 입력해 주세요.");
		form.pmobile2.focus();
		return;
	} else if(!HasContent(form.pmobile3.value)) {
		alert("보호자 휴대폰 마지막 번호를 입력해 주세요.");
		form.pmobile3.focus();
		return;
	} else if(!$(':input:radio[name=sms]:checked').val()) {
	//} else if($(':checkbox[name=sms]:checked').length == 0) {
		alert("SMS 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	//} else if( form.emailDupleChecked.value != "Y" ) {
	//	alert("이메일 중복 확인을 검색해 주세요.");
	//	form.email1.focus();
	//	return;
	} else if(!HasContent(form.email1.value)) {
		alert("메일주소를 입력해 주세요.");
		form.email1.focus();
		return;
	} else if( !IsEmail(form.email1.value +  "@" + form.email2.value) ) {
		alert("메일주소를 바르게 입력해 주세요.");
		form.email1.focus();
		return;
	} else if(!$(':input:radio[name=mailling]:checked').val()) {
	//} else if($(':checkbox[name=mailling]:checked').length == 0) {
		alert("뉴스레터 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	} else {
		//form.jumin2.value = getRandom_num();
		//form.juminNo.value    = form.jumin1.value +  form.jumin2.value;
		//form.email.value    = form.emailId.value +  "@" + form.emailDomain.value;
		//form.birthday.value = form.yearBirthday.value + form.monthBirthday.value + form.dayBirthday.value;
		//form.weddingAnniversary.value = form.yearMarry.value + form.monthMarry.value + form.dayMarry.value;
		form.target = "blank_frame";
		form.submit();
	}
}

//이메일 인증 외국인회원정보 등록 체크/submit
function EmailFormForeignerInsertCheck() {
	var form = document.frm;

	if(!$(':input:radio[name=gender]:checked').val()) {
		alert("성별을 선택해 주세요.");
		//$(':input:radio[name=gender]:first-child').focus();
		return;
	} else if(!HasContent(form.birthyear.value)) {
		alert("생년월일에 년도를 선택해 주세요.");
		form.birthyear.focus();
		return;
	} else if(!HasContent(form.birthmonth.value)) {
		alert("생년월일에 월을 선택해 주세요.");
		form.birthmonth.focus();
		return;
	} else if(!HasContent(form.birthday.value)) {
		alert("생년월일에 일을 선택해 주세요.");
		form.birthday.focus();
		return;
	} else if(!$(':input:radio[name=birth_umyang]:checked').val()) {
		alert("양력/음력을 선택해 주세요.");
		//$(':input:radio[name=birth_umyang]:first-child').focus();
		return;
	} else if( form.idDupleChecked.value != "Y" ) {
		alert("아이디 중복 확인을 검색해 주세요.");
		form.id.focus();
		return;
	} else  if(!HasContent(form.id.value)) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if( Trim(form.id.value).length < 6 || Trim(form.id.value).length > 16 ) {
		alert("아이디를 입력해 주세요.");
		form.id.focus();
		return;
	} else if(!isUniChar(form.id.value)) {
		alert("아이디는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.id.focus();
		return;
	} else if(!HasContent(form.password1.value)) {
		alert("비밀번호를 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.password1.value.length < 6 || Trim(form.password1.value).length > 14) {
		alert("비밀번호는 6~14자이어야 합니다.");
		form.password1.focus();
		return;
	} else if(!isUniChar(form.password1.value)) {
		alert("비밀번호는 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password1.focus();
		return;
	} else if(!HasContent(form.password2.value)) {
		alert("비밀번호 확인을 입력해 주세요.");
		form.password2.focus();
		return;
	} else if(form.password2.value.length < 6 || Trim(form.password2.value).length > 14) {
		alert("비밀번호 확인은 6~14자이어야 합니다.");
		form.password2.focus();
		return;
	} else if(!isUniChar(form.password2.value)) {
		alert("비밀번호 확인은 영문자와 숫자를 혼용 하셔야 합니다.");
		form.password2.focus();
		return;
	} else if(form.password1.value != form.password2.value ) {
		alert("비밀번호와 확인이 일치하지 않습니다.");
		//form.password1.focus();
		return;
	} else if(!isValid_passwd(form.password1.value)) {
		//alert("비밀번호를 바르게 입력해 주세요.");
		form.password1.focus();
		return;
	} else if(form.zipcode1.value == "" ||  form.zipcode2.value == "") {
		alert("우편번호를 입력해 주세요.");
		return;
	} else if(form.address.value == "" ) {
		alert("주소를 입력해 주세요.");
		return;
	} else if(form.address_detail.value == "" ) {
		alert("나머지 주소를 입력해 주세요.");
		form.address_detail.focus();
		return;
	} else if(!HasContent(form.mobile1.value)) {
		alert("휴대폰 첫번째 번호를 선택해 주세요.");
		form.mobile1.focus();
		return;
	} else if(!HasContent(form.mobile2.value)) {
		alert("휴대폰 가운데 번호를 입력해 주세요.");
		form.mobile2.focus();
		return;
	} else if(!HasContent(form.mobile3.value)) {
		alert("휴대폰 마지막 번호를 입력해 주세요.");
		form.mobile3.focus();
		return;
	} else if(!$(':input:radio[name=sms]:checked').val()) {
	//} else if($(':checkbox[name=sms]:checked').length == 0) {
		alert("SMS 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	//} else if( form.emailDupleChecked.value != "Y" ) {
	//	alert("이메일 중복 확인을 검색해 주세요.");
	//	form.email1.focus();
	//	return;
	} else if(!HasContent(form.email1.value)) {
		alert("메일주소를 입력해 주세요.");
		form.email1.focus();
		return;
	} else if( !IsEmail(form.email1.value +  "@" + form.email2.value) ) {
		alert("메일주소를 바르게 입력해 주세요.");
		form.email1.focus();
		return;
	} else if(!$(':input:radio[name=mailling]:checked').val()) {
	//} else if($(':checkbox[name=mailling]:checked').length == 0) {
		alert("뉴스레터 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	} else {
		//form.jumin2.value = getRandom_num();
		//form.juminNo.value    = form.jumin1.value +  form.jumin2.value;
		//form.email.value    = form.emailId.value +  "@" + form.emailDomain.value;
		//form.birthday.value = form.yearBirthday.value + form.monthBirthday.value + form.dayBirthday.value;
		//form.weddingAnniversary.value = form.yearMarry.value + form.monthMarry.value + form.dayMarry.value;
		form.target = "blank_frame";
		form.submit();
	}
}

//회원정보 수정 체크/submit
function FormEditCheck() {
	var form = document.frm;

	/*if( form.email.value != ( form.email1.value +  "@" + form.email2.value) ){
		if(form.emailDupleChecked.value != "Y" ) {
			alert("이메일 중복 확인을 검색해 주세요.");
			form.email1.focus();
			return;
		}
	}*/

	//회원구분값(G:일반, C:14세미만, F:외국인)
	var gubun = form.gubun.value;
	//alert(gubun);

	if(!HasContent(form.birthyear.value)) {
		alert("생년월일에 년도를 선택해 주세요.");
		form.birthyear.focus();
		return;
	}

	if(!HasContent(form.birthmonth.value)) {
		alert("생년월일에 월을 선택해 주세요.");
		form.birthmonth.focus();
		return;
	}

	if(!HasContent(form.birthday.value)) {
		alert("생년월일에 일을 선택해 주세요.");
		form.birthday.focus();
		return;
	}

	if(!$(':input:radio[name=birth_umyang]:checked').val()) {
		alert("양력/음력을 선택해 주세요.");
		//$(':input:radio[name=birth_umyang]:first-child').focus();
		return;
	}

	if(form.zipcode1.value == "" ||  form.zipcode2.value == "") {
		alert("우편번호를 입력해 주세요.");
		return;
	}

	if(form.address.value == "" ) {
		alert("주소를 입력해 주세요.");
		return;
	}

	if(form.address_detail.value == "" ) {
		alert("나머지 주소를 입력해 주세요.");
		form.address_detail.focus();
		return;
	}

	if (gubun == "C") { //14세미만인 회원일 경우 부모휴대폰 체크
		if(!HasContent(form.pmobile1.value)) {
			alert("보호자 휴대폰 첫번째 번호를 선택해 주세요.");
			form.pmobile1.focus();
			return;
		}

		if(!HasContent(form.pmobile2.value)) {
			alert("보호자 휴대폰 가운데 번호를 선택해 주세요.");
			form.pmobile2.focus();
			return;
		}
		/*
		if(!HasContent(form.pmobile3.value)) {
			alert("보호자 휴대폰 마지막 번호를 선택해 주세요.");
			form.pmobile3.focus();
			return;
		}
		*/
	} else {
		if(!HasContent(form.mobile1.value)) {
			alert("휴대폰 첫번째 번호를 선택해 주세요.");
			form.mobile1.focus();
			return;
		}

		if(!HasContent(form.mobile2.value)) {
			alert("휴대폰 가운데 번호를 선택해 주세요.");
			form.mobile2.focus();
			return;
		}
		/*
		if(!HasContent(form.mobile3.value)) {
			alert("휴대폰 마지막 번호를 선택해 주세요.");
			form.mobile3.focus();
			return;
		}
		*/
	}

	if(!$(':input:radio[name=sms]:checked').val()) {
	//if($(':checkbox[name=sms]:checked').length == 0) {
		alert("SMS 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	}

	if(!HasContent(form.email1.value)) {
		alert("메일주소를 입력해 주세요.");
		form.email1.focus();
		return;
	}

	if( !IsEmail(form.email1.value +  "@" + form.email2.value) ) {
		alert("메일주소를 바르게 입력해 주세요.");
		form.email1.focus();
		return;
	}

	if(!$(':input:radio[name=mailling]:checked').val()) {
	//if($(':checkbox[name=mailling]:checked').length == 0) {
		alert("뉴스레터 수신여부를 선택해 주세요.");
		//$(':input:radio[name=mailling]:first-child').focus();
		return;
	}

	//form.jumin2.value = getRandom_num();
	//form.juminNo.value    = form.jumin1.value +  form.jumin2.value;
	//form.email.value    = form.emailId.value +  "@" + form.emailDomain.value;
	//form.birthday.value = form.yearBirthday.value + form.monthBirthday.value + form.dayBirthday.value;
	//form.weddingAnniversary.value = form.yearMarry.value + form.monthMarry.value + form.dayMarry.value;
	form.target = "blank_frame";
	form.submit();
}

//이메일 수신설정 수정
function EmailEdit()
{
	var frm = document.form1;

	//이메일 체크
	if (fnChkEmail()) {

		//휴대폰번호 체크
		if (frm.mobile1.value == '') {
			alert("휴대전화 첫번째 번호를 선택해 주십시요.");
			frm.mobile1.focus();
			return;
		}

		if (is_nullstring(TrimAll(frm.mobile2.value)) || !is_num(TrimAll(frm.mobile2.value))){
			alert("휴대전화 두번째 번호를 입력하여 주십시요.");
			frm.mobile2.focus();
			return;
		}

		if (frm.mobile2.value.length < 3) {
			alert("휴대전화 두번째 번호는 3자리 또는 4자리 숫자로 입력해 주십시요.");
			frm.mobile2.focus();
			return;
		}

		if (is_nullstring(TrimAll(frm.mobile3.value)) || !is_num(TrimAll(frm.mobile3.value))){
			alert("휴대전화 세번째 번호를 입력하여 주십시요.");
			frm.mobile3.focus();
			return;
		}

		if (frm.mobile3.value.length < 4) {
			alert("휴대전화 세번째 번호는 4자리 숫자로 입력해 주십시요.");
			frm.mobile3.focus();
			return;
		}

		frm.submit();
	}
}

function errcheck1() {
		if (af.poll1[4].checked == true)
		{
			af.poll1_text.readOnly = false;
			af.poll1_text.focus();
		} else {
			af.poll1_text.readOnly = true;
			af.poll1_text.value = "";
		}
}

function errcheck2() {
		if (af.poll2[3].checked == true)
		{
			af.poll2_text.readOnly = false;
			af.poll2_text.focus();
		} else {
			af.poll2_text.readOnly = true;
			af.poll2_text.value = "";
		}
}

function errcheck3() {
		if (af.poll3[4].checked == true)
		{
			af.poll3_text.readOnly = false;
			af.poll3_text.focus();
		} else {
			af.poll3_text.readOnly = true;
			af.poll3_text.value = "";
		}
}

function PollClear(gb)
{
	if (gb == "1")
	{
		af.mainbrand_text.value = "";
	} else {
		af.howbrand_text.value = "";
	}
}

function passwordck(p) {
    chk1 = /^[a-z\d]{6,14}$/i;
    chk2 = /[a-z]/i;
    chk3 = /\d/;
    return chk1.test(p) && chk2.test(p) && chk3.test(p);
}

function onlyNum(CheckNum) {

	var inText = CheckNum.value;
	var ret;

	for (var i=0; i < inText.length; i++) {
	ret = inText.charCodeAt(i);
	if ((ret < 48) || (ret > 57)) {
			alert("숫자만을 입력 하세요");
			CheckNum.value = "";
			CheckNum.focus();
			return false;
			}
	}
	return true;

}

/*function nextFocus(thisitem,cnt,nextitem) {
	if(thisitem.value.length  == cnt)
	nextitem.focus();
}*/

function SpaceRemove(data)
{
	for(i=0; i < data.length; i++) {
		if (data.charAt(i) == ' ') {
			alert("공백없이 입력하세요.");
		}
	}
}

/* 이메일 체크 */
function fnChkEmail()
{
	var Frm = document.form1;
	var sEmail = Frm.email1.value+"@"+Frm.email2.value+Frm.email3.value;

	if (Frm.email1.value.length<3) {
		window.alert("E-Mail을 3글자 이상 입력하세요.");
		Frm.email1.focus();
		return false;
	}

	if (sEmail == "") {
		window.alert("E-Mail을 입력하세요");
		Frm.email1.focus();
		return false;
	} else {

		if ( !isEmailId(Frm.email1) ) {
			alert("영문소문자, 숫자, -, _ 만 입력가능합니다.");
			return false;
		}
		//else if ( !isAlphaNumPoint(Frm.email3) ) {
		//	alert("알파벳, 숫자, 점만 입력가능합니다.");
		//	return false;
		//}
		else if (fn_IsEmail(sEmail)) {
			return true;
		} else {
			return false;
		}
	}
}

/* 이메일선택시 직접입력란을 안보이게 처리 */
function check2() {
	var Frm = document.form1;

	if(Frm.email2.value=="") {
		Frm.email3.style.visibility="visible";
	}
	else {
		Frm.email3.style.visibility="hidden";
		Frm.email3.value = "";
	}
}

/* 이메일 직접입력 onFocus() */
function fnEmailEtcF() {
	var Frm = document.form1;
	Frm.email2.value = "";
	Frm.email2.disabled = true;
}

/* 이메일 직접입력 onBlur() */
function fnEmailEtcB() {
	var Frm = document.form1;
	if (Frm.email2.value == "") {
		Frm.email2.disabled = false;
	} else {
		Frm.email2.value = "";
		Frm.email2.disabled = true;
	}
}

/* 이메일 직접/선택입력 처리 */
function email_change(sltObj)
{
	document.getElementById("email3").value = sltObj;
}

/*이메일 유효성 처리*/
/*function isEmail(s)
{
  return s.search(/^\s*[\w\~\-\.]+\@[\w\~\-]+(\.[\w\~\-]+)+\s*$/g)>=0;
}*/

/* 비밀번호 체크 */
function pwdlengchk(){
	var Frm = document.form1;

	if ((Frm.pwd.value.length<4)||(Frm.pwd.value.length>12)) {
		alert("비밀번호는 4~12자리 이어야 합니다.");
		Frm.pwd.focus();
	} else {
		return true;
	}
}


/* 비밀번호확인 체크 */
function fnChkPswdConf() {
	var Frm = document.form1;

	var objVal1 = Frm.pwd.value;
	var objVal2 = Frm.pwd1.value;

	if (objVal1 != objVal2) {
		window.alert("비밀번호가 일치하지 않습니다");
		Frm.pwd1.value = "";
		Frm.pwd1.focus();
		return false;
	} else {
		return true;
	}
}

/**
 * 입력값이 특정 문자(chars)만으로 되어있는지 체크
 * 특정 문자만 허용하려 할 때 사용
 * ex) if (!containsCharsOnly(form.blood,"ABO")) {
 *         alert("혈액형 필드에는 A,B,O 문자만 사용할 수 있습니다.");
 *     }
 */
function containsCharsOnly(input,chars) {
    for (var inx = 0; inx < input.value.length; inx++) {
       if (chars.indexOf(input.value.charAt(inx)) == -1)
           return false;
    }
    return true;
}

/**
 * 입력값이 알파벳,숫자, 점으로 되어있는지 체크
 */
function isAlphaNumPoint(input) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.";
    return containsCharsOnly(input,chars);
}


/**
 * 입력값이 알파벳,숫자로 되어있는지 체크
 */
function isAlphaNum(input) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    return containsCharsOnly(input,chars);
}

/**
 * 입력값이 영문소문자,숫자, -, _ 로 되어있는지 체크
 */
function isEmailId(input) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.";
    return containsCharsOnly(input,chars);
}

// 입력된 이메일주소 유효성 검사
function fn_IsEmail(EmailAddress) {
	var i, ch1, endPointCnt, atCnt, emailPntValue;
	endPointCnt=0;
	atCnt=0;

	for( i=0; i< EmailAddress.length; i++ ) {
        ch1 = EmailAddress.substring(i,i+1);
        if (ch1 == "@") {
            atCnt = atCnt + 1;
        }
    }

    for( i=0; i< EmailAddress.length; i++ ) {
        ch1 = EmailAddress.substring(i, i+1);
        if (ch1 == ".") {
            endPointCnt = endPointCnt + 1;
        }
    }

    if (atCnt == 0 || atCnt > 1) {
        alert("E-Mail 형식이 옳지 않습니다.");
        return false;
    } else {

	    email  = EmailAddress.split("@");
	    email1 = email[0];
	    email2 = email[1];

	    if( email1 == "" || email1.length <= 3 ) {
	        alert("E-Mail 형식이 옳지 않습니다.");
            return false;
        }
        else if( email2.substring( email2.length-1,  email2.length)=="."){
            alert("E-Mail 형식이 옳지 않습니다.");
            return false;
        }
        else {
	        if (email2 == "" ) {
	            alert("E-Mail 형식이 옳지 않습니다.");
                return false;

            } else {

                for( i=0; i< email2.length; i++ ) {
                    ch1 = email2.substring(i, i+1);
                    if (ch1 == ".") {

                        if(email2.substring(i+1, i+2)=="." ) {
                            alert("E-Mail 형식이 옳지 않습니다.");
                            return false;
                        }
                    }
                }

                if (endPointCnt < 1 ) {
                    alert("E-Mail 형식이 옳지 않습니다.");
                    return false;
                } else {
                    emailAddr  = email2.split(".");
	                emailAddr1 = emailAddr[0];
	                emailAddr2 = emailAddr[1];

	                if( emailAddr1 == "" || emailAddr2 == "" ) {
	                    alert("E-Mail 형식이 옳지 않습니다.");
                        return false;
                    } else {
                        return true;
                    }
                }
	        }
	    }
    }
}

function CheckStr(strOriginal, strFind, strChange){
    var position, strOri_Length;
    position = strOriginal.indexOf(strFind);

    while (position != -1){
      strOriginal = strOriginal.replace(strFind, strChange);
      position    = strOriginal.indexOf(strFind);
    }

    strOri_Length = strOriginal.length;
    return strOri_Length;
}

// 스트링 양쪽 빈칸(space character) 삭제 루틴

function TrimAll(data)
{
	/*
	var lszTrim = data;
	var i,j;

	// 왼쪽 트림

	j = 0;
	for(i=0;i<data.length;i++)
	{
		if(data.charAt(i) != ' ') {
			j = i;
			break;
		}
	}

	lszTrim = (data.substring(j,data.length));

	data = lszTrim;

	// 오른쪽 트림

	for(i=data.length-1;i>=0;i--) {
		if(data.charAt(i) != ' ') {
			j = i;
			break;
		}
	}

	lszTrim = (data.substring(0,j+1));

	return lszTrim;
	*/
	return data.replace(/(^\s+)|(\s+)$/,"");

};

// 스페이스 없애 버리기
function EraseSpace(data)
{
	var lszES;
	var i;

	lszES = "";
	for(i=0;i<data.length;i++) {
		if(data.charAt(i) != ' ') {
			lszES = lszES + (data.substring(i,i+1));
		}
	}
	return lszES;
};

// 주어진 문자열이 숫자로만 이루어져있는지 검사한다.
function is_num(data)
{
	if (!is_nullstring(data)) {
		for (j = 0; j < data.length; j++)
			if (((data.substring(j, j+1) < "0") || (data.substring(j, j+1) > "9")))
				return false;
	}
	else {
		return true;
	}
	return true;
}

// 주어진 문자열이 영문 + 숫자로만 이루어져 있는지를 검사한다.
function IsAlphaNumeric(chkalpa) {

	var chkok = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (i=0; i < chkalpa.length; i++){
    	ch = chkalpa.charAt(i);
        for (j=0; j < chkok.length; j++)
    	    if (ch == chkok.charAt(j))
        	    break;
        if (j == chkok.length){
         	return(false);
            break;
        }
    }
    return(true);
}

// 주어진 문자열이 숫자와 특정문자로만 이루어져있는지 검사한다.
function is_num_str(data,str)
{
	if (!is_nullstring(data)) {
		for (j = 0; j < data.length; j++)
			if ((data.substring(j, j+1) != str) && ((data.substring(j, j+1) < "0") || (data.substring(j, j+1) > "9")))
				return false;
	}
	else {
		return true;
	}
	return true;
}

function CheckSsn(ssn1,ssn2)
{
	var result=0,i=0;
	var ssn=ssn1+ssn2;

	for(i=2;i<10;i++) result+=(ssn.charAt(i-2)*i);
	for(i=2;i<6;i++) result+=(ssn.charAt(i+6)*i);
	result=result%11;

	if(result==0) {
		if(ssn.charAt(12)==1) return true;
		else return false;
	}
	else {
		if(result==1) {
			if(ssn.charAt(12)==0) return true;
			else return false;
		}
		else {
			if(ssn.charAt(12)==(11-result)) return true;
			else return false;
		}
	}
}

// 한글은 2자로 영문은 1자로 해서 글씨의 크기를 알아내는 함수
function str_size(str)
{
	len_str = str.length;

	len_size = 0;

	for(i=0;i<len_str;i++) {
		if (str.charCodeAt(i) > 255)
		{
			len_size+=2;
		}
		else
		{
			len_size++;
		}
	}
	return len_size;
};

// 널 스트링인가를 비교하는 함수
function is_nullstring(str)
{
	if(str_size(TrimAll(str)) == 0) return true;
	else return false;
};

// 특정크기를 넘었는가 비교하는 함수
function is_maxsize(str, max_length)
{
	if(str_size(TrimAll(str)) > max_length) return true;
	else return false;
};

//이메일 검사
// Changes:  Sandeep V. Tamhankar (stamhankar@hotmail.com)

/* 1.1.2: Fixed a bug where trailing . in e-mail address was passing
            (the bug is actually in the weak regexp engine of the browser; I
            simplified the regexps to make it work).
   1.1.1: Removed restriction that countries must be preceded by a domain,
            so abc@host.uk is now legal.  However, there's still the
            restriction that an address must end in a two or three letter
            word.
     1.1: Rewrote most of the function to conform more closely to RFC 822.
     1.0: Original  */

//Begin
function emailCheck (emailStr) {
/* The following pattern is used to check if the entered e-mail address
   fits the user@domain format.  It also is used to separate the username
   from the domain. */
var emailPat=/^(.+)@(.+)$/
/* The following string represents the pattern for matching all special
   characters.  We don't want to allow special characters in the address.
   These characters include ( ) < > @ , ; : \ " . [ ]    */
var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
/* The following string represents the range of characters allowed in a
   username or domainname.  It really states which chars aren't allowed. */
var validChars="\[^\\s" + specialChars + "\]"
/* The following pattern applies if the "user" is a quoted string (in
   which case, there are no rules about which characters are allowed
   and which aren't; anything goes).  E.g. "jiminy cricket"@disney.com
   is a legal e-mail address. */
var quotedUser="(\"[^\"]*\")"
/* The following pattern applies for domains that are IP addresses,
   rather than symbolic names.  E.g. joe@[123.124.233.4] is a legal
   e-mail address. NOTE: The square brackets are required. */
var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
/* The following string represents an atom (basically a series of
   non-special characters.) */
var atom=validChars + '+'
/* The following string represents one word in the typical username.
   For example, in john.doe@somewhere.com, john and doe are words.
   Basically, a word is either an atom or quoted string. */
var word="(" + atom + "|" + quotedUser + ")"
// The following pattern describes the structure of the user
var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
/* The following pattern describes the structure of a normal symbolic
   domain, as opposed to ipDomainPat, shown above. */
var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")


/* Finally, let's start trying to figure out if the supplied address is
   valid. */

/* Begin with the coarse pattern to simply break up user@domain into
   different pieces that are easy to analyze. */
var matchArray=emailStr.match(emailPat)
if (matchArray==null) {
  /* Too many/few @'s or something; basically, this address doesn't
     even fit the general mould of a valid e-mail address. */
        //alert("Email address seems incorrect (check @ and .'s)")
        return false
}
var user=matchArray[1]
var domain=matchArray[2]

// See if "user" is valid
if (user.match(userPat)==null) {
    // user is not valid
    //alert("The username doesn't seem to be valid.")
    return false
}

/* if the e-mail address is at an IP address (as opposed to a symbolic
   host name) make sure the IP address is valid. */
var IPArray=domain.match(ipDomainPat)
if (IPArray!=null) {
    // this is an IP address
          for (var i=1;i<=4;i++) {
            if (IPArray[i]>255) {
                //alert("Destination IP address is invalid!")
                return false
            }
    }
    return true
}

// Domain is symbolic name
var domainArray=domain.match(domainPat)
if (domainArray==null) {
        //alert("The domain name doesn't seem to be valid.")
    return false
}

/* domain name seems valid, but now make sure that it ends in a
   three-letter word (like com, edu, gov) or a two-letter word,
   representing country (uk, nl), and that there's a hostname preceding
   the domain or country. */

/* Now we need to break up the domain to get a count of how many atoms
   it consists of. */
var atomPat=new RegExp(atom,"g")
var domArr=domain.match(atomPat)
var len=domArr.length
if (domArr[domArr.length-1].length<2 ||
    domArr[domArr.length-1].length>4) {
   // the address must end in a two letter or three letter word.
   //alert("The address must end in a three-letter domain, or two letter country.")
   return false
}

// Make sure there's a host name preceding the domain.
if (len<2) {
   var errStr="This address is missing a hostname!"
   //alert(errStr)
   return false
}

// If we've gotten this far, everything's valid!
return true;
}
//  End

function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  var obj1
  for (i=0; i<(args.length-2); i+=3)
	if ((obj=document.getElementById(args[i]))!=null) {
		v=args[i+2];
		if (obj.style) {
			obj=obj.style;
			v=(v=='show')?'visible':(v='hide')?'hidden':v;
			}
		obj.visibility=v;
		if (v == "visible")
			obj1 = document.getElementById(args[i])
	}
}


function selReceipts(start, end, curr) {
	for(i=start; i<=end; i++) {
		MM_showHideLayers('pay'+i,'','hide');
	}
	MM_showHideLayers('pay'+curr,'','show');
}


////////////////////////// 팝업창 띄우기 //////////////////////////////
function popWin(url,winname,wwidth,wheight, scrollbar) {
	var conWidth = wwidth; conHeight = wheight;

	if(wwidth == null && wheight == null) {
		conWidth = 100;
		wHeight = 150;
	}
	conWidth = (screen.Width) / 2 - conWidth;
	conHeight = (screen.Height) / 2 - conHeight;
	focusWin= window.open(url,winname,'left=20' + ',top=20' + ',width=' + wwidth + ',height=' + wheight + ',scrollbars=' + scrollbar + ',resizable=no');
	focusWin.focus();
}
//-->