package com.dp.coffee.test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.dp.coffee.entity.User;

public class Test {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("coffeepos-pu");
		EntityManager em = factory.createEntityManager();

		Query q = em.createQuery("select u from User u");
		List<User> list = q.getResultList();

		for (User u : list) {
			System.out.println(u.getUsername());
			System.out.println(u.getGroup());
		}
		em.close();
	}

}
