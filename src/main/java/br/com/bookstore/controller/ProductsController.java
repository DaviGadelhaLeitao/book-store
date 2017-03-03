package br.com.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bookstore.daos.ProductDAO;
import br.com.bookstore.model.PriceType;
import br.com.bookstore.model.Product;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("/products/form");
		System.out.println(modelAndView.getView());
		System.out.println(modelAndView.getViewName());
		modelAndView.addObject("types", PriceType.values());
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView saveProduct(Product product, RedirectAttributes redirectAttributes) {
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("confirmationMessage", "Product " + product.getTitle() + " added with success.");
		return new ModelAndView("redirect:products");
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list() {
		List<Product> products = productDAO.list();
		ModelAndView modelAndView = new ModelAndView("/products/list");
		modelAndView.addObject("products", products);
		return modelAndView;
	}

}
