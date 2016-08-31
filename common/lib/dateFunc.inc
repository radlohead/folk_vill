<%

'--------------------------------------------------------------------
' 문자열(Datetime) 날짜값에서 날짜만 가져오기
'--------------------------------------------------------------------
Function GetDate(str) 
	str = left(str,10)
	GetDate = str
End function

'--------------------------------------------------------------------
' 숫자에서 요일값 가져오기
'--------------------------------------------------------------------
Function getWeek(chkDate)
	Dim str_week
	Select case chkDate
		case "6"
			str_week ="일"
		case "0"
			str_week ="월"
		case "1"
			str_week ="화"
		case "2"
			str_week ="수"
		case "3"
			str_week ="목"
		case "4"
			str_week ="금"
		case "5"
			str_week ="토"
	End Select
	getWeek = str_week
End Function

'--------------------------------------------------------------------
' 24시간제 날짜 변환하기
'--------------------------------------------------------------------
Function Date24Format(strdate)

	sDate = Left(strdate,10)
	sHour = Hour(strdate)
	If int(sHour) < 10 Then
		sHour = "0" & sHour
	End If 
	sMinute = Minute(strdate)
	If int(sMinute) < 10 Then
		sMinute = "0" & sMinute
	End If

	strdate = sDate & " " & sHour & ":" & sMinute

	Date24Format = strdate

End Function 

'--------------------------------------------------------------------
' YYMMDD 날짜 변환하기
'Ex) 2015-04-07
'--------------------------------------------------------------------
Function DateYMDFormat(strdate)

	sDate = Left(strdate,10)
	strdate = sDate

	DateYMDFormat = strdate

End Function

'--------------------------------------------------------------------
' ' YYMMDD 날짜 변환하기(년/월/일)
' Ex) 2015년04월07일 - 공백없음
'--------------------------------------------------------------------
Function DateYMDHanFormat(strdate)

	sDate = Left(strdate,10)
	sYear = Left(sDate,4)
	sMonth = Mid(sDate,6,2)
	sDay = Right(sDate,2)
	
	strdate = sYear&"년"&sMonth&"월"&sDay&"일"

	DateYMDHanFormat = strdate

End Function

'--------------------------------------------------------------------
' YYMMDD 날짜 변환하기(년/월/일)
' Ex) 2015년 04월 07일
'--------------------------------------------------------------------
Function DateYMDHanSpaceFormat(strdate)

	sDate = Left(strdate,10)
	sYear = Left(sDate,4)
	sMonth = Mid(sDate,6,2)
	sDay = Right(sDate,2)
	
	strdate = sYear&"년 "&sMonth&"월 "&sDay&"일"

	DateYMDHanSpaceFormat = strdate

End Function

'--------------------------------------------------------------------
' YYMMDD 날짜 변환하기(년.월.일) - 2015/04/07
' Ex) 2015.4.7
'--------------------------------------------------------------------
Function DateYMDHanPointFormat(strdate)

	sYear = year(strdate)
	sMonth = month(strdate)
	sDay = day(strdate)
	
	strdate = sYear&"."&sMonth&"."&sDay

	DateYMDHanPointFormat = strdate

End Function

'--------------------------------------------------------------------
' MMDD 날짜 변환하기(월.일) - 2015/04/07
' Ex) 4.7
'--------------------------------------------------------------------
Function DateMDHanPointFormat(strdate)

	sMonth = month(strdate)
	sDay = day(strdate)
	
	strdate = sMonth&"."&sDay

	DateMDHanPointFormat = strdate

End Function

'--------------------------------------------------------------------
' YYMMDD 날짜 변환하기(년.월.일) - 2015/04/17
' Ex) 2015.04.07
'--------------------------------------------------------------------
Function DateYYMMDDHanPointFormat(strdate)

	sDate = Left(strdate,10)
	sYear = Left(sDate,4)
	sMonth = Mid(sDate,6,2)
	sDay = Right(sDate,2)
	
	strdate = sYear&"."&sMonth&"."&sDay

	DateYYMMDDHanPointFormat = strdate

End Function

'--------------------------------------------------------------------
' MMDD 날짜 변환하기(월.일) - 2015/04/17
' Ex) 04.07
'--------------------------------------------------------------------
Function DateMMDDHanPointFormat(strdate)

	sDate = Left(strdate,10)
	sMonth = Mid(sDate,6,2)
	sDay = Right(sDate,2)
	
	strdate = sMonth&"."&sDay

	DateMMDDHanPointFormat = strdate

End Function

