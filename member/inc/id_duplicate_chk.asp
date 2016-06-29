<article class="popup_wrap id_chk_pop" style="visibility:hidden;">
    <div class="dim-bg"></div>
    <div class="pop">

    <!-- 아이디 중복확인 -->
        <div class="content">
            <h2>아이디 중복확인</h2>
            <form name="id_dup_form" action="" method="post" class="join_form">
                <label for="id_dup_chk" class="id_dup_chkLa">아이디</label>
                <input type="text" id="id_dup_chk" class="id_dup_chk" name="id_dup_chk" placeholder="6~14자의 영문,영문+숫자 사용" />

                <p class="explan_text center">
                    사용하고자 하는 아이디를 입력 후<br/>
                    중복확인 버튼을 클릭하세요.
                </p>
                <span class="cert_btn_box">
                    <a href="#" class="btn id_dup ok_btn">중복확인</a>
                    <a href="#" class="btn id_dup cancel_btn">취소</a>
                </span>
                <a href="#none" class="popup_close-btn">팝업 닫기버튼</a>
            </form>
        </div>

     <!--아이디 사용가능-->
        <!--<div class="content">-->
            <!--<h2>아이디 중복확인</h2>-->
            <!--<form name="id_dup_true_form" action="" method="post" class="join_form">-->
                <!--<label for="id_dup_chk" class="id_dup_chkLa">아이디</label>-->
                <!--<input type="text" id="id_dup_chk" class="id_dup_chk" name="id_dup_chk" value="abcd1234" />-->

                <!--<div class="explan_text02">-->
                    <!--<em>사용가능</em>-->
                    <!--<span class="text">사용할 수 있는 아이디입니다</span>-->
                <!--</div>-->
                <!--<span class="cert_btn_box">-->
                    <!--<a href="#none" class="btn id_dup_true ok_btn">확인</a>-->
                    <!--<a href="#none" class="btn cancel_btn">취소</a>-->
                <!--</span>-->
                <!--<a href="#none" class="popup_close-btn">팝업 닫기버튼</a>-->
            <!--</form>-->
        <!--</div>-->

    <!-- 아이디 사용불가 -->
        <!--<div class="content">-->
            <!--<h2>아이디 중복확인</h2>-->
            <!--<form name="id_dup_form" action="" method="post" class="join_form">-->
                <!--<label for="id_dup_chk" class="id_dup_chkLa">아이디</label>-->
                <!--<input type="text" id="id_dup_chk" class="id_dup_chk" name="id_dup_chk" value="abcd1234" readonly="readonly" />-->

                <!--<div class="explan_text02">-->
                    <!--<em>사용불가</em>-->
                    <!--<span class="text">이미 사용중인 아이디입니다</span>-->
                <!--</div>-->
                <!--<a href="#none" class="cancel_btn">취소</a>-->
                <!--<a href="#none" class="popup_close-btn">팝업 닫기버튼</a>-->
            <!--</form>-->
        <!--</div>-->

    </div>
</article>

<script>
$(".id_dup.ok_btn").on("click", function(){
    var form = document.join_form;
    var id_dup_form = document.id_dup_form;
    var id_dup_true_form = document.id_dup_true_form;
    if(id_dup_form.id_dup_chk.value.length < 6 || id_dup_form.id_dup_chk.value.length > 14){
        alert("아이디는 6~14자 이하로 입력해 주세요");
    }else{
        $(form.id).val(id_dup_form.id_dup_chk.value);
        $(this).closest(".popup_wrap").css("visibility","hidden");
    }
});

$(".id_dup_true.ok_btn").on("click", function(){
    var form = document.join_form;
    var id_dup_form = document.id_dup_form;
    var id_dup_true_form = document.id_dup_true_form;
    if(id_dup_true_form.id_dup_chk.value.length < 6 || id_dup_true_form.id_dup_chk.value.length > 14){
        alert("아이디는 6~14자 이하로 입력해 주세요");
    }else{
        $(form.id).val(id_dup_true_form.id_dup_chk.value);
        pop_close();
    }
});
</script>