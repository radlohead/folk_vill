        <script>
            $(document).ready(function(){
                $('.multiple-items').slick({
                    infinite: true,
                    slidesToShow: 4,
                    initialSlide: 4
                });
            });
        </script>
	<script language="javascript">
	<!--
	var pg			= "<%=pg%>";
	var keyfield	= "<%=keyfield%>";
	var keyword		= "<%=keyword%>";
	var code		= "<%=code%>";

	function requestAdd(){

		var send_data = {
			pg:			pg,
			keyfield:	keyfield,
			keyword:	keyword,
			code:		code
		};

		$.ajax({
			type:	"POST",
			url:	"srv_notice_contents.asp",
			data:	send_data,
			success: function(result_data){

				var flag	= $(result_data).find("item").find("flag").first().text();

				if (flag == "error") {
					alert("Error");
					return false;
				}else if (flag == "nodata") {
					return false;
				}else if (flag == "success") {

					//$('#box > tbody:last > tr:last').remove();
					$(result_data).find("item").each(function() {

						var media_add;
						var seq			= $(this).find("seq").text();
						var code		= $.trim($(this).find("code").text());
						var title		= $.trim($(this).find("title").text());
						var files		= $.trim($(this).find("files").text());
						var contents	= $.trim($(this).find("contents").text());
						var writer		= $.trim($(this).find("writer").text());
						var status		= $.trim($(this).find("status").text());
						var readcount	= $.trim($(this).find("readcount").text());
						var regdate		= $.trim($(this).find("regdate").text());
						var notice_icon	= $.trim($(this).find("notice_icon").text());

						var param		= "?pg=" + pg + "&seq=" + seq;

						media_add = "<tr style='display: table-row;'>";
						media_add += "	<td><span class='icon " + notice_icon + "'></span></td>";
						media_add += "	<td>";
						media_add += "		<div><a href='notice_view.asp" + param + "'><h4 style='color:#f08200;'>" + title + "</h4><span class='date'>" + regdate + "</span></a></div>";
						media_add += "	</td>";
						media_add += "</tr>";

						$("#box").append(media_add);
					});
				}
			},
			error: function(xhr, ajaxOptions, throuwnError) {
				if (xhr.status == "0"){
					return;
				}else{
					alert("ggContentsBody Error=" + xhr.status + " text=" + xhr.responseText);
				}
			}
		});
	}

	$(document).ready(function() {
		// 페이지버튼
		$("#btnAdd").click(function() {
			var tot_page = "<%=totalpage%>";
			//alert(pg);
			//alert(tot_page);
			if(pg == tot_page){
				alert("더이상 내용이 없습니다.");
			}else{
				if (pg >= tot_page)
					return false;
				pg = parseInt(pg) + 1;

				requestAdd();
			}
		});

		//var img_h = $(".board-list:last-of-type .board-list-left img").height();
		//var img_w = $(".board-list:last-of-type .board-list-left img").width();
		//$(".board-list .board-list-left img").css({"height":img_h, "width":img_w});
	});
	//-->
	</script>