$(document).ready(function(){

    //아이디저장하기 클릭시 쿠키값 저장 해제시 쿠키삭제
    (function(){
        $(".id_save").click(function(){
            //체크 해제했을때 idSave 쿠키삭제
            if($(".id_saveLa").css("background-position") == "-36px 0px"){
                document.cookie = "idSave=chk;expires=Fri, 1 Feb 2000 00:00:00 GMT; path=/"
            }
            //체크했을때 idSave 쿠키저장
            else if($(".id_saveLa").css("background-position") == "-58px 0px"){
                document.cookie = "idSave=chk;expires=Fri, 1 Feb 2100 00:00:00 GMT; path=/"
            }
        });
    })();

    //회원약관페이지 동의여부 체크확인
    (function(){
        $(".agree_btn").on("click", function(){
            var terms_agree = $(".terms_agreeLa").css("background-position");
            var policy_agree = $(".policy_agreeLa").css("background-position");
            var no_chk  = "-36px 0px";

            if(terms_agree == no_chk){
                alert("이용약관 동의에 체크해주세요");
            }else if(policy_agree == no_chk){
                alert("개인정보보호정책에 체크해주세요");
            }else{
                location.href = "http://www.koreanfolk.co.kr/mobile/member/join_auth_select.asp";
            }
        });
        //동의하지않습니다 클릭시 이전페이지로 이동
        $(".no-agree_btn, .cancel_btn").on("click", function(){
            history.go(-2);
        });
        $(".qna-list-btn").on("click", function(){
            location.href = "http://www.koreanfolk.co.kr/mobile/mypage/qna_list.asp";
        });
    })();

    //셀렉트박스 클릭시 input val값으로 넘기기
    function select_box(){
        var select_email = $("select.email_03");
        select_email.change(function(){
            var select_name = $(this).children("option:selected").text();
            $(this).siblings(".email_02").val(select_name);
        });
    }
    select_box();

    //console.log("~~");
});