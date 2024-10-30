package myweb.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Map;

public class URITest {
	public static void main(String[] args) throws UnsupportedEncodingException {
		String str = "abcd";
		String str2 = "가나다라";
		String str3 = "1234abc가나다";
		
		System.out.println(URLEncoder.encode(str3, "CESU-8"));
		
		Charset ch = Charset.defaultCharset();
		ch.availableCharsets();
		Map chset = Charset.availableCharsets();
		System.out.println(chset);
	}
}
