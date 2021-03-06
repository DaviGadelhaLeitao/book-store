package br.com.bookstore.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bookstore.daos.ProductDAO;
import br.com.bookstore.infrastructure.FileSaver;
import br.com.bookstore.model.PriceType;
import br.com.bookstore.model.Product;
import br.com.bookstore.validation.ProductValidation;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired
	private FileSaver fileSaver;
	
	@Autowired
	private ProductDAO productDAO;

	// responsible for binding the validator with the controller
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ProductValidation());
	}
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", PriceType.values());
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value="productsHome", allEntries=true)
	public ModelAndView saveProduct(MultipartFile file, @Valid Product product, BindingResult result, RedirectAttributes redirectAttributes) {
		System.out.println(file.getOriginalFilename());
			
		if (result.hasErrors()) {
			System.out.println(result.getFieldError());
			return form(product);
		}
		String path = fileSaver.write("fileLocation", file);
		product.setFileLocation(path);
		
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("bookAddedMessage", "Product " + product.getTitle() + " added with success.");
		return new ModelAndView("redirect:/products");
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list() {
		List<Product> products = productDAO.list();
		ModelAndView modelAndView = new ModelAndView("/products/list");
		modelAndView.addObject("products", products);
		return modelAndView;
	}
	
	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("/products/detail");
		Product product = productDAO.find(id);
		
		modelAndView.addObject("product", product);
		return modelAndView;
	}
	
//	@RequestMapping("/alterar/{id}")
//	public ModelAndView alterar(@PathVariable("id") Integer id) {
//		ModelAndView modelAndView = new ModelAndView("/products/form");
//		Product product = productDAO.find(id);
//		
//		modelAndView.addObject("product", product);
//		return modelAndView;
//	}
	@RequestMapping("/alterar/{id}")
	public ModelAndView alterar(@PathVariable("id") Integer id) {
		System.out.println("Entrando no alterar...");
		ModelAndView modelAndView = new ModelAndView("/products/update");
		Product product = productDAO.find(id);
		modelAndView.addObject("product", product);
		System.out.println("Id do produto antes da página de atualização: " + product.getId());
		return modelAndView;
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	@CacheEvict(value="productsHome", allEntries=true)
	public ModelAndView update(MultipartFile file, @Valid Product product, BindingResult result, RedirectAttributes redirectAttributes) {
		System.out.println(file.getOriginalFilename());
		System.out.println("Id do produto: " + product.getId());
			
		if (result.hasErrors()) {
			System.out.println(result.getFieldError());
			return form(product);
		}
		String path = fileSaver.write("fileLocation", file);
		product.setFileLocation(path);
		
		productDAO.update(product);
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("bookAddedMessage", "Product " + product.getTitle() + " added with success.");
		return new ModelAndView("redirect:/products");
	}
	
	
	
}
