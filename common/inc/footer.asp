<footer>
    <ul class="sns_link">
        <li class="facebook"><a href="https://www.facebook.com/koreanfolkvillage">페이스북 링크</a></li>
        <li class="twitter"><a href="https://twitter.com/koreanfolk">트위터 링크</a></li>
        <li class="blog"><a href="http://blog.naver.com/kfv1974">한국민속촌 블로그 링크</a></li>
        <li class="kakaostory"><a href="#none">카카오스토리 링크</a></li>
    </ul>
    <ul class="footer_link">
        <li class="pc"><a href="http://www.koreanfolk.co.kr/">PC버전</a></li>
		<%if session("id") <> "" then%>
        <li class="login"><a href="/mobile/member/logout.asp">로그아웃</a></li>
		<%else%>
        <li class="login"><a href="/mobile/member/login.asp">로그인</a></li>
		<%end if%>
        <li class="group"><a href="/mobile/groupprogram/daily.asp">단체프로그램</a></li>
    </ul>
    <ul class="footer_link2">
        <li class="infor"><a href="/mobile/privacy/privacy_policy.asp">개인정보 취급방침</a><span class="vbar">|</span></li>
        <li class="terms"><a href="/mobile/privacy/term_agree.asp">이용약관</a></li>
    </ul>
    <div class="address-wrap">
        <address>
            <p>주소 : 경기도 용인시 기흥구 민속촌로 90</p>
            <p>문의전화 : 031.288.0000</p>
        </address>
        <p>Copyright@KFV All Rights Reserved.</p>
    </div>
    <span class="foot-logo">한국민속촌 하단로고</span>
</footer>