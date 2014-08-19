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

public class UniqueId {
	public static String generateUniqueId(String... key) {
		long l = System.currentTimeMillis();
		int i = Thread.currentThread().hashCode();
		StringBuffer sb = new StringBuffer().append(i).append(l);
		String[] arrayOfString = key;
		int j = key.length;
		for (i = 0; i < j; i++) {
			String iKey = arrayOfString[i];
			sb.append(iKey);
		}
		return Hashing.MD5Hashing(sb.toString());
	}

	public static void main(String[] argv) {
		String[] s = new String[100];
		for (int i = 0; i < 100; i++) {
			s[i] = generateUniqueId(new String[] { i + " secret=abc" });
		}
		for (String t : s) {
			System.out.println(t);
		}
	}
}
