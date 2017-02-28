package br.com.bookstore.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.bookstore.controller.HomeController;
import br.com.bookstore.daos.ProductDAO;

@EnableWebMvc
@ComponentScan(basePackageClasses= {HomeController.class, ProductDAO.class})
public class AppWebConfiguration {
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolve = new InternalResourceViewResolver("/WEB-INF/views/", ".jsp");
		return resolve;
	}

}
