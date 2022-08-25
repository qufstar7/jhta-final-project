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
<title>게스트 숫자와 객실 정보</title>
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
				<div role="text" class="left-main-text">숙소에서 맞이할 최대 인원수를 알려주세요.</div>
			</div>
		</div>

		<!-- 오른쪽 영역 -->
		<div id="right-div">
			<!-- rightDiv header nav -->
			<div class="right-div-header">
				<nav class="navbar navbar-expand-lg navbar-light pt-4 pb-3 bg-white" style="z-index: 100;">
					<div class="container-fluid flex-row-reverse">
						<div id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item nav-ask-superhost"><a class="profile-btn right-nav-btn nav-link active border rounded-pill" href="">
										<div>
											<img class="sm-profile-img back-img" src="/resources/images/profile/${LOGIN_USER.profileImage }" aria-hidden="true">
										</div> 
										<span class="profile-text ms-3">${LOGIN_USER.name }님의 숙소 등록하기</span>
								</a></li>
								<li class="nav-item"><a class="right-nav-btn nav-link active border rounded-pill" href="">도움말</a></li>
								<li class="nav-item"><a class="right-nav-btn nav-link active border rounded-pill" href="/host/become-a-host">저장 및 나가기</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<!-- rightDiv main -->
			<div class="main-box d-flex align-content-center bg-white" style="flex-direction:column;">
				
				<div id="guestBox" class="m-auto d-flex align-content-center" style="width:40%; height:15%;">
					<span class="fs-3 m-auto" style="min-width:200px;">
						게스트
					</span>				
					<div class="plusMiusBox float-end" id="guestBtnBox">
					
						<button id="guestMinusBtn" class="plusMinusBtn minusBtn" type="button" aria-label="감소">
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28"></path>
								</svg>
							</span>
						</button>
						
						<div class="" id="guestNum">
						<c:if test="${not empty REGISTER_ACC.guest }">
							<span aria-hidden="true">${REGISTER_ACC.guest }</span>
						</c:if> 
						<c:if test="${empty REGISTER_ACC.guest}">
							<span aria-hidden="true">4</span>
						</c:if> 
						</div>
						
						<button id="guestPlusBtn" class="plusMinusBtn plusBtn" type="button" aria-label="증가">
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28m-14-14v28"></path>
								</svg>
							</span>
						</button>						
					</div>
				</div>
				
				<div id="bedBox" class="m-auto d-flex align-content-center" style="width:40%; height:15%;">
					<span class="fs-3 m-auto" style="min-width:200px;">
						침대
					</span>				
					<div class="plusMiusBox float-end" id="bedBtnBox">
					
						<button id="bedMinusBtn" class="plusMinusBtn minusBtn" type="button" aria-label="감소">
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28"></path>
								</svg>
							</span>
						</button>
						
						<div class="" id="bedNum">
						<c:if test="${not empty REGISTER_ACC.room.bed }">
							<span aria-hidden="true">${REGISTER_ACC.room.bed }</span>
						</c:if> 
						<c:if test="${empty REGISTER_ACC.room.bed }">
							<span aria-hidden="true">1 </span>
						</c:if> 
						</div>
						
						<button id="bedPlusBtn" class="plusMinusBtn plusBtn" type="button" aria-label="증가">
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28m-14-14v28"></path>
								</svg>
							</span>
						</button>						
					</div>
				</div>
				
				<div id="bedroomBox" class="m-auto d-flex align-content-center" style="width:40%; height:15%;">
					<span class="fs-3 m-auto" style="min-width:200px;">
						침실
					</span>				
					<div class="plusMiusBox float-end" id="bedroomBtnBox">
					
						<button id="bedroomMinusBtn" class="plusMinusBtn minusBtn" type="button">
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28"></path>
								</svg>
							</span>
						</button>
						
						<div class="" id="bedroomNum">
						<c:if test="${not empty REGISTER_ACC.room.bedroom }">
							<span aria-hidden="true">${REGISTER_ACC.room.bedroom }</span>
						</c:if> 
						<c:if test="${empty REGISTER_ACC.room.bedroom }">
							<span aria-hidden="true">1 </span>
						</c:if> 
						</div>
						
						<button id="bedroomPlusBtn" class="plusMinusBtn plusBtn" type="button">
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28m-14-14v28"></path>
								</svg>
							</span>
						</button>						
					</div>
				</div>
			
				<div id="bathroomBox" class="m-auto d-flex align-content-center" style="width:40%; height:15%;">
					<span class="fs-3 m-auto" style="min-width:200px;">
						욕실
					</span>				
					<div class="plusMiusBox float-end" id="bathroomBtnBox">
					
						<button id="bathroomMinusBtn" class="plusMinusBtn minusBtn" type="button" aria-label="감소">
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28"></path>
								</svg>
							</span>
						</button>
						
						<div class="" id="bathroomNum">
						<c:if test="${not empty REGISTER_ACC.room.bathroom }">
							<span aria-hidden="true">${REGISTER_ACC.room.bathroom }</span>
						</c:if> 
						<c:if test="${empty REGISTER_ACC.room.bathroom }">
							<span aria-hidden="true">1 </span>
						</c:if> 
						</div>
						
						<button id="bathroomPlusBtn" class="plusMinusBtn plusBtn" type="button" aria-label="증가" >
							<span class="plusMinusIconSpan"> <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentColor; stroke-width: 5.333333333333333; overflow: visible" aria-hidden="true" role="presentation" focusable="false">
									<path d="m2 16h28m-14-14v28"></path>
								</svg>
							</span>
						</button>						
					</div>
				</div>
				<form id="form-select-guests" method="post" action="/host/submitGuests">
					<input id="guestInput" type="hidden" name="guest" value="4">
					<input id="bedInput" type="hidden" name="bed" value="1">
					<input id="bedroomInput" type="hidden" name="bedroom" value="1">
					<input id="bathroomInput" type="hidden" name="bathroom" value="1">
				</form>
			</div>

			<!-- rightDiv footer -->
			<footer class="footer mt-auto pb-3 bg-light">
				<div class="container-fluid">
					<!-- 진행상황 bar -->
					<div class="progress mb-2">
						<div class="progress-bar bg-dark" style="width: 41.6%;" role="progressbar" aria-valuenow="41.6" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<!-- 뒤로/다음버튼 -->
					<div class="">
						<button id="back-btn" class="float-start btn btn-none ms-4 fs-6 text-decoration-underline text-black border-0" type="button" onclick="location.href='/host/locationDetail'" style="padding-top: 14px">뒤로</button>
					</div>
					<div class="">
						<button id="next-btn" class="float-start btn btn-dark float-end" type="submit" form="form-select-guests" onclick="" style="width: 80px; height: 48px;">다음</button>
					</div>
				</div>
			</footer>

		</div>

	</div>

	<script type="text/javascript">
		$(function(){
			var $guestNum = Number( $("#guestNum").text() );
			var $bedNum = Number( $("#bedNum").text() );
			var $bedroomNum = Number( $("#bedroomNum").text() );
			var $bathroomNum = Number( $("#bathroomNum").text() );
			
			// 더하기버튼
			$("#guestPlusBtn").on("click", function() {
				// button값 변경
				$guestNum += 1;
				$("#guestNum").text($guestNum);
				// input 값 변경
				let afterVal = Number( $("#guestInput").val() ) + 1;
				$("#guestInput").val(afterVal);
				
				if ($guestNum == 16) { // 최대값 16
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					return false;
				}
				if ($guestNum == 2) { // 최소값 1
					$("#guestMinusBtn").attr("disabled", false);
					$("#guestMinusBtn").removeClass("disabledBtn");
				}
			})
			
			$("#bedPlusBtn").on("click", function() {
				$bedNum += 1;
				$("#bedNum").text($bedNum);
				
				let afterVal = Number( $("#bedInput").val() ) + 1;
				$("#bedInput").val(afterVal);
				
				if ($bedNum == 50) {
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					return false;
				}
				if ($bedNum == 1) {
					$("#bedMinusBtn").attr("disabled", false);
					$("#bedMinusBtn").removeClass("disabledBtn");
				}
			})
			
			$("#bedroomPlusBtn").on("click", function() {
				$bedroomNum += 1;
				$("#bedroomNum").text($bedroomNum);
				
				let afterVal = Number( $("#bedroomInput").val() ) + 1;
				$("#bedroomInput").val(afterVal);
				
				if ($bedroomNum == 50) {
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					return false;
				}
				if ($bedroomNum == 1) {
					$("#bedroomMinusBtn").attr("disabled", false);
					$("#bedroomMinusBtn").removeClass("disabledBtn");
				}
			})
			$("#bathroomPlusBtn").on("click", function() {
				$bathroomNum += 1;
				$("#bathroomNum").text($bathroomNum);
				
				let afterVal = Number( $("#bathroomInput").val() ) + 1;
				$("#bathroomInput").val(afterVal);
				if ($bathroomNum == 50) {
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					return false;
				}
				if ($bathroomNum == 1) {
					$("#bathroomMinusBtn").attr("disabled", false);
					$("#bathroomMinusBtn").removeClass("disabledBtn");
				}
			})

			// 뺴기버튼
			$("#guestMinusBtn").on("click", function() {
				$guestNum -= 1;
				$("#guestNum").text($guestNum);
				
				let afterVal = Number( $("#guestInput").val() ) - 1;
				$("#guestInput").val(afterVal);
				
				if ($guestNum == 15) {
					$("#guestPlusBtn").attr("disabled", false);
					$("#guestPlusBtn").removeClass("disabledBtn");
				}
				if ($guestNum == 1) {
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					
					return false;
				}
			})
			$("#bedMinusBtn").on("click", function() {
				$bedNum -= 1;
				$("#bedNum").text($bedNum);
				
				let afterVal = Number( $("#bedInput").val() ) - 1;
				$("#bedInput").val(afterVal);
				//
				if ($bedNum == 49) {
					$("#bedPlusBtn").attr("disabled", false);
					$("#bedPlusBtn").removeClass("disabledBtn");
				}
				if ($bedNum == 0) {
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					return false;
				}
			})
			$("#bedroomMinusBtn").on("click", function() {
				$bedroomNum -= 1;
				$("#bedroomNum").text($bedroomNum);
				
				let afterVal = Number( $("#bedroomInput").val() ) - 1;
				$("#bedroomInput").val(afterVal);
				if ($bedroomNum == 49) {
					$("#bedroomPlusBtn").attr("disabled", false);
					$("#bedroomPlusBtn").removeClass("disabledBtn");
				}
				if ($bedroomNum == 0) {
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					return false;
				}
			})
			$("#bathroomMinusBtn").on("click", function() {
				$bathroomNum -= 1;
				$("#bathroomNum").text($bathroomNum);
				
				let afterVal = Number( $("#bathroomInput").val() ) - 1;
				$("#bathroomInput").val(afterVal);
				if ($bathroomNum == 49) {
					$("#bathroomPlusBtn").attr("disabled", false);
					$("#bathroomPlusBtn").removeClass("disabledBtn");
				}
				if ($bathroomNum == 0) {
					$(this).attr("disabled", true);
					$(this).addClass("disabledBtn");
					return false;
				}
			})
			
		})
	</script>
</body>
</html>