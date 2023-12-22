package kr.bit.entity;

import lombok.Data;

@Data
public class Member {
	private String memID;     //회원ID
	private String memPwd;    //회원비번
	private String memName;   //회원이름
	private String memPhone;  //회원전화번호
	private String memAddr;   //회원주소
	private double latitude;  //현재위치위도
	private String longitude; //현재위치경도
}
