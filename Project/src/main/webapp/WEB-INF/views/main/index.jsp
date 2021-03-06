<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
   href="${path}/resources/css/index.css">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<!-- 부트 스트랩 -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<!-- <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- 나눔폰트 -->
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">


<title>더하기+ 같이해서 더 가치있는 모임</title>

</head>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
   <main>
      <!-- 메인 carousel -->
      <div id="carouselExampleIndicators" class="carousel slide"
         data-ride="carousel">
         <!-- 인디케이터 -->
         <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0"
               class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
         </ol>

         <!-- 슬라이드 쇼 -->
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img class="main-image" src="${path}/resources/img/main1.jfif"
                  style="position: top: -160;" alt="First slide">

               <div class="carousel-caption d-none d-md-block">
                  <div class="carouser-content1">
                     <p>내 주변의 즐거운 모임</p>
                     <p id="mainplus">더하기+</p>

                  </div>
               </div>
            </div>
            <div class="carousel-item">
               <img class="main-image" src="${path}/resources/img/main2.jfif"
                  alt="Second slide">
               <div class="carousel-caption d-none d-md-block">
                  <div class="carouser-content2">
                     <p>모임은 가까워야 좋죠.</p>
                     <h4 style="color:white;">
                        더하기는 현재 내 위치에서 </br> 10KM 반경의 모임만 볼 수 있어요.
                     </h4>
                  </div>
               </div>
            </div>
            <div class="carousel-item">
               <img class="main-image" src="${path}/resources/img/main3.jfif"
                  alt="Third slide">
               <div class="carousel-caption d-none d-md-block">
                  <div class="carouser-content3">
                     <p>우린 같은 곳을 봐요.</p>
                     <h4  style="color:white;">
                        같은 목표를 가진 사람들이</br>함께하니 끝까지 할 수 있어요.
                     </h4>
                  </div>
               </div>
              
            </div>
         </div>
         <!-- 화살표 버튼 -->
         <a class="carousel-control-prev" href="#carouselExampleIndicators"
            role="button" data-slide="prev"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
         </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
            role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
         </a>
      </div>
      </div>
   </main>
<!--  현재 위치 출력 -->
   <div id="current-location"></div>

   <div class=search>
   <div class=searchbox>
   
    <input type="text" name="keyword" id="keywordInput" size="40" 
