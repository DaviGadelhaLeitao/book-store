package br.com.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.bookstore.daos.ProductDAO;
import br.com.bookstore.model.BookType;
import br.com.bookstore.model.CartItem;
import br.com.bookstore.model.Product;
import br.com.bookstore.model.ShoppingCart;

@Controller
@RequestMapping("/cart")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class ShoppingCartController {

	@Autowired
	private ProductDAO productDao;
	@Autowired
	private ShoppingCart cart;
	
	@RequestMapping("/add")
	public ModelAndView add(Integer productId, BookType type) {
		ModelAndView modelAndView = new ModelAndView("redirect:/products");
		CartItem item = createItem(productId, type);
		cart.add(item);
		return modelAndView;
	}
	
	private CartItem createItem(Integer productId, BookType type) {
		Product product = productDao.find(productId);
		CartItem cartItem = new CartItem(type, product);
		return cartItem;
	}
	
	
	
}
