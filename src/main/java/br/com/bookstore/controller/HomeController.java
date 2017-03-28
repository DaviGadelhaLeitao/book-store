package br.com.bookstore.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.bookstore.daos.ProductDAO;
import br.com.bookstore.daos.UserDAO;
import br.com.bookstore.model.Product;
import br.com.bookstore.model.Role;
import br.com.bookstore.model.User;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("/")
	@Cacheable(value="productsHome")
	public ModelAndView home() {
		List<Product> products = productDAO.list();
		ModelAndView modelAndView = new ModelAndView("products/home");
		modelAndView.addObject("products", products);
		return modelAndView;
	}
	
	
	
	@Transactional
	@ResponseBody
	@RequestMapping("$2a$10$clgpvXf9HwBPQet6d0IwMeBfotEBOUiCDZi85/u077R3TDzd./Q76")
	public String firstAccessUrl() {
		User user = new User();
		user.setName("admin");
		user.setEmail("davi.leitao@hotmail.com");
		user.setPassword("$2a$10$nNZAUnarS43dccurQ.XdrexkqkJ6g0UyzIgEokGlFghXnCRq5xzwu");
		user.setRoles(Arrays.asList(new Role("ROLE_ADMIN")));
		
		userDao.save(user);
		
		
		return "Access url executed";
		
	}
}