autocomplete='off' value="${scri.keyword}" placeholder=" 관심있는 더하기를 검색해보세요 🔍"/>
               <button id="searchBtn" type="button">검색</button>
            
               </div>
               </div>
               <script>
               

      $(function(){
        $('#searchBtn').click(function() {
          self.location = "totalList" + '?page=1&perPageNum=20' + "&searchType=t" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   

               
    </script>   
      
    

   <!--검색 카테고리 -->
   <div class="middle">
      <a class="catagory-btn"
         href="totalList?page=1&perPageNum=20&searchType=w&keyword="> <i
         class="fas fa-running"></i>
         <p>운동</p>
      </a> <a class="catagory-btn"
         href="totalList?page=1&perPageNum=20&searchType=s&keyword="> <i
         class="fas fa-book-reader"></i>
         <p>학습</p>
      </a> <a class="catagory-btn"
         href="totalList?page=1&perPageNum=20&searchType=ho&keyword="> <i
         class="fas fa-cubes"></i>
         <p>취미</p>
      </a> <a class="catagory-btn"
         href="totalList?page=1&perPageNum=20&searchType=ha&keyword="> <i
         class="far fa-grin-alt"></i>
         <p>습관</p>
      </a>
   </div>

   <!--더하기 리스트-->
   <section class="gallery-block cards-gallery">
      <div class="gallery-container">
         <div class="gallerytitle">
            <h3 id="viewtitle">
               <b> 💙BEST 인기 더하기</b>
            </h3>
            <a href="totalList" id="viewtotal"> 더 보기 > </a>
         </div>

         <div class="row">
            <c:forEach items="${main}" var="club" varStatus="status" begin="0"
               end="11">
               <div class="col-md-6 col-lg-3">
                  <div class="card border-0 transform-on-hover">

                     <a class="lightbox"
                        href='getClub?clubNum=<c:out value="${club.clubNum}" />'>
                           <img id="clubmainpic" src="${path}/resources${club.clubMain_pic}"
                           onerror="this.onerror=null; this.src='${path}/resources/img/img1.jpg'" />
                     </a>
                     <div class="card-bodyarea">
                        <div class=spanspace>
                         <c:if test="${club.clubOnOff eq '온라인'}">
             <span class="badge" id="onoff">${club.clubOnOff}</span> 
         </c:if>
          <c:if test="${club.clubOnOff eq '오프라인'}">
             <span class="badge" id="onoff1" >${club.clubOnOff}</span> 
         </c:if>
           
            <span class="badge" id="freq">${club.clubFreq}</span>

                        </div>
                        <div class=clubtitle>
                           <a class=clubtitle
                              href='getClub?clubNum=<c:out value="${club.clubNum}" />'>
                              ${club.clubName} </a>
                        </div>
                        <div class=subtitle>
<i class="fas fa-heart"> ${club.clubHeart}</i>&nbsp;&nbsp;
<i class="fab fa-product-hunt">&nbsp;${club.clubFee}</i>
</div>


                        <!-- 더하기 상세 정보 -->
                        <p class="text-muted card-text">

                           <c:set var="today" value="<%=new java.util.Date()%>" />
                           <fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd" />
                           <fmt:formatDate var="shutDay" value="${club.clubShutDate}"
                              pattern="yyyyMMdd" />
                           <fmt:formatDate var="startDay" value='${club.clubStartDate}'
                              pattern="yyyy-MM-dd" />
                           <fmt:formatDate var="endDay" value='${club.clubEndDate}'
                              pattern="yyyyMMdd" />
                           <span class="period">📅 ${club.clubStartDate} ~
                              ${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집 마감까지
                              D - <c:out value="${shutDay-today}" />
                           </span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
                              ${club.clubMax}명 참여중!
                           </span></br>

                        </p>
                     </div>
                  </div>
               </div>
            </c:forEach>
   </section>


   <!--내 위치에서 가까운 더하기 -->
   <section class="gallery-block cards-gallery">
      <div class="gallery-container">
         <div class="gallerytitle">
            <h3 id="viewtitle">
               <b>🚩내 주변 가까운 더하기</b>
            </h3>
            <a href="totalList" id="viewtotal"> 더 보기 > </a>
         </div>

         <div class="row">
            <c:forEach items="${main2}" var="club" varStatus="status" begin="0"
               end="11">
               <div class="col-md-6 col-lg-3">
                  <div class="card border-0 transform-on-hover">

                     <a class="lightbox"
                        href='getClub?clubNum=<c:out value="${club.clubNum}" />'>
                           <img id="clubmainpic" src="${path}/resources${club.clubMain_pic}"
                        onerror="this.onerror=null; this.src='${path}/resources/img/img1.jpg'" />


                     </a>
                     <div class="card-bodyarea">
                        <div class=spanspace>
                         <c:if test="${club.clubOnOff eq '온라인'}">
             <span class="badge" id="onoff">${club.clubOnOff}</span> 
         </c:if>
          <c:if test="${club.clubOnOff eq '오프라인'}">
             <span class="badge" id="onoff1" >${club.clubOnOff}</span> 
         </c:if>
           
            <span class="badge" id="freq">${club.clubFreq}</span>

                        </div>
                        <div class=clubtitle>
                           <a class=clubtitle
                              href='getClub?clubNum=<c:out value="${club.clubNum}" />'>
                              ${club.clubName} </a>
                        </div>
                        <div class=subtitle>
<i class="fas fa-heart"> ${club.clubHeart}</i>&nbsp;&nbsp;
<i class="fab fa-product-hunt">&nbsp;${club.clubFee}</i>
</div>

                        <!-- 더하기 상세 정보 -->
                        <p class="text-muted card-text">

                           <c:set var="today" value="<%=new java.util.Date()%>" />
                           <fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd" />
                           <fmt:formatDate var="shutDay" value="${club.clubShutDate}"
                              pattern="yyyyMMdd" />
                           <fmt:formatDate var="startDay" value='${club.clubStartDate}'
                              pattern="yyyy-MM-dd" />
                           <fmt:formatDate var="endDay" value='${club.clubEndDate}'
                              pattern="yyyyMMdd" />
                           <span class="period">📅 ${club.clubStartDate} ~
                              ${club.clubEndDate}</span></br> <span class="shutdown"> 🔒 모집 마감까지
                              D - <c:out value="${shutDay-today}" />
                           </span></br> <span class="person">현재<b> ${club.clubCurnum}</b> /
                              ${club.clubMax}명 참여중!
                           </span></br>

                        </p>
                     </div>
                  </div>
               </div>
            </c:forEach>
   </section>


   <div class="addplus">
      <span class="material-icons"
         style="font-size: 55px;"> add_circle </span>

   </div>
   

   </div>
   </div>
   <!-- 푸터와 공백을 위해 지정한 div -->
   <div id="bottomarea"></div>

   <!--페이지 위로가기 버튼 -->
   <button id="go-top">
      <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38"
         fill="currentColor" class="bi bi-arrow-up-circle-fill"
         viewBox="0 0 16 16">
        <path fill-rule="evenodd"
            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
      </svg>
   </button>


</body>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!--어썸폰트 아이콘 -->
<script src="https://kit.fontawesome.com/831a4ab0db.js"
   crossorigin="anonymous"></script>
<!--부트스트랩-->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
   integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
   crossorigin="anonymous"></script> -->
<!-- <script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
   integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
   crossorigin="anonymous"></script> -->
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
   integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
   crossorigin="anonymous"></script>


<!--구글맵 api-->
<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA14FclHyP6uY1AXC81jP9ZEsnWKEn-nYE"></script>

<script>

<!--메인 carousel 2초-->
/* $('.carousel').carousel({ interval: 2000 }); */
$('.addplus').on('click',function(){
 // 로그인 검사 
if(! '${user.memberNum}'){
   alert("로그인해주세요!");
   return;
} else {
   window.location.href="clubForm";
   
}
});
    

        <!------------------스크롤 위로 올리기----------------->
        var backToTop = () => {
            // Scroll | button show/hide
            window.addEventListener('scroll', () => {
                if (document.querySelector('html').scrollTop > 100) {
                    document.getElementById('go-top').style.display = "block";
                } else {
                    document.getElementById('go-top').style.display = "none";
                }
            });
            // back to top
            document.getElementById('go-top').addEventListener('click', () => {
                window.scrollTo({
                    top: 0,
                    left: 0,
                    behavior: 'smooth'
                });
            })
        };
        backToTop();
        
 
         
  
         $( document ).ready( function() {
             
        
             if (!!navigator.geolocation) {
                 navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
                 document.getElementById("current-location").innerHTML = "잠깐! 현재 위치를 찾고 있습니다.";
             }
             else {
                 alert("해당 브라우저는 위치추적을 지원하지 않습니다");
             }
             function successCallback(position) {
                 var lat = position.coords.latitude;          // 위도
                 var lng = position.coords.longitude;         // 경도
                 var latlng = new google.maps.LatLng(lat, lng);
               console.log(lat, lng);  //현재 위치 위도 경도
               
            
              

                  <!----위도, 경도 주소로 변환하기---->
                 var geocoder = new google.maps.Geocoder();
                 geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                     if (status !== google.maps.GeocoderStatus.OK) {
                         alert(status);
                     }
                     // This is checking to see if the Geoeode Status is OK before proceeding
                     if (status == google.maps.GeocoderStatus.OK) {
                         // console.log(results);
                         var totaladdress = (results[3].formatted_address);  // 국가,시,구,동까지 나오는 주소
                         const arr = totaladdress.split(" ");                // address를 공백 기준으로 자름
                         var address=(arr[1] + " "+ arr[2] +" "+ arr[3]);      //대한민국 제외하고 담기
                         console.log(arr[1] + arr[2] + arr[3]);
                   
                     }
                     document.getElementById("current-location").innerHTML = "🚩 현재 위치 : " + address;
                    
                 });
                
             }
             function errorCallback(error) {
                 alert(error.message);
             }
             

          } );
  

   
         
         //더하기 등록 버튼 고정
         $( document ).ready( function() {
            var jbOffset = $( '.material-icons' ).offset();
             $( window ).scroll( function() {
               if ( $( document ).scrollTop() > 300) {
                 $( '.material-icons' ).addClass( 'buttonFixed' );
               }
               else {
                 $( '.material-icons' ).removeClass( 'buttonFixed' );
               }
             });
     
           } );
    </script>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>