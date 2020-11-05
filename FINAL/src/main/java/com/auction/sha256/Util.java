package com.auction.sha256;

public class Util {

	public static void main(String[] args) {
		String str = "kok07227";
		String sha256_en = SHA256Util.encrypt(str);

		System.out.println("SHA256 암호화 : "+sha256_en);
	}

}