'--------------------------------------------------------------------
' 요일 변환하기
'--------------------------------------------------------------------
Function getWeekName(strdate)
	yymmdd = strdate
	'week = left(WeekdayName(Weekday(yymmdd)),1)
	week = Weekday(yymmdd)

	'vbSunday 1 일요일 
	'vbMonday 2 월요일 
	'vbTuesday 3 화요일 
	'vbWednesday 4 수요일 
	'vbThursday 5 목요일 
	'vbFriday 6 금요일 
	'vbSaturday 7 토요일 	

	Select Case week
	case 1
		week = "일"
		case 2
			week = "월"
		case 3
			week = "화"
		case 4
			week = "수"
		case 5
			week = "목"
		case 6
			week = "금"
		case 7
			week = "토"
	End Select

	getWeekName = week
End Function

'-----------------------------------------------------------------------------------------------------------
'date2epoch converts a VBScript date to an Unix timestamp => 유닉스 타임스템프로 변환
'-----------------------------------------------------------------------------------------------------------
Function date2epoch(myDate)
	date2epoch = DateDiff("s", "01/01/1970 00:00:00", myDate)
End Function

'----------------------------------------------------------------------------------------------------------------
'epoch2date converts Unix timestamps back to VBScript dates => 한국표준시간(KST)로 변환
'----------------------------------------------------------------------------------------------------------------
Function epoch2date(myEpoch)
	'epoch2date = DateAdd("s", myEpoch, "01/01/1970 00:00:00") '세계표준시간(UTC) 일때
	epoch2date = DateAdd("s", myEpoch, "01/01/1970 09:00:00") '한국표준시간(KST) 일때 GMT+9을 더한다.
End Function

'--------------------------------------------------------------------
'인스타그램 작성일 변환 함수 - 박주현
'--------------------------------------------------------------------
Function ConvertUTCDateToLocalDate(myDate)
	Dim yeras, months, days, hours, minutes, ampm, NewDate
	
	years = Year(myDate)
	months = Month(myDate)
	days = Day(myDate)
	hours = Hour(myDate)
	minutes = Minute(myDate)
	if(minutes < 10) Then minutes = "0" + minutes
	
	If hours >= 12 Then
		ampm = "pm"
	Else
		ampm = "am"
	End If

	hours = ((hours + 11) mod 12 + 1)

	NewDate = hours & "." & minutes & " " & ampm & " " & months & "/" & days & "/" & years
	ConvertUTCDateToLocalDate = NewDate
End Function

'-----------------------------------------------------------------------------------
'상대시간 포맷 변환 함수 Round함수 => 포스트/코멘트 작성일 변환시 사용
'-----------------------------------------------------------------------------------
Function Format_RelativeTime_Round(dt)
	Dim EX_SECOND : EX_SECOND = 1
	Dim EX_MINUTE : EX_MINUTE = 60 * EX_SECOND
	Dim EX_HOUR : EX_HOUR = 60 * EX_MINUTE
	Dim EX_DAY : EX_DAY = 24 * EX_HOUR
	Dim EX_MONTH : EX_MONTH = 30 * EX_DAY

	Dim delta : delta = DateDiff("s", dt, Now())

	Dim strTime : strTime = ""
	If (delta < 1 * EX_MINUTE) Then '1분보다 작을때
		If delta <= 0 Then
			strTime = "just now"
		Else
			strTime = "about " & delta & " seconds ago"
		End If
	ElseIf (delta < 2 * EX_MINUTE) Then '2분보다 작을때
		strTime = "a minute ago"
	ElseIf (delta < 50 * EX_MINUTE) Then '50분보다 작을때
		strTime = Round(delta / EX_MINUTE) & " minutes ago"
	ElseIf (delta < 90 * EX_MINUTE) Then '90분보다 작을때
		strTime = "about an hour ago"
	ElseIf (delta < 24 * EX_HOUR) Then '24시간보다 작을때
		strTime = Round(delta / EX_HOUR) & " hours ago"
	ElseIf (delta >= 24 * EX_HOUR And delta < 25 * EX_HOUR) Then '24시간보다 크고 25시간보다 작을때
		strTime = "about " & Round(delta / EX_HOUR) & " hours ago"
	ElseIf (delta < 48 * EX_HOUR) Then '48시간보다 작을때
		strTime = "about a day ago"
	ElseIf (delta < 30 * EX_DAY) Then '1달보다 작을때
		strTime = Round(delta / EX_DAY) & " days ago"
	ElseIf (delta < 12 * EX_MONTH) Then '1년보다 작을때
		Dim months
		months = Round(delta / EX_MONTH)
		strTime = months & " months ago"
	Else
		Dim years
		years = Round((delta / EX_DAY) / 365)
		If years <= 1 Then
			strTime = "one year ago"
		Else
			'strTime = years & " years ago"
			strTime = "about a years ago"
		End If
	End If
	Format_RelativeTime_Round = strTime
End Function

