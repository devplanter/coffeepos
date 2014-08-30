package com.dp.coffee.restful.test;

import javax.ws.rs.core.MediaType;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

public class CategoryTest {
	private static Log log = LogFactory.getLog(CategoryTest.class);

	private Client client;
	private WebResource webResource;
	private static final String BASE_URL = "http://localhost:8080/coffeepos-web/api/v1";

	@Before
	public void setUp() {
		client = Client.create();
		log.info("CategoryTest Setup");
	}

	@After
	public void tearDown() {
		client.destroy();
		log.info("CategoryTest Finish");
	}

	@Test
	public void testCategoryList() {
		log.info("Begin testCategoryList");
		webResource = client.resource(BASE_URL + "/category");
		String result = webResource.accept(MediaType.APPLICATION_JSON).get(String.class);
		log.info("result=" + result);
		JSONObject js = new JSONObject(result);
		JSONArray jsArray = js.getJSONArray("category");
		Assert.assertNotNull(result);
		Assert.assertTrue(js.length() > 0);
		Assert.assertTrue(jsArray.length() > 0);
		log.info("End testCategoryList");
	}

	@Test
	public void testCategorySearch() {
		log.info("Begin testCategorySearch");
		webResource = client.resource(BASE_URL + "/category/search/category1");
		String result = webResource.accept(MediaType.APPLICATION_JSON).get(String.class);
		log.info("result=" + result);
		JSONObject js = new JSONObject(result);
		Assert.assertNotNull(result);
		Assert.assertTrue(js.length() > 0);
		log.info("End testCategorySearch");
	}

	@Test
	public void testCategoryGet() {
		log.info("Begin testCategoryGet");
		webResource = client.resource(BASE_URL + "/category/1");
		String result = webResource.accept(MediaType.APPLICATION_JSON).get(String.class);
		log.info("result=" + result);
		JSONObject js = new JSONObject(result);
		Assert.assertNotNull(result);
		Assert.assertTrue(js.length() > 0);
		log.info("End testCategoryGet");
	}
	
	
}
