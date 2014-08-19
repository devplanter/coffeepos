package com.dp.coffee.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hashing {
	public static String MD5Hashing(String s) {
		return hashing("MD5", s);
	}

	public static String hashing(String alogorithm, String s) {
		try {
			MessageDigest messagedigest = MessageDigest.getInstance(alogorithm);
			byte[] b = messagedigest.digest(s.getBytes("UTF8"));
			return HexString.toSHexString(b);
		} catch (NoSuchAlgorithmException noSuchAlgorEx) {
			return null;
		} catch (UnsupportedEncodingException unsupportedEx) {
		}
		return null;
	}

	public static void main(String[] argv) {
		String hash = MD5Hashing("password");
		System.out.println(hash);
		assert ("30035607ee5bb378c71ab434a6d05410".compareTo(hash) == 0);
	}
}
