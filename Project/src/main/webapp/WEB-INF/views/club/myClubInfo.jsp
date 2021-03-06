<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 등록</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${path}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${path}/resources/css/clubform.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="${path}/resources/js/bootstrap-datepicker.js"></script>
<script src="${path}/resources/js/bootstrap-datepicker.ko.js"></script>
<style>
/* body, html{ height: 100%;} */
#delBtn, #modifyBtn {
	width: 195px;
	height: 50px;
	top: 350px;
	border: 0;
	outline: 0;
	color: white;
	background-color: #001eff;
	font-size: 15px;
}

#delTag {
	color: white;
}
</style>
</head>
<header></header>
<section>
	<form action="updateClub" method="post" enctype="multipart/form-data"
		id="frm">

		<div class="selection">

			<div class="select-onoff">
				<label for="exampleFormControlSelect2">온라인/오프라인</label> <select
					class="form-control" name="clubOnOff">
					<option value="online">${club.clubOnOff}</option>
					<!-- <option value="offline">오프라인</option> -->
				</select>
			</div>
			<div class="category">
				<label for="exampleFormControlSelect2">카테고리 선택</label> <select
					class="form-control optionCategory" name="clubCategory">
					<option value="운동">운동</option>
					<option value="공부">학습</option>
					<option value="습관">습관</option>
					<option value="취미">취미</option>
				</select>
			</div>
		</div>
 	<label for="exampleFormControlFile1">모임 이름</label> <input type="text"
			maxlength='16' class="form-control" id="club-title"
			placeholder="최대 16글자로 입력해주세요" value="${club.clubName}" readonly> 
		<div class="form-group">
			<label for="exampleFormControlFile1">모임 프로필 사진 업로드</label> 
			<div class="uploadBox">
				<label class="btn btn-info btn-sm uploadBtn"> 파일 선택 <input class="inputs"
					type="file" style="display: none;" name="upload"
					onchange="getFileName(0); changeImg(0);" />
				</label> <span id="spanFileName[0]">${club.clubMain_pic_name}</span>
				<button type="button" class="removeBtn" onclick="deleteFile(0)">x</button>
							<!-- 이미지 미리보기 영역  -->
					<div class="imgViewArea" style="margin-top:10px;">	
						<img class="imgArea" style="width:200px; height:100px;"   src="${path}/resources${club.clubMain_pic}"	
						 onerror="this.style.display='none';" /></div>
			</div>
		</div> 
		<article>
			<div id="write-clubinfo">
				<label for="exampleFormControlFile1">개설하고자 하는 모임의 성격을
					설명해주세요!</label>
				<textarea name="clubContent1" placeholder="사진과 글로 모임을 자세히 소개해보세요.">${club.clubContent1}</textarea>
				<div class="uploadBox">
					<label class="btn btn-info btn-sm uploadBtn"> 파일 선택 <input class="inputs"
						type="file" style="display: none;" name="upload"
						onchange="getFileName(1); changeImg(1);" />
					</label> <span id="spanFileName[1]">${club.clubContent1_pic_name}</span>
					<button type="button" class="removeBtn" onclick="deleteFile(1)">x</button>
								<!-- 이미지 미리보기 영역  -->
					<div class="imgViewArea" style="margin-top:10px;" >
						<img class="imgArea" style="width:200px; height:100px;" src="${path}/resources${club.clubContent1_pic}"	
						 onerror="this.style.display='none';" /></div>
				</div>
			</div>
			<div id="write-checkinfo">
			<c:if test="${club.clubKind eq 1}">
				<label for="exampleFormControlFile1" id="intro">모임의 인증방법을 설명해주세요!</label>
			</c:if>
			<c:if test="${club.clubKind eq 2}">
				<label for="exampleFormControlFile1" id="intro">모임의 리더가 되고싶은 회원님은 어떤사람인가요?</label>
			</c:if>
				<textarea name="clubContent2" placeholder="모두가 실천할 수 있도록 구체적인 인증방법을 작성해주세요.">${club.clubContent2}</textarea>
				<div class="uploadBox">
					<!-- <input type="file" class="form-control-file"
					id="exampleFormControlFile1"> -->
					<label class="btn btn-info btn-sm uploadBtn"> 파일 선택 <input class="inputs"
						type="file" style="display: none;" name="upload"
						onchange="getFileName(2); changeImg(2);" />
					</label> <span id="spanFileName[2]">${club.clubContent2_pic_name}</span>
					<button type="button" class="removeBtn" onclick="deleteFile(2)">x</button>
								<!-- 이미지 미리보기 영역  -->
					<div class="imgViewArea" style="margin-top:10px;" >
						<img class="imgArea" style="width:200px; height:100px;" src="${path}/resources${club.clubContent2_pic}"	
						 onerror="this.style.display='none';" /></div>
				</div>
			</div>
			<div class="hashtag-wrap">

				<input type="text" class="form-control" id="write-hashtag"
					onkeypress="onKeyDown()" maxlength='10'
					placeholder="해쉬태그를 입력해주세요! (최대 5개)">
				<%-- 	<c:forEach items="${tags}" var="tag">
				<span class="label label-info hashbadge"># ${tag}<span id="delTag" style="cursor: pointer;"> x</span></span>
				</c:forEach> --%>
				<input type="text" style="display: none" id="add-hashtag"
					name="clubHashtag" />
				<!-- append hashtag -->

			</div>
		</article>
