<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script defer src="/resources/js/modal.js"></script>
    


<div class=dimm style="display:none;
    width:100%;
    height:100%;
    position: absolute;
    background-color: rgb(0,0,0,0.5);
    z-index:1000;
    top:0px;"></div>



<!-- yes or no 모달 -->
<div class="modal" style="display:none; margin-top:30vh" id="modal1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal1-title">제목</h5>
                <button type="button" id="close_btn1" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body" id="modal1-body">
                <p>내용</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="yes" class="btn btn-primary" onclick="clickYes(setYesFunc)">예</button>
                <button type="button" id="no" class="btn btn-secondary" data-bs-dismiss="modal" onclick="clickNo(setNoFunc)">아니요</button>
            </div>
        </div>
    </div>
</div>
<!-- yes or no 모달  end -->

<!-- okay 모달 -->
<div class="modal" style="display:none; margin-top:30vh" id="modal2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal2-title">제목</h5>
                <button type="button" id="close_btn2" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body" id="modal2-body">
                <p>내용</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="okay" class="btn btn-primary" data-bs-dismiss="modal" onclick="clickOkay(setOkayFunc)">확인</button>
            </div>
        </div>
    </div>
</div>
<!--  okay 모달 end -->

<!-- okay 모달 -->
<div class="modal" style="display:none; margin-top:30vh" id="modal3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal3-title">제목</h5>
                <button type="button" id="close_btn3" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body" id="modal3-body">
                <p>내용</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="confirm" class="btn btn-primary" data-bs-dismiss="modal" onclick="clickConfirm(setConfirmFunc)">확인</button>
            </div>
        </div>
    </div>
</div>
<!--  okay 모달 end -->
