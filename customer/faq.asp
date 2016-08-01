<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim filename : filename = "faq.asp"

	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, search, keyword
	Dim code_name
	Dim WhereClause1, WhereClause2, WhereClause3

	Debug		= false		' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode	= 2			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	keyfield	= SQLInjectionFilter(Nvl(Request("keyfield"),"2"))
	keyword		= SQLInjectionFilter(Nvl(Request("keyword"),""))
	code		= SQLInjectionFilter(Nvl(Request("code"),""))
	param		= "&keyfield="&keyfield&"&keyword="&Server.URLEncode(keyword)&"&code="&code

	today		= Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")
	If Len(code) > 5 Then f_AlertBack("정상적 접근이 아닙니다.")
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
        <script>
            $(document).ready(function(){
                $('.single-items').slick({
                    slidesToShow: 3,
                    initialSlide: 0
                });
            });
        </script>
	<!--<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>-->
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script type="text/javascript">
	function doSearch() {
		var form = document.search;

		if(!HasContent(form.keyword.value)) {
			alert("검색어를 입력해 주세요.");
			$("#keyword").val("");
			$("#keyword").focus();
			return;
		}

	   document.search.submit();
	}
	</script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>고객의 말씀</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/customer/faq.asp">자주묻는 질문</a>
            <a href="/mobile/customer/qna_form.asp">1:1 상담문의</a>
            <a href="/mobile/customer/voice_form.asp">칭찬/신고/제안</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-customer">
            <div class="detail-head">
                <h3>자주묻는 질문</h3>
                <span class="text">한국민속촌을 이용하시는 고객님들께서 자주 문의하시는 질문과 답변들을 정리하였습니다.</span>
            </div>
            <div class="content customer">
                <!--<form>
                    <div class="select_box category">
					<!--
                        <select name="category" class="category">
                            <option value="선택">선택</option>
                            <option value="제목">제목</option>
                            <option value="제목+내용">제목+내용</option>
                            <option value="내용">내용</option>
                        </select>
					-->
					<!--	<select name="keyfield" id="keyfield" class="category">
							<option label="선택" value="" <%If keyfield = "" Then Response.Write("selected")%>>선택</option>
							<option label="제목" value="1" <%If keyfield = "1" Then Response.Write("selected")%>>제목</option>
							<option label="제목+내용" value="2" <%If keyfield = "2" Then Response.Write("selected")%>>제목+내용</option>
							<option label="내용" value="3" <%If keyfield = "3" Then Response.Write("selected")%>>내용</option>
						</select>
                    </div>
                    <div class="cate_search">
                        <input type="text" name="keyword" id="keyword" maxlength="20" class="cate_search_text" value="<%=keyword%>" />
                        <a href="javascript:doSearch();" class="search_btn"></a>
                    </div>
                </form>-->
           
               <div class="main-tab faq-tab">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                            <!--전체-->
                            <h3><a href="/mobile/customer/faq.asp"></a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                            <!--이용안내-->
                            <h3><a href="/mobile/customer/faq.asp?code=F1001"></a></h3>
                        </li>
                        <li class="menu3" rel="tabMenu3">
                            <!--할인이벤트-->
                            <h3><a href="/mobile/customer/faq.asp?code=F1002"></a></h3>
                        </li>
                        <li class="menu4" rel="tabMenu4">
                            <!--기타-->
                            <h3><a href="/mobile/customer/faq.asp?code=F1003"></a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 전체-->
                    <div class="tab-content tabMenu1">
                        <ul>
					<%
					'==========================================================================

					'페이징 처리 부분
					pgSize		= 50
					UniqueField = "SEQ" ' 시퀀스필드
					TableName	= "TBL_FAQ" ' 테이블명
					SelectField	= "SEQ,CODE,TITLE,CONTENTS" ' select할 필드

					'검색
					WhereClause = "1 = 1"

					'정렬
					OrderBy = "SEQ DESC"		' 정렬방식

					Call OpenDbConnection()		' 데이터베이스 열기
					Call ProcRecordSQL()		' 페이징 처리 서브 호출

					If keyword <> "" then
						If keyfield <> "" Then
							If keyfield = "1" Then '제목 검색
								WhereClause = WhereClause & " AND TITLE LIKE '%" & keyword & "%'"
							ElseIf keyfield = "2" Then '제목+내용 검색
								WhereClause = WhereClause & " AND (TITLE LIKE '%" & keyword & "%' OR CONTENTS LIKE '%" & keyword & "%')"
							ElseIf keyfield = "3" Then '작성자 검색
								WhereClause = WhereClause & " AND CONTENTS LIKE '%" & keyword & "%'"
							End If
						End If
					End If

					If Not(Rs.BOF OR Rs.EOF) Then
						rValue	= Rs.GetRows
					Else
						rValue	= Null
					End If

					totalpage = int(TotalRecordCount / pgSize)

					Nam = TotalRecordCount Mod pgSize

					If Nam > 0 Then
					   totalpage = totalpage + 1
					End If
					'==========================================================================

					If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then
						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

							seq				= rValue(0,i)
							code			= rValue(1,i)
							title			= rValue(2,i)
							contents		= rValue(3,i)
							contents 		= Replace(contents,"''","'")
							contents 		= Replace(contents,"&amp;","&")
							contents 		= Replace(contents,"<br>",vblf)

							'에디터 사용시 변환 => 엔터값 <br>로 변환이 되어서 사용하지 않음
							'contents		= Replace(Trim(contents),chr(13)&chr(10),"<br>")

							If keyword <> "" Then
								title		= Replace(title, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
								'contents	= Replace(contents, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
							End If
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text"><%=title%></span>
                                    <span class="icon on"></span>
                                </div>
                                <div class="hidden_box">
                                    <span class="icon_a"><img src="/mobile/images/customer/icon_a.png" alt="" /></span>
                                    <span class="text"><%=contents%></span>
                                    <span class="blank"></span>
                                </div>
                            </li>
					<%
						Next
					Else
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text">내용이 없습니다.</span>
                                    <span class="icon on"></span>
                                </div>
                            </li>
					<%
					End If
					
					Call RsClose()
					Call CloseDbConnection()
					%>
                        </ul>
                    </div>
                    <!-- #tab2 이용안내-->
                    <div class="tab-content tabMenu2">
                        <ul>
					<%
					'==========================================================================
					
					Debug		= false		' SQL 디버그 설정(true : 사용, false : 사용안함)
					DebugMode	= 2			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

					'페이징 처리 부분
					pgSize		= 50
					UniqueField = "SEQ" ' 시퀀스필드
					TableName	= "TBL_FAQ" ' 테이블명
					SelectField	= "SEQ,CODE,TITLE,CONTENTS" ' select할 필드

					'검색
					WhereClause = " CODE = 'F1001' "

					'정렬
					OrderBy = "SEQ DESC"		' 정렬방식

					Call OpenDbConnection()		' 데이터베이스 열기
					Call ProcRecordSQL()		' 페이징 처리 서브 호출

					If keyword <> "" then
						If keyfield <> "" Then
							If keyfield = "1" Then '제목 검색
								WhereClause = WhereClause & " AND TITLE LIKE '%" & keyword & "%'"
							ElseIf keyfield = "2" Then '제목+내용 검색
								WhereClause = WhereClause & " AND (TITLE LIKE '%" & keyword & "%' OR CONTENTS LIKE '%" & keyword & "%')"
							ElseIf keyfield = "3" Then '작성자 검색
								WhereClause = WhereClause & " AND CONTENTS LIKE '%" & keyword & "%'"
							End If
						End If
					End If

					If Not(Rs.BOF OR Rs.EOF) Then
						rValue	= Rs.GetRows
					Else
						rValue	= Null
					End If

					totalpage = int(TotalRecordCount / pgSize)

					Nam = TotalRecordCount Mod pgSize

					If Nam > 0 Then
					   totalpage = totalpage + 1
					End If
					'==========================================================================

					If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then

						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

							seq				= rValue(0,i)
							code			= rValue(1,i)
							title			= rValue(2,i)
							contents		= rValue(3,i)
							contents 		= Replace(contents,"''","'")
							contents 		= Replace(contents,"&amp;","&")
							contents 		= Replace(contents,"<br>",vblf)

							'에디터 사용시 변환 => 엔터값 <br>로 변환이 되어서 사용하지 않음
							'contents		= Replace(Trim(contents),chr(13)&chr(10),"<br>")

							If keyword <> "" Then
								title		= Replace(title, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
								'contents	= Replace(contents, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
							End If
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text"><%=title%></span>
                                    <span class="icon on"></span>
                                </div>
                                <div class="hidden_box">
                                    <span class="icon_a"><img src="/mobile/images/customer/icon_a.png" alt="" /></span>
                                    <span class="text"><%=contents%></span>
                                    <span class="blank"></span>
                                </div>
                            </li>
					<%
						Next
					Else
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text">내용이 없습니다.</span>
                                    <span class="icon on"></span>
                                </div>
                            </li>
					<%
					End If

					Call RsClose()
					Call CloseDbConnection()
					%>
                        </ul>
                    </div>
                    <!-- #tab3 할인이벤트-->
                    <div class="tab-content tabMenu3">
                        <ul>
					<%
					'==========================================================================
					
					Debug		= false		' SQL 디버그 설정(true : 사용, false : 사용안함)
					DebugMode	= 2			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

					'페이징 처리 부분
					pgSize		= 50
					UniqueField = "SEQ" ' 시퀀스필드
					TableName	= "TBL_FAQ" ' 테이블명
					SelectField	= "SEQ,CODE,TITLE,CONTENTS" ' select할 필드

					'검색
					WhereClause = " CODE = 'F1002' "

					'정렬
					OrderBy = "SEQ DESC"		' 정렬방식

					Call OpenDbConnection()		' 데이터베이스 열기
					Call ProcRecordSQL()		' 페이징 처리 서브 호출

					If keyword <> "" then
						If keyfield <> "" Then
							If keyfield = "1" Then '제목 검색
								WhereClause = WhereClause & " AND TITLE LIKE '%" & keyword & "%'"
							ElseIf keyfield = "2" Then '제목+내용 검색
								WhereClause = WhereClause & " AND (TITLE LIKE '%" & keyword & "%' OR CONTENTS LIKE '%" & keyword & "%')"
							ElseIf keyfield = "3" Then '작성자 검색
								WhereClause = WhereClause & " AND CONTENTS LIKE '%" & keyword & "%'"
							End If
						End If
					End If

					If Not(Rs.BOF OR Rs.EOF) Then
						rValue	= Rs.GetRows
					Else
						rValue	= Null
					End If

					totalpage = int(TotalRecordCount / pgSize)

					Nam = TotalRecordCount Mod pgSize

					If Nam > 0 Then
					   totalpage = totalpage + 1
					End If
					'==========================================================================

					If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then

						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

							seq				= rValue(0,i)
							code			= rValue(1,i)
							title			= rValue(2,i)
							contents		= rValue(3,i)
							contents 		= Replace(contents,"''","'")
							contents 		= Replace(contents,"&amp;","&")
							contents 		= Replace(contents,"<br>",vblf)

							'에디터 사용시 변환 => 엔터값 <br>로 변환이 되어서 사용하지 않음
							'contents		= Replace(Trim(contents),chr(13)&chr(10),"<br>")

							If keyword <> "" Then
								title		= Replace(title, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
								'contents	= Replace(contents, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
							End If
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text"><%=title%></span>
                                    <span class="icon on"></span>
                                </div>
                                <div class="hidden_box">
                                    <span class="icon_a"><img src="/mobile/images/customer/icon_a.png" alt="" /></span>
                                    <span class="text"><%=contents%></span>
                                    <span class="blank"></span>
                                </div>
                            </li>
					<%
						Next
					Else
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text">내용이 없습니다.</span>
                                    <span class="icon on"></span>
                                </div>
                            </li>
					<%
					End If

					Call RsClose()
					Call CloseDbConnection()
					%>
                        </ul>
                    </div>
                    <!-- #tab4 기타-->
                    <div class="tab-content tabMenu4">
                        <ul>
					<%
					'==========================================================================
					
					Debug		= false		' SQL 디버그 설정(true : 사용, false : 사용안함)
					DebugMode	= 2			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

					'페이징 처리 부분
					pgSize		= 50
					UniqueField = "SEQ" ' 시퀀스필드
					TableName	= "TBL_FAQ" ' 테이블명
					SelectField	= "SEQ,CODE,TITLE,CONTENTS" ' select할 필드

					'검색
					WhereClause = " CODE = 'F1003' "

					'정렬
					OrderBy = "SEQ DESC"		' 정렬방식

					Call OpenDbConnection()		' 데이터베이스 열기
					Call ProcRecordSQL()		' 페이징 처리 서브 호출

					If keyword <> "" then
						If keyfield <> "" Then
							If keyfield = "1" Then '제목 검색
								WhereClause = WhereClause & " AND TITLE LIKE '%" & keyword & "%'"
							ElseIf keyfield = "2" Then '제목+내용 검색
								WhereClause = WhereClause & " AND (TITLE LIKE '%" & keyword & "%' OR CONTENTS LIKE '%" & keyword & "%')"
							ElseIf keyfield = "3" Then '작성자 검색
								WhereClause = WhereClause & " AND CONTENTS LIKE '%" & keyword & "%'"
							End If
						End If
					End If

					If Not(Rs.BOF OR Rs.EOF) Then
						rValue	= Rs.GetRows
					Else
						rValue	= Null
					End If

					totalpage = int(TotalRecordCount / pgSize)

					Nam = TotalRecordCount Mod pgSize

					If Nam > 0 Then
					   totalpage = totalpage + 1
					End If
					'==========================================================================

					If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then

						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

							seq				= rValue(0,i)
							code			= rValue(1,i)
							title			= rValue(2,i)
							contents		= rValue(3,i)
							contents 		= Replace(contents,"''","'")
							contents 		= Replace(contents,"&amp;","&")
							contents 		= Replace(contents,"<br>",vblf)

							'에디터 사용시 변환 => 엔터값 <br>로 변환이 되어서 사용하지 않음
							'contents		= Replace(Trim(contents),chr(13)&chr(10),"<br>")

							If keyword <> "" Then
								title		= Replace(title, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
								'contents	= Replace(contents, keyword, "<b><font color='#ff0000'>"&keyword&"</font></b>")
							End If
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text"><%=title%></span>
                                    <span class="icon on"></span>
                                </div>
                                <div class="hidden_box">
                                    <span class="icon_a"><img src="/mobile/images/customer/icon_a.png" alt="" /></span>
                                    <span class="text"><%=contents%></span>
                                    <span class="blank"></span>
                                </div>
                            </li>
					<%
						Next
					Else
					%>
                            <li>
                                <div class="show_box">
                                    <span class="icon_q"><img src="/mobile/images/customer/icon_q.png" alt="" /></span>
                                    <span class="text">내용이 없습니다.</span>
                                    <span class="icon on"></span>
                                </div>
                            </li>
					<%
					End If

					Call RsClose()
					Call CloseDbConnection()
					%>
                        </ul>
                    </div>
                </div>
                <div class="oto_consult">
                    찾으시는 질문이 없으신 경우 1:1 상담문의로<br/>
                    궁금하신 점을 올려 주세요.<br/>
                    고객여러분의 질문과 의견에 항상 귀를 기울이겠습니다.
                    <a href="/mobile/customer/qna_form.asp">1:1 상담문의</a>
                </div>
                <section class="tel_inquiry">
                    <span class="icon"></span>
                    <div class="text_box">
                        <h4>전화문의</h4>
                        <ul>
                            <li>
                                <p>
                                    <span class="icon"></span>
                                    <span>고객센터 : 031-288-0000</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <span class="icon"></span>
                                    <span>학생·기업단체·연간회원 상담실 : 031-288-4000</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <span class="icon"></span>
                                    <span>유스호스텔 : 031-288-1700</span>
                                </p>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </div>
    </div>
<%

%>
<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>