</section>
<aside>

	<div class="clubinfo-form">
		<div class="location">

			<img src="${path}/resources/img/mapicon.png"> <label
				for="exampleFormControlSelect2">모임위치</label><br>


			<div id="map" style="width: 450px; height: 300px;"></div>
		</div>
		<label for="exampleFormControlSelect2">모집 종료일 </label>

		<div class="clubdate">
			<img class="calanderimg" src="${path}/resources/img/calendar.png" />
			<input type="text" class="form-control c-date" id="shut-date" autocomplete="off"
				name="clubShutDate" value="${club.clubShutDate}" />
		</div>
		<label for="exampleFormControlSelect2">모임 진행 기간 </label>
		<div class="form-row">
			<div class="col">
				<div class="clubdate">
					<img class="calanderimg" src="${path}/resources/img/calendar.png" />
					<input type="text" class="form-control c-date" id="start-date" autocomplete="off"
						name="clubStartDate" value="${club.clubStartDate}" />
				</div>
			</div>
			<div id="tilde">~</div>
			<div class="col">
				<div class="clubdate">
					<img class="calanderimg" src="${path}/resources/img/calendar.png" />
					<input type="text" class="form-control c-date" id="end-date" autocomplete="off"
						name="clubEndDate" value="${club.clubEndDate}" />
				</div>
			</div>
		</div>
		<div class="people">
			<label for="exampleFormControlSelect2">참가인원</label> <input 
				type="text" class="form-control" placeholder="최대 50명" id="club-max" autocomplete="off"
				name="clubMax" value="${club.clubMax}">
		</div>


		<div class="freq">
			<label for="exampleFormControlSelect2">모임주기</label> 
			<select class="form-control optionFreq" name="clubFreq">
				<option value="주 1회">주 1회</option>
				<option value="주 2회">주 2회</option>
				<option value="주 3회">주 3회</option>
				<option value="주 4회">주 4회</option>
				<option value="주 5회">주 5회</option>
				<option value="주 6회">주 6회</option>
				<option value="주 7회">주 7회</option>
			</select>
		</div>
		<div class="radioBtn">
			<label class="radio-inline"><input type="radio"
				name="optradio" value="free" onclick="radioEvent()">무료</label> <label
				class="radio-inline"><input type="radio" name="optradio"
				value="pay" onclick="radioEvent()">유료</label>
		</div>
		<div class="clubfeeBox">
			<label for="exampleFormControlSelect2">참가비용</label> <input
				type="text" class="form-control" id="club-fee" name="clubFee" autocomplete="off">
		</div>
		<input name="clubNum" type="hidden" value="${club.clubNum}" /> <input
			name="clubMakeDate" type="hidden" value="${club.clubMakeDate}" /> <input
			name="clubCurnum" type="hidden" value="${club.clubCurnum}" /> <input
			name="clubKind" type="hidden" value="${club.clubKind}" /> <input
			name="clubLatitude" type="hidden" id="club-lat" value="${club.clubLatitude}"></input> <input
			name="clubLongitude" type="hidden" id="club-lng" value="${club.clubLongitude}"></input>
		<button type="button" class="btn" id="modifyBtn" onclick="goSubmit()">수정하기</button>
		
		<input type="hidden" name="clubNum" value="${club.clubNum}"></input> 
		</form>
		<button type="button" class="btn" id="delBtn" onclick="deleteClub()">삭제하기</button>
	</div>
</aside>

<!--지도 추가(혜미)-->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54bd0b6b843cae2c7eb4621d80f301a4"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(${club.clubLatitude}, ${club.clubLongitude}), // 지도의 중심좌표
    level: 4// 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
 var markerPosition  = new kakao.maps.LatLng(${club.clubLatitude}, ${club.clubLongitude}); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);



<!---------------------지도 끝------------------->
let category = '${club.clubCategory}';
let freq = '${club.clubFreq}';
let clubFee = '${club.clubFee}';

console.log(category)
console.log(freq)

$('.optionCategory').val(category).prop("selected", true);
$('.optionFreq').val(freq).prop("selected", true);

