package com.dp.coffee.restful;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dp.coffee.entity.Product;
import com.dp.coffee.facade.ProductFacade;
import com.google.inject.Inject;

@Path("/product")
public class ProductApi {
	@Inject
	private ProductFacade productFacade;

	// http://localhost:8080/coffeepos-web/api/v1/product
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Product> listProductAll() {
		return productFacade.findAll();
	}

	// http://localhost:8080/coffeepos-web/api/v1/product/1
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Product listProductById(@PathParam("id") final int id) {
		return productFacade.findById(id);
	}

	// http://localhost:8080/coffeepos-web/api/v1/product/category/1
	@GET
	@Path("category/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Product> listProductByCategory(@PathParam("id") final int id) {
		return productFacade.findByCategory(id);
	}

}
