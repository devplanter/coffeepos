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

public class FileUtil {
	private static final String[] imageContentTypes = { "image/gif", "image/jpeg", "image/pjpeg", "image/png", "image/svg+xml", "image/tiff" };

	public static boolean isImageContent(String contentType) {
		for (String s : imageContentTypes) {
			if (s.equalsIgnoreCase(contentType)) {
				return true;
			}
		}
		return false;
	}

	public static String getFileExtension(String s, String realFile) {
		int i = realFile.lastIndexOf(".");
		if (i != -1) {
			String ext = realFile.substring(i, realFile.length());
			s = s.replace(".tmp", ext);
		}
		return s;
	}

	public static String getRelativePath(String file, String toReplace) {
		file = file.replaceAll("[\\\\]", "/");
		file = file.substring(file.indexOf("images"), file.length());
		return toReplace + file;
	}
}
