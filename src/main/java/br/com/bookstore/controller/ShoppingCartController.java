package br.com.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.bookstore.daos.ProductDAO;
import br.com.bookstore.model.PriceType;
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
	public ModelAndView add(Integer productId, PriceType type) {
		System.out.println(productId);
		ModelAndView modelAndView = new ModelAndView("redirect:/cart");
		CartItem item = createItem(productId, type);
		cart.addItemInCart(item);
		return modelAndView;
	}
	
	private CartItem createItem(Integer productId, PriceType type) {
		Product product = productDao.find(productId);
		CartItem cartItem = new CartItem(product, type);
		return cartItem;
	}
	
	// must create an items method here to take the user directly to the cart detail page.
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView items() {
		return new ModelAndView("/cart/items");
		
	}
	
	
}
