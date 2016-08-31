<%
'Real Server URL
Dim ServerURL : ServerURL = "http://www.koreanfolk.co.kr"

'DataBase 
Dim DbServer : DbServer = "sql8ssd-002.localnet.kr" '[DB connecton ip]
Dim DbNm : DbNm = "koreanfolk_seesaw" '[DB initial catalog name]
Dim DbID : DbID = "koreanfolk_seesaw" '[DB user id]
Dim DbPW : DbPW = "koreanfolk2013"

'Default PageSize
Dim FrontPageSize : FrontPageSize = 10
Dim AdminPageSize : AdminPageSize = 15

'Upload Max FileSize
Dim UploadMaxFileSize : UploadMaxFileSize = 5120000 '5MG

'절대경로
Dim PathDir
PathDir = Server.Mappath("/")

'상대경로
PathHttp = "http://www.koreanfolk.co.kr"

'Upload Path
Dim DefaultUploadPath				: DefaultUploadPath				= Server.Mappath("/upload/")
Dim NoticeUploadPath				: NoticeUploadPath				= DefaultUploadPath & "\notice\"
Dim NewsUploadPath					: NewsUploadPath				= DefaultUploadPath & "\news\"
Dim EventUploadPath					: EventUploadPath				= DefaultUploadPath & "\event\"
Dim InvestResultUploadPath			: InvestResultUploadPath		= DefaultUploadPath & "\InvestResult\"
Dim InvestResultNoticeUploadPath	: InvestResultNoticeUploadPath	= DefaultUploadPath & "\InvestResultNotice\"
Dim downloadsFilePath				: downloadsFilePath				= "/upFiles/downloads/"

'EDM 관련 컨스트 변수
CONST EDM_IMG_URL		= "http://www.koreanfolk.co.kr/edm/"
CONST ROOT_URL			= "http://www.koreanfolk.co.kr"
CONST GLOBAL_EDM_EMAIL	= "admin@ikfv.co.kr"
%>