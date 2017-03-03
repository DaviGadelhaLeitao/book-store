package br.com.bookstore.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bookstore.daos.ProductDAO;
import br.com.bookstore.model.PriceType;
import br.com.bookstore.model.Product;
import br.com.bookstore.validation.ProductValidation;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired
	private ProductDAO productDAO;

	// responsible for binding the validator with the controller
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ProductValidation());
	}	
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("/products/form");
		modelAndView.addObject("types", PriceType.values());
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView saveProduct(@Valid Product product, BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return form();
		}
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
