package br.com.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.bookstore.daos.ProductDAO;
import br.com.bookstore.model.Product;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("/")
	public ModelAndView home() {
		List<Product> products = productDAO.list();
		ModelAndView modelAndView = new ModelAndView("/products/home");
		modelAndView.addObject("products", products);
		return modelAndView;
	}
}
