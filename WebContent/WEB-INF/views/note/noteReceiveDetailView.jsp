<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="note.model.vo.Note,java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<style>
body{
	font-family: 'Noto Sans KR', sans-serif;
}
.five_menu {
color: rgb(135, 211, 124);
}
.outer {
	width: 900px;
	/*1280px*/
	margin: auto;
	margin-bottom: 3%;
	
}

.wrap #h2 {
	height: 100px;
	font-size: 26px;
	display: flex;
	align-items: center;
	/* border-bottom: 2px solid rgb(30, 29, 41); */
}

.flexBox {
	display: flex;
	padding: 2rem 0px;
	border-bottom: 1px solid rgb(220, 219, 228);
	align-items: center;
	font-weight: 300;
}

.titleBox {
	width: 25%;
	font-size: 1.2rem;
}

.inputBox {
	width: 75%;
}

.inputBox>div {
	width: 100%;
	display: flex;
}

.descriptionInputBox {
	display: flex;
	flex-grow: 1;
	flex-direction: column;
}

.inputBox button {
	font-size: 18px;
	height: 2.2rem;
	width: 200px;
	text-align: center;
	border: 1px solid rgb(195, 194, 204);
	margin-left: 1rem;
	border-radius: 2px;
	background-color: transparent;
	cursor: pointer;
	outline: none;
}

.inputBox button:hover {
	background-color: rgb(135, 211, 124);
	border: none;
	color:white;
}

.flexBoxEnd {
	display: flex;
	padding: 2rem 0px;
	align-items: center;
}

.inputBoxEnd {
	display: flex;
	flex-grow: 1;
	justify-content: space-between;
}

.inputBoxEnd #listButton, .inputBoxEnd #deleteButton, .inputBoxEnd #reportButton
	{
	font-size: 18px;
	height: 2.2rem;
	text-align: center;
	border: 1px solid rgb(195, 194, 204);
	border-radius: 2px;
	background-color: transparent;
	cursor: pointer;
	outline: none;
	width: 33%;
}

.inputBoxEnd>#listButton:hover, .inputBoxEnd>#deleteButton:hover,
	.inputBoxEnd #reportButton:hover {
	background-color: rgb(135, 211, 124);
	border: none;
	color:white;
}

#show{
	font-size: 18px;
	height: 2.2rem;
	text-align: center;
	border: 1px solid rgb(195, 194, 204);
	border-radius: 2px;
	background-color: transparent;
	cursor: pointer;
	outline: none;
	width: 33%;
}
#show:hover{
	background-color: rgb(135, 211, 124);
	border: none;
	color:white;
}

.moveBox {
	display: flex;
	justify-content: end;
}

/* .moveBox>span{
        text-decoration: underline;
        font-weight: bold; 
        color: rgb(135, 211, 124);
        font-size: 15px ;
    }

    .moveBox>span:hover{
        cursor: pointer;
    } */
.content {
	word-break: break-all;
	overflow: auto;
	white-space: pre-wrap;
}

.content2 {
	min-height: 300px;
}

.moveBox, .flexBox {
	/* border-left: 1px solid rgb(30, 29, 41);
    	border-right: 1px solid rgb(30, 29, 41); */
	
}

.roundBox{
	border:1px solid rgb(135, 211, 124);
	padding:25px;
	border-radius: 20px;
}
</style>

<body>

	<!-- 메뉴바 -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp">
		<jsp:param name="pName" value="test" />
	</jsp:include>


    <div class="outer">
        <div class="wrap">
            <h2 id="h2">수신 쪽지함 &gt; 상세보기</h2>
			<div class="roundBox">
            <div class="moveBox">
                <span>전송일 : </span>&nbsp;&nbsp;<span><fmt:formatDate
								value="${note.sendDate }" type="both"
								pattern="yyyy.MM.dd hh:mm:ss" />&nbsp;(${note.timeView })</span>
            </div>
            <div class="flexBox">
                <div class="titleBox">
                    보내는 사람 :
                </div>
                <div class="inputBox">
                    ${ note.sendNickname }
                </div>
            </div>

            <div class="flexBox">
                <div class="titleBox">
                    수신자 아이디 :
                </div>
                <div class="inputBox">
                     ${ note.receiveNickname }
                </div>
            </div>

            <div class="flexBox" style="align-items:baseline;">
                <div class="titleBox">
                    제목 :
                </div>
                <div class="inputBox">
                    <p class="content"> ${ note.ntitle }</p>
                </div>
            </div>


            <div class="flexBox" style="align-items:baseline; border-bottom:0px;">
                <div class="titleBox">
                    내용 :
                </div>
                <div class="inputBox">
                    <p class="content content2">${ note.ncontent }</p>
                </div>  
            </div>
			
			</div>
			
            <div class="flexBoxEnd">
                <div class="titleBox">
                </div>
                <div class="inputBoxEnd">
                    <button id="listButton" type="button" onclick="location.href='${contextPath}/note/receive/list'">목록으로</button>
                    <button id="show" type="button" onclick="reportReply('${ note.sendNickname }','${note.ncontent }')">
                    	신고하기
                    </button> 
                    
                    <%
                    	Note note=(Note)request.getAttribute("note");
                    	
                    	String sendNickname=note.getSendNickname();
                    	String ncontent=note.getNcontent();
                    	String ntitle=note.getNtitle();
                    %>
              
                    <jsp:include page="/WEB-INF/views/common/noteModal.jsp">
                    	<jsp:param name="nno" value="${note.nno }"/>
						<jsp:param name="sendNickname" value='<%=URLEncoder.encode(sendNickname, "UTF-8") %>'/>						
						<jsp:param name="ntitle" value='<%=URLEncoder.encode(ntitle, "UTF-8") %>'/>
						<jsp:param name="ncontent" value='<%=URLEncoder.encode(ncontent, "UTF-8") %>'/>
						<jsp:param name="sendId" value="${note.sendId }"/>
						<jsp:param name="receiveId" value="${note.receiveId }"/>
					</jsp:include>          
                    <button id="deleteButton" onclick="deleteNote(${note.nno})">삭제하기</button>
                </div>
            </div>
            

        </div>
    </div>
    
    <!-- 푸터 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp">
		<jsp:param name="pName" value="test" />
	</jsp:include>
	
	<script>
		function deleteNote(nno){
			if(confirm("이 게시글을 삭제하시겠습니까?")){
				location.href="${contextPath}/note/receive/delete?nno="+nno;
			}
		}
	
	</script>
	
	<form></form>
	<script>
		function reportReply(sendNickname, ncontent){
			console.log("Asd");
			console.log(sendNickname, ncontent);
		}
	</script>
</body>

</html>