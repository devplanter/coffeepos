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

package com.dp.coffee.guice;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Singleton;
import com.google.inject.persist.jpa.JpaPersistModule;
import com.google.inject.servlet.GuiceServletContextListener;
import com.google.inject.servlet.ServletModule;
import com.google.inject.struts2.Struts2GuicePluginModule;
import com.sun.jersey.api.core.PackagesResourceConfig;
import com.sun.jersey.guice.spi.container.servlet.GuiceContainer;

public class GuiceListener extends GuiceServletContextListener {

	public Injector getInjector() {
		Injector injector = Guice.createInjector(new Struts2GuicePluginModule(), new JpaPersistModule("coffeepos-pu"), new ServletModule() {
			@Override
			protected void configureServlets() {
				// serve struts2
				bind(StrutsPrepareAndExecuteFilter.class).in(Singleton.class);
				filter("/*").through(StrutsPrepareAndExecuteFilter.class);

				// serve restful APIs
				bind(GuiceContainer.class);
				PackagesResourceConfig resourceConfig = new PackagesResourceConfig("com.dp.coffee.restful");
				for (Class<?> resource : resourceConfig.getClasses()) {
					bind(resource);
				}
				serve("/api/v1/*").with(GuiceContainer.class);
			}
		});
		injector.getInstance(JPAInitializer.class);
		return injector;
	}

}