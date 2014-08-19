/**
 * Copyright (C) 2014 DevPlanter Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.dp.coffee.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;

public class DESedeEncrypt {
	private static byte[] key = { 94, 41, -98, -89, 81, -83, -108, 2, 127, 69, -39, -101, 47, 118, 59, 22, -83, 91, 26, -119, -62, 100, 79, -98 };

	public static byte[] encrypt(String clearText) {
		try {
			Cipher cipher = Cipher.getInstance("DESede/ECB/PKCS5Padding");
			DESedeKeySpec keyspec = new DESedeKeySpec(key);
			SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("DESede");
			SecretKey secretKey = keyfactory.generateSecret(keyspec);
			cipher.init(1, secretKey);
			return cipher.doFinal(clearText.getBytes("UTF8"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public static String decrypt(byte[] cipherText) {
		try {
			Cipher cipher = Cipher.getInstance("DESede/ECB/PKCS5Padding");
			DESedeKeySpec keyspec = new DESedeKeySpec(key);
			SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("DESede");
			SecretKey secretKey = keyfactory.generateSecret(keyspec);
			cipher.init(2, secretKey);
			byte[] abyte1 = cipher.doFinal(cipherText);
			return new String(abyte1);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public static void main(String[] argv) {
		String clearText = "root";
		byte[] b = encrypt(clearText);
		System.out.println("toSHexString=" + HexString.toSHexString(b));
		String s2 = "da0b3b510d407ca36f431fe0c305069f";
		String s3 = decrypt(HexString.fromHexString(s2));
		System.out.println(s3);
	}
}
