<article class="popup_wrap post_pop" style="visibility:hidden;">
    <div class="dim-bg"></div>
    <div class="pop">

    <!-- 우편번호검색 -->
        <div class="content">
            <h2>우편번호 검색</h2>
            <form name="post_form" action="" method="post" class="join_form">
                <p class="explan_text">찾고 싶으신 주소의 지번/도로명을 입력하세요.</p>
                <div class="check_box_wrap">
                    <input type="checkbox" id="solar_pop" class="solar_pop" name="solar_pop" value="solar_pop">
                    <label for="solar_pop" class="solar_popLa"></label>
                    <span class="text mr25">지번</span>

                    <input type="checkbox" id="lunar_pop" class="lunar_pop" name="lunar_pop" value="lunar_pop">
                    <label for="lunar_pop" class="lunar_popLa"></label>
                    <span class="text">도로명</span>
                </div>
                <label for="address">지번/도로명</label>
                <input type="text" id="address" class="address" name="address" placeholder="주소를 입력해주세요" />
                <label for="search_btn" class="hidden">지번 도로명</label>
                <!--<input type="submit" id="search_btn" class="search_btn" name="search_btn" value="검색" />-->
                <a href="#none" class="search_btn">검색</a>

                <div class="explan">
                    <span class="title">지번 주소 :</span>
                    <span class="text">
                        동/읍/면/리 이름을 입력하세요<br/>
                        예) 역삼동, 화도읍
                    </span>
                </div>
                <div class="explan mt10">
                    <span class="title">도로명 주소 :</span>
                    <span class="text">
                        도로명을 입력하세요<br/>
                        예) 중앙로, 불정로432번길
                    </span>
                </div>
                <a href="#none" class="popup_close-btn">팝업 닫기버튼</a>
            </form>
        </div>

    <!-- 우편번호검색 성공 -->
        <!--<div class="content">-->
            <!--<h2>우편번호 검색</h2>-->
            <!--<form name="post_true_form" action="" method="post" class="join_form">-->
                <!--<p class="explan_text">찾고 싶으신 주소의 지번/도로명을 입력하세요.</p>-->
                <!--<div class="check_box_wrap">-->
                    <!--<input type="checkbox" id="solar_pop" class="solar_pop" name="solar_pop" value="solar_pop">-->
                    <!--<label for="solar_pop"></label>-->
                    <!--<span class="text mr25">지번</span>-->

                    <!--<input type="checkbox" id="lunar_pop" class="lunar_pop" name="lunar_pop" value="lunar_pop">-->
                    <!--<label for="lunar_pop"></label>-->
                    <!--<span class="text">도로명</span>-->
                <!--</div>-->
                <!--<label for="address">지번/도로명</label>-->
                <!--<input type="text" id="address" class="address" name="address" value="신사동" readonly="readonly"/>-->
                <!--<div class="add_search_result">-->
                    <!--<p class="explan_text">주소를 선택하면 자동으로 입력됩니다.</p>-->
                    <!--<em>주소</em>-->
                    <!--<ul class="add_list">-->
                        <!--<li>서울 강남구 신사동</li>-->
                        <!--<li>서울 강남구 신사동 501~514</li>-->
                        <!--<li>서울 강남구 신사동 515~532</li>-->
                        <!--<li>서울 강남구 신사동 515~532</li>-->
                        <!--<li>서울 강남구 신사동 515~532</li>-->
                        <!--<li>서울 강남구 신사동 541~544</li>-->
                        <!--<li>서울 강남구 신사동 555~552</li>-->
                    <!--</ul>-->
                <!--</div>-->
            <!--</form>-->
            <!--<a href="#none" class="popup_close-btn">팝업 닫기버튼</a>-->
        <!--</div>-->

    <!-- 우편번호검색  실패 -->
        <!--<div class="content">-->
            <!--<h2>우편번호 검색</h2>-->
            <!--<form name="post_false_form" action="" method="post" class="join_form">-->
                <!--<p class="explan_text">찾고 싶으신 주소의 지번/도로명을 입력하세요.</p>-->
                <!--<div class="check_box_wrap">-->
                    <!--<input type="checkbox" id="solar_pop" class="solar_pop" name="solar_pop" value="solar_pop">-->
                    <!--<label for="solar_pop"></label>-->
                    <!--<span class="text mr25">지번</span>-->
    <!---->
                    <!--<input type="checkbox" id="lunar_pop" class="lunar_pop" name="lunar_pop" value="lunar_pop">-->
                    <!--<label for="lunar_pop"></label>-->
                    <!--<span class="text">도로명</span>-->
                <!--</div>-->
                <!--<label for="address">지번/도로명</label>-->
                <!--<input type="text" id="address" class="address" name="address" value="신사동" readonly="readonly"/>-->
                <!--<div class="add_search_result">-->
                    <!--<p class="explan_text">주소를 선택하면 자동으로 입력됩니다.</p>-->
                    <!--<em>주소</em>-->
                    <!--<span class="search_fail_text">검색결과가 없습니다.</span>-->
                <!--</div>-->
                <!--<div class="explan mt15">-->
                    <!--<span class="title">지번 주소 :</span>-->
                    <!--<span class="text">-->
                        <!--동/읍/면/리 이름을 입력하세요<br/>-->
                        <!--예) 역삼동, 화도읍-->
                    <!--</span>-->
                <!--</div>-->
                <!--<div class="explan mt10">-->
                    <!--<span class="title">도로명 주소 :</span>-->
                    <!--<span class="text">-->
                        <!--도로명을 입력하세요<br/>-->
                        <!--예) 중앙로, 불정로432번길-->
                    <!--</span>-->
                <!--</div>-->
            <!--</form>-->
            <!--<a href="#none" class="popup_close-btn">팝업 닫기버튼</a>-->
        <!--</div>-->

    </div>
</article>

<script>
//우편번호검색 성공
var add_list_item = $(".add_list li");
$(add_list_item).on("click", function(){
    var form = document.join_form;
    var post_true_form = document.post_true_form;
    var str = $(this).text();
    $(form.add_02).val(str);
    $(this).closest(".popup_wrap").css("visibility","hidden");
});

//우편번호검색
$(".search_btn").on("click", function(){
    var post_form = document.post_form;
    if($(".solar_popLa").css("background-position") == "-36px 0px" && $(".lunar_popLa").css("background-position") == "-36px 0px"){
        alert("지번과 도로명을 선택해 주세요");
    }else if($(".solar_popLa").css("background-position") == "-58px 0px" && $(".lunar_popLa").css("background-position") == "-58px 0px"){
        alert("지번과 도로명중 하나만 선택해 주세요");
    }
    else if(post_form.address.value == false){
        alert("주소를 입력해 주세요");
    }
});
</script>