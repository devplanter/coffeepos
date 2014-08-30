package com.dp.coffee.restful;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dp.coffee.entity.Category;
import com.dp.coffee.facade.CategoryFacade;
import com.google.inject.Inject;

@Path("/category")
public class CategoryApi {

	@Inject
	private CategoryFacade categoryFacade;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Category> list() {
		return categoryFacade.findAll();
	}

	@GET
	@Path("search/{term}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Category> search(@PathParam("term") final String term) {
		return categoryFacade.findByName(term);
	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Category get(@PathParam("id") final int id) {
		return categoryFacade.find(id);
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Category create(Category category) {
		return categoryFacade.create(category);
	}

	@PUT
	@Path("{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Category update(Category category) {
		return categoryFacade.update(category);
	}
}
