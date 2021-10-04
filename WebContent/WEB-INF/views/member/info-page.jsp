<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script defer src="/resources/js/info-page.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/info-page.css">
    
    <style>
    
 	
 	.nav{
        width:130px;
        font-size:20px;
        font-weight: 600;
        color:#343a40;
    }

    .nav:hover{
        color:#61bfad;
        cursor:pointer;
        
    }
 
 	.header{
        width:100%;
        display:flex;
        justify-content: center;
        position: fixed;
        background-color: #fff;
        z-index:10;
        box-shadow: 0px 2px #ddd;
    }

    header{
        width:1280px;
        display:flex;
        justify-content: space-between;
        align-items: center;
    }
    </style>


    
    <title>POSS</title>

</head>
<body>
        <div id="wrap">
            <div class="header">
                <header>
                    <div class="logo"><img src="/resources/image/LOGO2.png"></div>
                    <div class="nav">
                        <div class="nav1"><a href="/member/login-form">가맹점 로그인</a></div>
                    </div>
                </header>
            </div>

            <section id="con1">
                <div class="title">POSS답게, 포스와는 다르게</div>
                <div class="con1logo"><img src="/resources/image/LOGO2.png"></div>
                <div class="ipadimg slide-left"><img src="/resources/image/ipad.png"></div>
            </section>

            <section id="con2">
                <div class="con2zone">
                    <div class="appleimg"><button class="btn btn-light" onclick = "location.href = '/member/login-form'">join with <p>POSS</p></button></div>
                    <div class="area1 slide-right">
                        <div class="tit1">tab, phone, web 모두 POS가 되다.</div>
                        <div class="des1">POS가 바뀌면 일하는 방식과<br>고객의 경험이 달라진다.</div>
                    <div class="hr1 slide-left"><hr></div>
                </div>
                    <div class="area2 slide-left">
                        <div class="tit2">누구나 쉽게, 편리하게, 신속하게</div>
                        <div class="des2">POSS는 비즈니스 관리의 모든 것을
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            제공하는 포스 솔루션입니다.</div>
                    <div class="hr2 slide-right"><hr></div>
                    </div>
                </div>
            </section>

            <div class="resaler"><img src="/resources/image/resaler.png"></div>

            <section id="con3">
                <div class="con3tit">숫자로 말하는 포오-쓰</div>
                <div class="con3area">
                    <div class="count1"><img src="/resources/image/one.png">구현해조 제작 첫번째 프로젝트 </div>
                    <div class="count5"><img src="/resources/image/five.png">총 5명의 팀원이 참여</div>
                    <div class="counti"><img src="/resources/image/infinte.png">평생 책임 AS</div>
                </div>
            </section>

            <section id="con4">
                <div class="hr4"><hr></div>
                <div class="con4wrap">
                    <div class="ipadimg2"><img src="/resources/image/ipad2.png">
                        <div class="slider">
                            <div><img id="img1" src="/resources/image/main.png"></div>
                            <div><img src="/resources/image/sales.png"></div>
                          </div>
                    </div>
                
                    <div class="con4area">
                        
                        <div class="con4tit">새로워진 UI UX</div>
                        <div class="con4sub1">누구에게나 쉽게</div>
                        <div class="con4sub2">사용하기 편한 구성</div>
                        <div class="con4des1">깔끔한 UI로 다양한 기능들이</div>
                        <div class="con4des2">한 눈에 쏙</div>
                    </div>
                </div>
            </section>

            <section id="con5">
                <div class="hr5"><hr></div>
                <div class="con5wrap">
                    <div class="ipadimg3"><img src="/resources/image/ipad2.png">
                        <div class="slider">
                            <div><img id="img2" src="/resources/image/table.png"></div>
                            <div><img src="/resources/image/table-modify.png"></div>
                            <div><img src="/resources/image/menu.png"></div>
                            <div><img src="/resources/image/menu-modify.png"></div>
                          </div>
                    </div>
                    <div class="con5area">
                        
                        <div class="con5tit">디테일한 에디터 기능</div>
                        <div class="con5sub1">더 자유롭게</div>
                        <div class="con5sub2">더 예쁘게</div>
                        <div class="con5des1">다양한 아이콘과 색상선택으로</div>
                        <div class="con5des2">마음대로 커스텀 가능</div>
                        <div class="con5des3">매장 구조를 그대로 재현해내는</div>
                        <div class="con5des4">테이블 조절 디테일까지!</div>
                    </div>
                </div>
            </section>

            <section id="con6">
                <div class="hr6"><hr></div>
                <div class="con6wrap">
                    <div class="ipadimg4"><img src="/resources/image/ipad2.png">
                        <div class="slider">
                            <div><img id="img4" src="/resources/image/waiting.png"></div>
                            <div><img src="/resources/image/popup.png"></div>
                            <div><img src="/resources/image/waing-confirm.png"></div>
                            
                          </div>
                    </div>
                    <div class="con6area">
                        
                        <div class="con6tit">웨이팅 관리 기능</div>
                        <div class="con6sub1">웨이팅관리도</div>
                        <div class="con6sub2">보다 더 편리하게</div>
                        <div class="con6des1">프로그램을 여러 개 관리 할 필요없이</div>
                        <div class="con6des2">내역 문자 전송까지</div>
                        <div class="con6des3">POSS에서 한번에!</div>
                    </div>
                </div>
            </section>

            <section id="con7">
                <div class="hr7"><hr></div>
                <div class="con7wrap">
                    <div class="ipadimg5"><img src="/resources/image/multi.png"></div>
                    <div class="con7area">
                        
                        <div class="con7tit">예약 & 게시판 기능</div>
                        <div class="con7sub1">예약 & 게시판 페이지</div>
                        <div class="con7sub2">매장별 지원</div>
                        <div class="con7des1">모바일 지원 예약 & 게시판 기능을 </div>
                        <div class="con7des2">POSS에서 편리하게</div>
                    </div>
                </div>
            </section>

            <section id="con8">
                <div class="con8wrap">
                    <div class="ipadimg6"><img src="/resources/image/footer.png"></div>
                    <div class="con8area">
                        <div class="con8tit">POSS, 지금 바로 사용해보세요!</div>
                        <div class="startbtn"><button class="btn btn-light" onclick = "location.href = '/member/login-form'">join with <p>POSS</p></button></div>
                        <div class="con8des1">고객만족센터 : 9999-9999</div>
                        <div class="con8des2">전문 포스너가 빠르게 안내해드립니다.</div>                        
                    </div>
                </div>
            </section>

            

            <footer>
                <div class="footerwrap">
                    <div class="product">프로젝트 참여</div>
                    <div class="team" id="team"><img src="/resources/image/구현해조 팀원 소개.png"></div>
                    <div class="sad" id="sad" style="display:none;"><img src="/resources/image/sad.png"></div>    
                </div>

            </footer>

            <div id="footer"></div>
    </div>

</body>
</html>