'-----------------------------------------------------------------------------------
'상대시간 포맷 변환 함수 Math함수 => 포스트/코멘트 작성일 변환시 사용
'-----------------------------------------------------------------------------------
Function Format_RelativeTime_Math(dt)
	Dim EX_SECOND : EX_SECOND = 1
	Dim EX_MINUTE : EX_MINUTE = 60 * EX_SECOND
	Dim EX_HOUR : EX_HOUR = 60 * EX_MINUTE
	Dim EX_DAY : EX_DAY = 24 * EX_HOUR
	Dim EX_MONTH : EX_MONTH = 30 * EX_DAY

	Dim delta : delta = DateDiff("s", dt, Now())

	Dim strTime : strTime = ""
	If (delta < 1 * EX_MINUTE) Then '1분보다 작을때
		If delta <= 0 Then
			strTime = "just now"
		Else
			strTime = "about " & delta & " seconds ago"
		End If
	ElseIf (delta < 2 * EX_MINUTE) Then '2분보다 작을때
		strTime = "a minute ago"
	ElseIf (delta < 50 * EX_MINUTE) Then '50분보다 작을때
		strTime = Math.floor(delta / EX_MINUTE) & " minutes ago"
	ElseIf (delta < 90 * EX_MINUTE) Then '90분보다 작을때
		strTime = "about an hour ago"
	ElseIf (delta < 24 * EX_HOUR) Then '24시간보다 작을때
		strTime = Math.floor(delta / EX_HOUR) & " hours ago"
	ElseIf (delta >= 24 * EX_HOUR And delta < 25 * EX_HOUR) Then '24시간보다 크고 25시간보다 작을때
		strTime = "about " & Math.floor(delta / EX_HOUR) & " hours ago"
	ElseIf (delta < 48 * EX_HOUR) Then '48시간보다 작을때
		strTime = "about a day ago"
	ElseIf (delta < 30 * EX_DAY) Then '1달보다 작을때
		strTime = Math.floor(delta / EX_DAY) & " days ago"
	ElseIf (delta < 12 * EX_MONTH) Then '1년보다 작을때
		Dim months
		months = Math.floor(delta / EX_MONTH)
		strTime = months & " months ago"
	Else
		Dim years
		years = Round((delta / EX_DAY) / 365)
		If years <= 1 Then
			strTime = "one year ago"
		Else
			'strTime = years & " years ago"
			strTime = "about a years ago"
		End If
	End If
	Format_RelativeTime_Math = strTime
End Function

'-----------------------------------------------------------------------------------
'상대시간 포맷 변환 함수 Round함수 => 포스트/코멘트 작성일 변환시 사용
'-----------------------------------------------------------------------------------
Function Format_RelativeTime_Round_Ex(dt)
	Dim fsecond : fsecond = 1
	Dim fminute: fminute = 60 * 1
	Dim fhour : fhour = 60 * 60 * 1
	Dim fday : fday = 24 * 60 * 60 * 1
	Dim fmonths : fmonths = 30 * 24 * 60 * 60 * 1

	Dim delta : delta = DateDiff("s", dt, Now())

	Dim strTime : strTime = ""

	If (delta < 60) Then '1분보다 작을때
		If delta <= 0Then
			strTime = "just now"
		Else
			strTime = "about " & delta & " seconds ago"
		End If
	ElseIf (delta < (2 * 60)) Then '2분보다 작을때
		strTime = "a minute ago"
	ElseIf (delta < (50 * 60)) Then '50분보다 작을때
		strTime = Round(delta / 60) & " minutes ago"
	ElseIf (delta < (90 * 60)) Then '1시간 30분보다 작을때
		strTime = "about an hour ago"
	ElseIf (delta < (24 * 60 * 60)) Then '24시간보다 작을때
		strTime = Round(delta / (60 * 60)) & " hours ago"
	ElseIf (delta >= (24 * 60 * 60) And delta < (25 * 60 * 60)) Then '24시간보다 크고 25시간보다 작을때
		strTime = "about " & Round(delta / (60 * 60)) & " hours ago"
	ElseIf (delta < (48 * 60 * 60)) Then '48시간보다 작을때
		strTime = "about a day ago"
	ElseIf (delta < (30 * 24 * 60 * 60)) Then '1달보다 작을때
		strTime = Round(delta / (24 * 60 * 60)) & " days ago"
	ElseIf (delta < (12 * 30 * 24 * 60 * 60)) Then '1년보다 작을때
		Dim months
		months = Round(delta / (30 * 24 * 60 * 60))
		strTime = months & " months ago"
	Else
		Dim years
		years = Round((delta / (24 * 60 * 60)) / 365)
		If years <= 1 Then
			strTime = "one year ago"
		Else
			'strTime = years & " years ago"
			strTime = "about a years ago"
		End If
	End If
	Format_RelativeTime_Round_Ex = strTime
End Function
%>