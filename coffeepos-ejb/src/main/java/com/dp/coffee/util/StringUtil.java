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

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class StringUtil {
	public static boolean isEmpty(String s) {
		if (s == null) {
			return true;
		}
		return s.trim().length() == 0;
	}

	public static List<String> toList(String s, String separator) {
		if (isEmpty(s)) {
			return new ArrayList();
		}
		return Arrays.asList(s.split(separator));
	}

	public static Date toDate(String s, String format) {
		if (isEmpty(s)) {
			return null;
		}
		DateFormat df = new SimpleDateFormat(format);
		try {
			return df.parse(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println(toList("Name is John", " "));
		System.out.println(toDate("2013-01-25", "yyyy-MM-dd"));
	}
}
