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

public class NumberPattern {
	public static String getPattern(String prefix, String n, int length) {
		if (n == null) {
			n = "1";
		}
		int l = n.length();
		int diff = length - prefix.length() - l;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < diff; i++) {
			sb.append("0");
		}
		sb.append(n);

		return prefix + sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(getPattern("P", "1000", 7));
	}
}
