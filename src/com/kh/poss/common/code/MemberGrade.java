package com.kh.poss.common.code;


//enum(enumerated type) : 열거형 클래스
//서로 연관된 상수들의 집합
//서로 연관된 상수들을 하나의 묶음으로 다루기 위한 enum만의 문법적 형식과 메서드를 제공


//사용 MemberGrade.valueOf(ME00))   = > ME00정보 가져옴. 
public enum MemberGrade {
	

	//회원등급코드 ME00은 코드 info가 '일반'이고 연장 가능횟수가 1회
	//enum은 내부적으로 class임.
	//ME00("일반",1) -> public static final MemberGrade ME00 = new MemberGrade("일반",1);
	
	
	
	ME00("일반",1),  // = > new MemberGrade("일반",1) 이랑 똑같음
	ME01("성실",2),
	ME02("우수",3),
	ME03("VIP",4);

	
	private String desc;   //일반, 성실, 우수 VIP
	private int extendableCnt;   //연장 가능 횟수를 담음


	//함수 호출 없이 상수로 부르기
	//public final String DESC  = >필드변수로 부를 수 있음.
	
	private MemberGrade(String desc, int extendableCnt) {
		this.desc = desc;
		this.extendableCnt = extendableCnt;
	};
	

	
	
	public String desc() {
		return desc;
		
	}
	
	public int extendableCnt() {
		return extendableCnt;
	}
	

	
}
