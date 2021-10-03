<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<header id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <a href="/index"><img src="/resources/image/LOGO6.png" class="logo"></a>
                   
        <div class="menugroup">
            <ul class="navbar-nav me-auto" class="menu">
                <li class="nav-item">
                  <a class="nav-link" href="#">포스</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/sales/${userId}/confirm">매출관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/board/${userId}/notice">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/waiting/${userId}/waiting-page">웨이팅</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/reserve/${userId}/confirm">예약내역</a>
                </li>
                
            </ul>  
            </div>  
            </nav>
    </header>