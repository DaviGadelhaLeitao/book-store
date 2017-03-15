package br.com.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bookstore.model.ShoppingCart;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
	
	@Autowired
	private ShoppingCart shoppingCart;

	@RequestMapping(value="/orderCheckout", method=RequestMethod.POST)
	public ModelAndView orderCheckout(RedirectAttributes model) {
		System.out.println(shoppingCart.getTotal());
		model.addFlashAttribute("checkoutSuccessMessage", "Payment was a success");
		
		ModelAndView modelAndView = new ModelAndView("redirect:/products");
			
			
		return modelAndView;
		
	}
	
}