if(clubFee=='0'){
	$('input:radio[name=optradio]:input[value=free]').attr("checked", true);
} else {
	$('input:radio[name=optradio]:input[value=pay]').attr("checked", true);
	$('.clubfeeBox').css('display','block');
	$('#club-fee').val(clubFee);
}


function changeImg(index){
	 console.log("몇번쨰? " + index)
	 let inputs = document.getElementsByClassName('inputs');
		 console.log(inputs[index])
		let target = inputs[index];
		 // 파일이 없으면 
		if(target.value == '' ) {
			// 이미지 소스 없애기 
			$('.imgArea:eq('+index+')').attr('src' , '');  
		}
		// 미리보기 영역 없애기
		$('.imgViewArea:eq('+index+')').css({ 'display' : '' });
		readURL(target, index);
		
}


// 모임 프로필 이미지 미리보기 
	function readURL(input, i) {
	  console.log(input)
		if (input.files && input.files[0]) {
	 		 console.log(input.files[0].name)
			var reader = new FileReader();
			reader.onload = function(e) {
				$('.imgArea:eq('+i+')').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}



//파일 선택시 파일이름 변경 
function getFileName(index){
  let fileNameSpan = document.getElementById('spanFileName['+index+']');
  let name = $('input[type=file]')[index].files[0].name;
 	console.log("파일 :" + name);
  fileNameSpan.innerText = "";
  $(fileNameSpan).append(name); 
  
  // 해당하는 index로 파일 삭제시 생성된 input이 있을 경우 remove 
  
  let target =  document.getElementById('status['+index+']');
  if(target){
	  console.log("remove 히든input" + target);
	  target.remove();
  }
}

//파일 삭제
function deleteFile(index){
	  let fileNameSpan = document.getElementById('spanFileName['+index+']')
	  let nameArr = document.getElementsByName('upload');
	  let hiddenInput = '<input type="hidden" id="status['+index+']" name="fileStatus" value="deleted_'+index+'" />';
	  fileNameSpan.innerText = "";
	  // file 값을 없애기 
	  nameArr[index].value = "";
	  $('.imgViewArea:eq('+index+')').css({ 'display' : 'none' });
	  
	  // 수정시 아무것도 안했을 경우에도 null로 들어가기 때문에 그에 따른 처리를 해야 한다
	  // 삭제 버튼을 클릭하면 따로 input hidden으로 deleted를 보낸다 
			console.log(hiddenInput);
			$('#frm').append(hiddenInput);
	
}


//버튼 클릭시 유효성 검사 후 제출 
function goSubmit(){
 //제목 유효성 체크 
 if (checkInput()){
     if(isNumber()){
         document.getElementById('frm').submit();
         alert("모임 수정이 완료되었습니다!")
     } 
 }
 
}


//필수 입력란 검사 
function checkInput(){
	let fee = document.getElementById("club-fee");
	let max = document.getElementById("club-max");
	let title = document.getElementById("club-title");
	let date = document.querySelectorAll(".c-date");


     if(title.value == "" || fee.value == "" || max.value == "" || 
         date[0].value == "" || date[1].value == "" || date[2].value == "" ){
    	 
         // return은 코드를 더이상 실행하지 않고 돌려보내기 위한 구문.
         if(title.value == "" ){
             alert("제목을 입력해주세요!")
             return title.focus();
         } 

         if(fee.value == ""){
             alert("참가비를 입력해주세요!")
             return fee.focus();
         } 
         
         if(max.value == ""){
             alert("참가인원을 입력해주세요!")
             return max.focus()

         }

         for(var i=0; i<date.length; i++){
             if(date[i].value == ""){
                 alert("날짜를 입력해주세요!")
                 return date[i].focus()

             }
         }
     
	}
 return true;
 	
}


//참가비, 참가인원 숫자만 입력하도록 검사 
function isNumber(){
 let fee = document.getElementById("club-fee");
 let max = document.getElementById("club-max");

 var regexp1= /^[0-9]\d{0,2}/g;
 var regexp2= /^[0-9]\d{0,6}/g;

	 if(!regexp2.test(fee.value)){
	     alert("숫자만 입력 가능합니다!")
	     return fee.focus();
	 } 
 
	 if(!regexp1.test(max.value)){
	     alert("숫자만 입력 가능합니다!")
	     return max.focus();
	 }
 
 return true;
}

function radioEvent(){
	 let feeBox = document.querySelector(".clubfeeBox");
 	 let fee = document.getElementById("club-fee"); 
	 let radioButtons = document.getElementsByName("optradio");
	 console.log(radioButtons[0].value)
	 console.log(radioButtons[1].value)
	 

	 if(radioButtons[0].checked){
	    //무료 체크시 hide input 
	     fee.value = 0;
	     feeBox.style.display = 'none';
	     
	 } else if(radioButtons[1].checked){
	     //유료 체크시 input 박스 보이기 
	     fee.value="";
	     feeBox.style.display = 'block';
	 }
	
}
	

let valArray = new Array();

// 해시태그 스페이스바 / 엔터 입력시 등록 
function onKeyDown(){
    event.stopPropagation();
    if(event.keyCode == 32 || event.keyCode == 13)
    {       
        let hashtagBox = document.querySelector(".hashtag-wrap");
        let span = document.createElement('span');
        span.classList.add("label");
        span.classList.add("label-info");
        span.classList.add("hashbadge");
        hashtagBox.append(span);
        let input = document.querySelector("#write-hashtag");
        let value = checkValue(input)
        valArray.push(value);
        $(("#add-hashtag")).val(valArray);
        console.log(valArray)

        // delete를 위한 span 추가 
        let delSpan = document.createElement('span');
        // 띄어쓰기와 x 표시 
        delSpan.innerHTML = ' x';
        // id 부여 
        delSpan.id = "delTag";
        delSpan.style.cursor = "pointer";
        // #+태그값 형태로 text 추가 
        span.innerHTML = "# " + value;
        span.append(delSpan);

        input.value = null;
        checkQty();

     }
}

// hastag 지우기 위한 click event 추가 
document.addEventListener('click', function (e) {
    if (e.target && e.target.id == 'delTag') {
        let targetSpan = e.target.parentNode;
        targetSpan.parentNode.removeChild(e.target.parentNode);
        
        //삭제하려는 해쉬태그 span의 text 가져오기 
        let text = targetSpan.innerText;
        text = text.split(' ')
        console.log(text[1])
       
        // 해쉬태그 단어의 index를 찾아서 제거 
        valArray.splice(valArray.indexOf(text[1]),1);
        // 제거 후 array 다시 input에 넣기 
        $(("#add-hashtag")).val(valArray);
        
    }
});


//해시태그 개수 검사 
function checkQty(){
 let hashtagBox = document.querySelector(".hashtag-wrap");
 let cnt = hashtagBox.querySelectorAll(".hashbadge").length;
 if(cnt > 5){
     alert('hashtag는 5개까지 입력 가능합니다!');
     hashtagBox.removeChild(hashtagBox.children[cnt]);   
 }
 console.log(cnt);
}

//해시태그 입력값 유효성 검사 
function checkValue(input){
 let regexp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>#@\$%&\\\=\(\'\"\s]/gi;
 let value = input.value
     if(regexp.test(value)){
         value = value.replace(regexp, "");
     }
 return value;
}

function changeDetail() {
	// let detail = document.getElementById('write-checkinfo');
	let selected = document.getElementById('select-kindbox');
	let intro = document.getElementById('intro');
	let placeHolder =  document.getElementById('clubContent2');
	
	if (selected.value == 1) {
		intro.innerText = "모임의 인증방법을 설명해주세요!";
		placeHolder.placeholder = "모두가 실천할 수 있도록 구체적인 인증방법을 작성해주세요."
	} else if (selected.value == 2) {
		intro.innerText = "모임의 리더가 되고싶은 회원님은 어떤사람인가요?";
		placeHolder.placeholder = '모임원들에게 멋진 자기소개를 해보세요!';
	}

}

function deleteClub(){
		let delBtn = document.getElementById('delBtn');
		delBtn.onclick = function(){
			let returnValue = confirm("정말로 모임을 삭제하시겠습니까?");
			if(returnValue){
				alert("모임이 삭제되었습니다.");
				window.location.href='deleteClub.do?clubNum=${club.clubNum}';
			}
		}
	}


$(function(){
	

 $('#shut-date').datepicker({
     calendarWeeks: false,
     todayHighlight: true,
     autoclose: true,
     format: "yyyy-mm-dd",
     startDate: '1d',
     endDate:'+1y',
     language: "ko"
 });
 


 $('#start-date').datepicker({
     calendarWeeks: false,
     todayHighlight: true,
     autoclose: true,
     format: "yyyy-mm-dd",
     startDate: '1d',
     endDate:'+1y',
     language: "ko"
 }).on('changeDate', function(selectedDate){
     if($('#start-date').val() < $('#shut-date').val()){
         $('#start-date').datepicker('setDate', new Date($('#shut-date').val()));
     }
 });


     $('#end-date').datepicker({
         calendarWeeks: false,
         todayHighlight: true,
         autoclose: true,
         format: "yyyy-mm-dd",
         startDate: '1d',
         endDate:'+1y',
         language: "ko"
     }).on('changeDate', function(selectedDate){
         if($('#end-date').val() < $('#start-date').val()){
             $('#end-date').datepicker('setDate', new Date($('#start-date').val()));
	        }
	    });
});

</script>
</html>