<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>아이디·비밀번호 찾기</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <div class="head-title_02">
                <h4>회원가입 인증 - 만 14세미만 정보 입력</h4>
                <span class="text">
                    한국민속촌은 회원님의 정보를 안전하게 보호하기 위해서
                    본인인증 절차를 시행하고 있습니다.
                </span>
            </div>
            <form name="join_form" action="" method="post" class="join_form">
                <label for="name" class="nameLa">이름</label>
                <input type="text" id="name" class="name" name="name" placeholder="이름" />
                <label for="sex" class="nameLa">성별</label>
                <input type="text" id="sex" class="sex" name="sex" placeholder="남" />

                <label for="birth_date_01">생년월일</label>
                <div class="select_box birth_date_box">
                    <div class="select">
                        <select name="birth_date_01" class="birth_date_01">
                            <option value="">년도</option>
                            <option value="2002">2002년</option>
                            <option value="2001">2001년</option>
                            <option value="2000">2000년</option>
                            <option value="1999">1999년</option>
                            <option value="1998">1998년</option>
                            <option value="1997">1997년</option>
                            <option value="1996">1996년</option>
                            <option value="1995">1995년</option>
                            <option value="1994">1994년</option>
                            <option value="1993">1993년</option>
                            <option value="1992">1992년</option>
                            <option value="1991">1991년</option>
                            <option value="1990">1990년</option>
                            <option value="1989">1989년</option>
                            <option value="1988">1988년</option>
                            <option value="1987">1987년</option>
                            <option value="1986">1986년</option>
                            <option value="1985">1985년</option>
                            <option value="1984">1984년</option>
                            <option value="1983">1983년</option>
                            <option value="1982">1982년</option>
                            <option value="1981">1981년</option>
                            <option value="1980">1980년</option>
                            <option value="1979">1979년</option>
                            <option value="1978">1978년</option>
                            <option value="1977">1977년</option>
                            <option value="1976">1976년</option>
                            <option value="1975">1975년</option>
                            <option value="1974">1974년</option>
                            <option value="1973">1973년</option>
                            <option value="1972">1972년</option>
                            <option value="1971">1971년</option>
                            <option value="1970">1970년</option>
                            <option value="1969">1969년</option>
                            <option value="1968">1968년</option>
                            <option value="1967">1967년</option>
                            <option value="1966">1966년</option>
                            <option value="1965">1965년</option>
                            <option value="1964">1964년</option>
                            <option value="1963">1963년</option>
                            <option value="1962">1962년</option>
                            <option value="1961">1961년</option>
                            <option value="1960">1960년</option>
                            <option value="1959">1959년</option>
                            <option value="1958">1958년</option>
                            <option value="1957">1957년</option>
                            <option value="1956">1956년</option>
                            <option value="1955">1955년</option>
                            <option value="1954">1954년</option>
                            <option value="1953">1953년</option>
                            <option value="1952">1952년</option>
                            <option value="1951">1951년</option>
                            <option value="1950">1950년</option>
                            <option value="1949">1949년</option>
                            <option value="1948">1948년</option>
                            <option value="1947">1947년</option>
                            <option value="1946">1946년</option>
                            <option value="1945">1945년</option>
                            <option value="1944">1944년</option>
                            <option value="1943">1943년</option>
                            <option value="1942">1942년</option>
                            <option value="1941">1941년</option>
                            <option value="1940">1940년</option>
                            <option value="1939">1939년</option>
                            <option value="1938">1938년</option>
                            <option value="1937">1937년</option>
                            <option value="1936">1936년</option>
                            <option value="1935">1935년</option>
                            <option value="1934">1934년</option>
                            <option value="1933">1933년</option>
                            <option value="1932">1932년</option>
                            <option value="1931">1931년</option>
                            <option value="1930">1930년</option>
                            <option value="1929">1929년</option>
                            <option value="1928">1928년</option>
                            <option value="1927">1927년</option>
                            <option value="1926">1926년</option>
                            <option value="1925">1925년</option>
                            <option value="1924">1924년</option>
                            <option value="1923">1923년</option>
                            <option value="1922">1922년</option>
                            <option value="1921">1921년</option>
                            <option value="1920">1920년</option>
                            <option value="1919">1919년</option>
                            <option value="1918">1918년</option>
                            <option value="1917">1917년</option>
                            <option value="1916">1916년</option>
                            <option value="1915">1915년</option>
                            <option value="1914">1914년</option>
                            <option value="1913">1913년</option>
                            <option value="1912">1912년</option>
                            <option value="1911">1911년</option>
                            <option value="1910">1910년</option>
                            <option value="1909">1909년</option>
                            <option value="1908">1908년</option>
                            <option value="1907">1907년</option>
                            <option value="1906">1906년</option>
                            <option value="1905">1905년</option>
                            <option value="1904">1904년</option>
                            <option value="1903">1903년</option>
                            <option value="1902">1902년</option>
                            <option value="1901">1901년</option>
                            <option value="1900">1900년</option>
                        </select>
                    </div>
                    <div class="select">
                        <select name="birth_date_02" class="birth_date_02">
                            <option value="">월</option>
                            <option value="01">1월</option>
                            <option value="02">2월</option>
                            <option value="03">3월</option>
                            <option value="04">4월</option>
                            <option value="05">5월</option>
                            <option value="06">6월</option>
                            <option value="07">7월</option>
                            <option value="08">8월</option>
                            <option value="09">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                    </div>
                    <div class="select">
                        <select name="birth_date_03" class="birth_date_03">
					        <option value="">일</option>
                        </select>
                    </div>
                </div>

                <label for="parent_name" class="parent_nameLa">보호자 이름</label>
                <input type="text" id="parent_name" class="parent_name" name="parent_name" placeholder="이름" />
                <!--휴대폰인증시 보호자이름 미리입력됨 아래 input참조 생년월일,성별,휴대폰,이메일이 자동입력 휴대폰인증만 해당-->
                <!--<input type="text" id="parent_name" class="parent_name" name="parent_name" value="지병민" />-->
                <label for="parent_sex" class="nameLa">보호자 성별</label>
                <input type="text" id="parent_sex" class="parent_sex" name="parent_sex" placeholder="남" />

                <label for="parent_birth_date_01">보호자 생년월일</label>
                <div class="select_box birth_date_box">
                    <div class="select">
                        <select name="parent_birth_date_01" class="birth_date_01">
                            <option value="">년도</option>
                            <option value="2002">2002년</option>
                            <option value="2001">2001년</option>
                            <option value="2000">2000년</option>
                            <option value="1999">1999년</option>
                            <option value="1998">1998년</option>
                            <option value="1997">1997년</option>
                            <option value="1996">1996년</option>
                            <option value="1995">1995년</option>
                            <option value="1994">1994년</option>
                            <option value="1993">1993년</option>
                            <option value="1992">1992년</option>
                            <option value="1991">1991년</option>
                            <option value="1990">1990년</option>
                            <option value="1989">1989년</option>
                            <option value="1988">1988년</option>
                            <option value="1987">1987년</option>
                            <option value="1986">1986년</option>
                            <option value="1985">1985년</option>
                            <option value="1984">1984년</option>
                            <option value="1983">1983년</option>
                            <option value="1982">1982년</option>
                            <option value="1981">1981년</option>
                            <option value="1980">1980년</option>
                            <option value="1979">1979년</option>
                            <option value="1978">1978년</option>
                            <option value="1977">1977년</option>
                            <option value="1976">1976년</option>
                            <option value="1975">1975년</option>
                            <option value="1974">1974년</option>
                            <option value="1973">1973년</option>
                            <option value="1972">1972년</option>
                            <option value="1971">1971년</option>
                            <option value="1970">1970년</option>
                            <option value="1969">1969년</option>
                            <option value="1968">1968년</option>
                            <option value="1967">1967년</option>
                            <option value="1966">1966년</option>
                            <option value="1965">1965년</option>
                            <option value="1964">1964년</option>
                            <option value="1963">1963년</option>
                            <option value="1962">1962년</option>
                            <option value="1961">1961년</option>
                            <option value="1960">1960년</option>
                            <option value="1959">1959년</option>
                            <option value="1958">1958년</option>
                            <option value="1957">1957년</option>
                            <option value="1956">1956년</option>
                            <option value="1955">1955년</option>
                            <option value="1954">1954년</option>
                            <option value="1953">1953년</option>
                            <option value="1952">1952년</option>
                            <option value="1951">1951년</option>
                            <option value="1950">1950년</option>
                            <option value="1949">1949년</option>
                            <option value="1948">1948년</option>
                            <option value="1947">1947년</option>
                            <option value="1946">1946년</option>
                            <option value="1945">1945년</option>
                            <option value="1944">1944년</option>
                            <option value="1943">1943년</option>
                            <option value="1942">1942년</option>
                            <option value="1941">1941년</option>
                            <option value="1940">1940년</option>
                            <option value="1939">1939년</option>
                            <option value="1938">1938년</option>
                            <option value="1937">1937년</option>
                            <option value="1936">1936년</option>
                            <option value="1935">1935년</option>
                            <option value="1934">1934년</option>
                            <option value="1933">1933년</option>
                            <option value="1932">1932년</option>
                            <option value="1931">1931년</option>
                            <option value="1930">1930년</option>
                            <option value="1929">1929년</option>
                            <option value="1928">1928년</option>
                            <option value="1927">1927년</option>
                            <option value="1926">1926년</option>
                            <option value="1925">1925년</option>
                            <option value="1924">1924년</option>
                            <option value="1923">1923년</option>
                            <option value="1922">1922년</option>
                            <option value="1921">1921년</option>
                            <option value="1920">1920년</option>
                            <option value="1919">1919년</option>
                            <option value="1918">1918년</option>
                            <option value="1917">1917년</option>
                            <option value="1916">1916년</option>
                            <option value="1915">1915년</option>
                            <option value="1914">1914년</option>
                            <option value="1913">1913년</option>
                            <option value="1912">1912년</option>
                            <option value="1911">1911년</option>
                            <option value="1910">1910년</option>
                            <option value="1909">1909년</option>
                            <option value="1908">1908년</option>
                            <option value="1907">1907년</option>
                            <option value="1906">1906년</option>
                            <option value="1905">1905년</option>
                            <option value="1904">1904년</option>
                            <option value="1903">1903년</option>
                            <option value="1902">1902년</option>
                            <option value="1901">1901년</option>
                            <option value="1900">1900년</option>
                        </select>
                    </div>
                    <div class="select">
                        <select name="parent_birth_date_02" class="birth_date_02">
                            <option value="">월</option>
                            <option value="01">1월</option>
                            <option value="02">2월</option>
                            <option value="03">3월</option>
                            <option value="04">4월</option>
                            <option value="05">5월</option>
                            <option value="06">6월</option>
                            <option value="07">7월</option>
                            <option value="08">8월</option>
                            <option value="09">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                    </div>
                    <div class="select">
                        <select name="parent_birth_date_03" class="birth_date_03">
					        <option value="">일</option>
                        </select>
                    </div>
                </div>

                <div class="check_box_wrap">
                    <input type="checkbox" id="solar" class="solar" name="solar" value="solar">
                    <label for="solar"></label>
                    <span class="text mr25">양력</span>

                    <input type="checkbox" id="lunar" class="lunar" name="lunar" value="lunar">
                    <label for="lunar"></label>
                    <span class="text">음력</span>
                </div>

                <label for="id">아이디</label>
                <input type="text" id="id" class="id" name="id" placeholder="6~14자의 영문,영문+숫자만 사용합니다" />

                <a href="#" class="btn id_chk_btn">아이디 중복확인</a>

                <label for="pw">비밀번호</label>
                <input type="text" id="pw" class="pw" name="pw" placeholder="6~14자의 영문,영문+숫자만 사용합니다" />
                <label for="pw_chk">비밀번호 확인</label>
                <input type="text" id="pw_chk" class="pw_chk" name="pw_chk" placeholder="비밀번호를 한번 더 입력해주십시오" />

                <div class="address_wrap">
                    <label for="add_01">주소</label>
                    <span class="add_01_box">
                        <input type="text" id="add_01" class="add_01" name="add_01" placeholder="우편번호" readonly="readonly" />
                        <!--<input type="submit" name="add_search_btn" class="add_search_btn" value="우편번호 찾기" />-->
                        <a href="#" class="add_search_btn">우편번호 찾기</a>
                    </span>
                    <input type="text" id="add_02" class="add_02" name="add_02" readonly="readonly" />
                    <input type="text" id="add_03" class="add_03" name="add_03" />
                </div>

                <label for="tel">전화번호</label>
                <div class="select_box tel_box">
                    <select name="tel_01" class="tel_01">
                        <option value="">선택</option>
                        <option value="02">02</option>
                        <option value="031">031</option>
                        <option value="032">032</option>
                        <option value="033">033</option>
                        <option value="041">041</option>
                        <option value="042">042</option>
                        <option value="043">043</option>
                        <option value="051">051</option>
                        <option value="052">052</option>
                        <option value="053">053</option>
                        <option value="054">054</option>
                        <option value="055">055</option>
                        <option value="061">061</option>
                        <option value="062">062</option>
                        <option value="063">063</option>
                        <option value="064">064</option>
                        <option value="0502">0502</option>
                        <option value="0505">0505</option>
                        <option value="0506">0506</option>
                        <option value="070">070</option>
                    </select>
                    <input type="text" id="tel_02" class="tel_02" name="tel_02" placeholder="전화번호" />
                </div>

                <label for="phone">휴대폰 번호</label>
                <div class="select_box phone_box">
                    <select name="phone_01" class="phone_01">
                        <option value="선택">선택</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    <input type="text" id="phone_02" class="phone_02" name="phone_02" placeholder="휴대폰 번호" />
                </div>
                <div class="check_box_wrap">
                    <input type="checkbox" id="sms" class="sms" name="sms" value="sms">
                    <label for="sms"></label>
                    <span class="text">SMS 수신동의</span>
                </div>

                <div class="select_box email_box">
                    <label for="email_01">이메일</label>
                    <input type="text" id="email_01" class="email_01" name="email_01" placeholder="이메일 아이디" />
                    <span class="text_at">@</span>
                    <input type="text" id="email_02" class="email_02" name="email_02" placeholder="이메일 주소" />
                    <select name="email_03" class="email_03">
                        <option value="직접입력">직접입력</option>
                        <option value="dreanwiz.com">dreanwiz.com</option>
                        <option value="empal.com">empal.com</option>
                        <option value="freechal.com">freechal.com</option>                    
                        <option value="korea.com">korea.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="paran.com">paran.com</option>
                        <option value="unitel.co.kr">unitel.co.kr</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                    </select>
                </div>
                <div class="check_box_wrap">
                    <input type="checkbox" id="news_letter" class="news_letter" name="news_letter" value="news_letter">
                    <label for="news_letter"></label>
                    <span class="text">뉴스레터 수신동의</span>
                </div>

                <ul class="caution">
                    <li>
                        <span class="icon">*</span>
                        <span>이메일 주소는 아이디/비밀번호 찾기시 이용되오니 정확히 입력하시기 바랍니다.</span>
                    </li>
                    <li>
                        <span class="icon">*</span>
                        <span>주문관련내용은 기본 발송 사항으로 이메일과 SMS로 발송됩니다.</span>
                    </li>
                </ul>
                <span class="cert_btn_box">
                    <a href="#none" class="btn join_ok_btn ok_btn">확인</a>
                    <a href="#none" class="btn cancel_btn">취소</a>
                </span>
            </form>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!-- 아이디중복확인 팝업-->
