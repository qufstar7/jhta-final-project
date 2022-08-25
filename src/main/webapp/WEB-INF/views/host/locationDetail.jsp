<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preload" href="${path}/resources/css/hostingstyle.css" as="style">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>주소 확인</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/hostingstyle.css">
</head>
<body>

	<!-- 로고 홈링크 -->
	<a id="logo-link" href="/"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-label="에어비앤비 홈페이지" role="img" focusable="false">
			<path
				d="M16 1c2.008 0 3.463.963 4.751 3.269l.533 1.025c1.954 3.83 6.114 12.54 7.1 14.836l.145.353c.667 1.591.91 2.472.96 3.396l.01.415.001.228c0 4.062-2.877 6.478-6.357 6.478-2.224 0-4.556-1.258-6.709-3.386l-.257-.26-.172-.179h-.011l-.176.185c-2.044 2.1-4.267 3.42-6.414 3.615l-.28.019-.267.006C5.377 31 2.5 28.584 2.5 24.522l.005-.469c.026-.928.23-1.768.83-3.244l.216-.524c.966-2.298 6.083-12.989 7.707-16.034C12.537 1.963 13.992 1 16 1zm0 2c-1.239 0-2.053.539-2.987 2.21l-.523 1.008c-1.926 3.776-6.06 12.43-7.031 14.692l-.345.836c-.427 1.071-.573 1.655-.605 2.24l-.009.33v.206C4.5 27.395 6.411 29 8.857 29c1.773 0 3.87-1.236 5.831-3.354-2.295-2.938-3.855-6.45-3.855-8.91 0-2.913 1.933-5.386 5.178-5.42 3.223.034 5.156 2.507 5.156 5.42 0 2.456-1.555 5.96-3.855 8.907C19.277 27.766 21.37 29 23.142 29c2.447 0 4.358-1.605 4.358-4.478l-.004-.411c-.019-.672-.17-1.296-.714-2.62l-.248-.6c-1.065-2.478-5.993-12.768-7.538-15.664C18.053 3.539 17.24 3 16 3zm.01 10.316c-2.01.021-3.177 1.514-3.177 3.42 0 1.797 1.18 4.58 2.955 7.044l.21.287.174-.234c1.73-2.385 2.898-5.066 2.989-6.875l.006-.221c0-1.906-1.167-3.4-3.156-3.421h-.001z"
			></path>
		</svg>
	</a>

	<!-- 전체 박스 -->
	<div class="host-box">

		<!-- 왼쪽 영역 -->
		<div id="left-div">
			<!-- leftDiv text -->
			<div class="align-self-center m-5">
				<div role="text" class="left-main-text">숙소 위치를 확인하세요.</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="right-div">
			<!-- rightDiv header nav -->

			<div id="map" class="" style="height: 95vh;">

				<nav class="navbar navbar-expand-lg navbar-light pt-4 pb-3" style="z-index: 100;">
					<div class="container-fluid flex-row-reverse">
						<div id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item nav-ask-superhost"><a id="locationProfileBtn" class="profile-btn right-nav-btn nav-link active rounded-pill" href="">
										<div id="locationProfileImgBox" class="float-start">
											<img id="locationProfileImg" class="sm-profile-img front-img float-start" src="/resources/images/profile/${LOGIN_USER.profileImage }" aria-hidden="true">
										</div> 
										<span id="locationProfileText" class="profile-text">${LOGIN_USER.name }님의 숙소 등록하기</span>
								</a></li>
								<li class="nav-item"><a id="locationRightNavBtn" class="right-nav-btn nav-link active border rounded-pill" href="">도움말</a></li>
								<li class="nav-item"><a id="locationRightNavBtn" class="right-nav-btn nav-link active border rounded-pill" href="/host/become-a-host">저장 및 나가기</a></li>
							</ul>
						</div>
					</div>
				</nav>

			</div>


			<!--  -->			
			<div class="">
				<input type="hidden" id="latHiddenBox" value="${registerAcc.latitude }"> <input type="hidden" id="lngHiddenBox" value="${registerAcc.longitude }"> <input type="hidden" id="adrHiddenBox" value="${registerAcc.address }">
			</div>



			<!-- rightDiv footer -->
			<footer class="footer mt-auto pb-3 bg-light" id="locationFooter">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 33.3%;"
							role="progressbar" aria-valuenow="33.3" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div id="">
						<button id="back-btn" class="float-start btn btn-none ms-4 text-decoration-underline text-black border-0" type="button" onclick="location.href='/host/location'" style="padding-top: 14px">뒤로</button>
					</div>
					<div id="">
						<button id="next-btn" class="float-start btn btn-dark float-end me-5" onclick="location.href='/host/guests'" form="locationRegisterForm" type="button" style="width: 80px; height: 48px;">다음</button>
					</div>
				</div>
			</footer>

		</div>

	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cab848c52c03c8f8a6cb0e9effb127a&libraries=services"></script>
	<script>
		$(function() {
			// 위도,경도,주소 객체
			var lat = Number($("#latHiddenBox").val());
			var lng = Number($("#lngHiddenBox").val());
			var adr = $.trim($("#adrHiddenBox").val());

			console.log(lat, lng, adr);

			// 엔터키방지
			document.addEventListener('keydown', function(event) {
				if (event.keyCode === 13) {
					event.preventDefault();
				}
				;
			}, true);

			// 카카오맵 2
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(lat, lng);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 마커가 드래그 가능하도록 설정합니다 
			// marker.setDraggable(true); 

			var iwContent = '<div class="infoWindow">' + adr + '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			
			iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);

		})
	</script>

</body>
</html>