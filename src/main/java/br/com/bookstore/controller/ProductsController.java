package br.com.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.bookstore.model.Product;

@Controller
public class ProductsController {

	@RequestMapping("/products/form")
	public String products() {
		return "/products/form";
	}
	
	@RequestMapping("/products")
	public String saveProduct(Product product) {
		System.out.println(product);
		return "/products/ok";
	}



}
