<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--${pageContext.request.contextPath}" 이게 web-app을 가리킨다!!!!!   -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 그래서 path 써주고 그 아래 소스 파일 이름 지정해주면 된다 ! 이건 진경언니가 준거 !   -->
<link rel="stylesheet" href="${path}/resources/css/reviewList.css">
    <script type="text/javascript" src="${path}/resources/js/jquery-1.12.4.min.js"></script>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콘텐츠 모아보기</title>
    <script>
    </script>
    <style>
  .Container {
      margin: 0;
      width: 1440px;
  }

  .Content {
      padding: 40px 160px;
      height: 100vh;
  }


  #tableWrapper {
      width: 85%;
      height: 415.550px;
  }
  
#block{
   /*    border: 1px solid rgba(189, 186, 186, 0.829); */
    border-radius: 2%;
	min-height:443.2px;
}


#tableWrapper table {
    width: 100%;
    border-collapse: collapse;  
}



#tableWrapper table th {
    text-align: center;
    background-color: grey;
    height:20x;
    padding: 13px;
    background-color:#001eff;
    color:white;
}


 #tableWrapper table td {
    text-align: center;
    padding: 7px;
       border-bottom: 1px solid rgba(189, 186, 186, 0.829);

} 
  
.title{
  width:350px; 
 white-space:nowrap;
 overflow: hidden;
 text-overflow: ellipsis;
         color:#333;
    height: 40px;
}
.title:hover{
color:#001eff;}

.title p{
margin:10px;
}




  #pageArea{
  margin:0 auto;
  position:relative;
  }
  
  .paging{
  margin-top:10px;
  position:absolute;
  left:45%;
  }
  
 .paging > li{
  list-style:none;
  float:left;
  padding:6px 1px;
  }
  
  .span{
  padding:6px 12px;
  border: 1px solid lightgray;
  }
  
  #info, .paging >li :hover{
  text-decoration:none;
      text-align: center;
}

	#keywordInput{
	display:inline;
	}
	.search{
	float:right;
	margin-bottom:3px;
	margin-right:3px;
	}
	#searchType{
	height:24px;
	}

    </style>
 <script>
    $(function(){
      $('#searchBtn').click(function() {
        self.location = "memberList" + '${pmem.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
      });
    });   
</script>
</head>

<body>
    <div class="Container">
        <div class="Content">
            <h1>내 글 / 댓글 모아보기</h1>
            
    
       	 <div id="tableWrapper">
       	 <form role="form" method="get" id="form">
  
<%--  <div class="search">
    <select name="searchType" id="searchType">
      <option value="null"<c:out value="${scmem.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="e"<c:out value="${scmem.searchType eq 'e' ? 'selected' : ''}"/>>이메일</option>
      <option value="n"<c:out value="${scmem.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
    </select>
    <input type="text" size="30" name="keyword" id="keywordInput" value="${scmem.keyword}"/>
    <button id="searchBtn" type="button">검색</button>
</div> --%>
<!-- search -->
    <div id="block"> 
		              <table class="useInfo">
		                  <tr>
		                  	<th class="title">글내용</th>
		                      <th>작성자</th>
		                      <th>작성날짜</th>
		                  </tr>
		                  
		                     <c:forEach var="list" items="${list}" >
		                        <tr>
		                          <td><a id="info" href="${path}/viewMyContent?boardNum=${list.boardNum}"><div class="title">${list.boardContent}</div></a></td>
		                        	<td>${list.memberNickname }</td>
		                        	
		                        	   
		                           <td id="boardRegdate">
                     	<fmt:formatDate value="${list.boardRegDate}" var="changedDate"
							pattern="yyyy. MM. dd (HH:mm)" />
						${changedDate}
                     </td>
		                      
		                        </tr>
		                     </c:forEach>
		              </table>
                 </div><!-- block -->
					 <div id="pageArea">
              
						  <ul class="paging">
							  
						  
						    	<li><a class="span" href="viewMyList${pmem.makeQuery(pmem.startPage - 1)}">◀</a></li>
						
						    <c:forEach begin="${pmem.startPage}" end="${pmem.endPage}" var="idx">
						    	<li><a href="viewMyList${pmem.makeQuery(idx)}"><span class="span">${idx}</span></a></li>
						    </c:forEach>
						
						    	<li><a class="span" href="viewMyList${pmem.makeQuery(pmem.endPage + 1)}">▶</a></li>
						  </ul>
					 </div><!-- pageArea -->
       	 </form>
     			</div><!-- wrapper -->
         
        </div>
    </div>
</body>
</html>