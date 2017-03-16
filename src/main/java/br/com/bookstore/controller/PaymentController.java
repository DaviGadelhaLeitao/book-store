package br.com.bookstore.controller;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bookstore.model.PaymentData;
import br.com.bookstore.model.ShoppingCart;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private ShoppingCart shoppingCart;
	
	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping(value="/orderCheckout", method=RequestMethod.POST)
	public Callable<ModelAndView> orderCheckout(RedirectAttributes model) {
		
		return () -> {
			
			try {
				String url = "http://book-payment.herokuapp.com/payment";
				String response = restTemplate.postForObject(url, new PaymentData(shoppingCart.getTotal()), String.class);
				model.addFlashAttribute("checkoutMessage", response);
				System.out.println(response);
				
			} catch (HttpClientErrorException e) {
				e.printStackTrace();
				model.addFlashAttribute("checkoutMessage", "Valor maior que o permitido ($ 500,00");
				
			}
			
			
			ModelAndView modelAndView = new ModelAndView("redirect:/products");
			return modelAndView;
			
		};
		
		
	}
	
	
	
}
