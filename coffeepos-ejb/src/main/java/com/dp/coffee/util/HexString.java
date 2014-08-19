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

public class HexString {
	public static String toHexString(byte[] b) {
		return toSHexString(b).toUpperCase();
	}

	public static String toSHexString(byte[] b) {
		StringBuffer a = new StringBuffer();
		byte[] arrayOfByte = b;
		int j = b.length;
		for (int i = 0; i < j; i++) {
			byte aB = arrayOfByte[i];
			String hex = Integer.toHexString(aB & 0xFF);
			if (hex.length() < 2) {
				a.append("0");
			}
			a.append(hex);
		}
		return new String(a);
	}

	public static byte[] fromHexString(String s) {
		byte[] result = new byte[s.length() / 2];
		String ss = s.toUpperCase();
		int i = 0;
		for (int k = 0; k < s.length(); k += 2) {
			result[i] = ((byte) Integer.parseInt(ss.substring(k, k + 2), 16));
			i++;
		}
		return result;
	}

	public static String fromPcHexString(String s) {
		char[] result = new char[s.length()];
		String ss = s.toUpperCase();
		int k = 0;
		for (int i = 0; i < s.length(); k++) {
			if (s.charAt(i) == '%') {
				result[k] = ((char) Integer.parseInt(ss.substring(i + 1, i + 3), 16));
				i += 2;
			} else {
				result[k] = s.charAt(i);
			}
			i++;
		}
		return new String(result, 0, k);
	}
}