<!--#include virtual="/mobile/member/inc/id_duplicate_chk.asp" -->

<!-- 우편번호 찾기 팝업-->
<!--#include virtual="/mobile/member/inc/post_search.asp" -->

<script>
    //아이디중복확인 팝업 취소버튼 클릭시 팝업사라짐
    function pop_close(){
        $(".id_dup.cancel_btn, .cancel_btn").on("click", function(){
            $(this).closest(".popup_wrap").css("visibility","hidden");
        });
        $(".id_dup_true.ok_btn, .popup_close-btn").on("click", function(){
            $(this).closest(".popup_wrap").css("visibility","hidden");
        });
    };
    pop_close();

    $(".join_ok_btn").on("click", function(){
        var form = document.join_form;
        var id_dup_form = document.id_dup_form;
        var id_dup_true_form = document.id_dup_true_form;
        var post_form = document.post_form;

        if(form.name.value == false){
            alert("이름을 입력해 주세요");
        }else if(form.sex.value == false){
            alert("성별을 입력해 주세요");
        }
        else if(form.birth_date_01.value == false){
            alert("년도를 선택해 주세요");
        }else if(form.birth_date_02.value == false){
            alert("월을 선택해 주세요");
        }else if(form.birth_date_03.value == false){
             lert("일을 선택해 주세요");
        }
        else if(form.parent_name.value == false){
            alert("보호자 이름을 입력해 주세요");
        }
        else if(form.parent_sex.value == false){
            alert("보호자 성별을 입력해 주세요");
        }
        else if(form.parent_birth_date_01.value == false){
            alert("보호자 년도를 선택해 주세요");
        }else if(form.parent_birth_date_02.value == false){
            alert("보호자 월을 선택해 주세요");
        }else if(form.parent_birth_date_03.value == false){
             lert("보호자 일을 선택해 주세요");
        }
        else if($(".solarLa").css("background-position") == "-36px 0px" && $(".lunarLa").css("background-position") == "-36px 0px"){
            alert("앙력과 음력을 선택해 주세요");
        }else if($(".solarLa").css("background-position") == "-58px 0px" && $(".lunarLa").css("background-position") == "-58px 0px"){
            alert("앙력과 음력중 하나만 선택해 주세요");
        }
        else if(form.id.value.length < 6 || form.id.value.length > 14){
            alert("아이디는 6~14자 이하로 입력해 주세요");
        }
        else if(id_dup_form.id_dup_chk.value.length < 6 || id_dup_form.id_dup_chk.value.length > 14){
            alert("아이디는 6~14자 이하로 입력해 주세요");
        }
        else if(form.pw.value.length < 6 || form.pw.value.length > 14){
            alert("비밀번호는 6~14자 이하로 입력해 주세요");
        }
        else if(form.pw_chk.value == false){
            alert("비밀번호를 한번 더 입력해 주세요");
        }
        else if(form.pw.value != form.pw_chk.value){
            alert("비밀번호가 일치하지 않습니다.");
        }
        else if($(".solar_popLa").css("background-position") == "-36px 0px" && $(".lunar_popLa").css("background-position") == "-36px 0px"){
            alert("지번과 도로명을 선택해 주세요");
        }else if($(".solar_popLa").css("background-position") == "-58px 0px" && $(".lunar_popLa").css("background-position") == "-58px 0px"){
            alert("지번과 도로명중 하나만 선택해 주세요");
        }
        else if(post_form.address.value == false){
            alert("주소를 입력해 주세요");
        }
        else if(form.tel_01.value == false){
            alert("전화번호 앞자리를 선택해 주세요");
        }
        else if(form.tel_02.value == false){
            alert("나머지 전화번호를 선택해 주세요");
        }
        else if(form.phone_01.value == false){
            alert("휴대폰번호 앞자리를 선택해 주세요");
        }
        else if(form.phone_02.value == false){
            alert("나머지 휴대폰번호를 선택해 주세요");
        }
        else if(form.email_01.value == false){
            alert("이메일 아이디를 입력해 주세요");
        }else if(form.email_02.value == false){
            alert("이메일 주소를 입력해 주세요");
        }
    });

</script>
</body>
</html>