package br.com.bookstore.model;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class ShoppingCart {
	
	private Map<CartItem, Integer> itens = new LinkedHashMap<CartItem, Integer>();
	
	public void add(CartItem item) {
		itens.put(item, getQuantity(item) + 1);
	}

	private int getQuantity(CartItem item) {
		if (!itens.containsKey(item)) {
			itens.put(item, 0);
		}
		return itens.get(item);
	}
	
	public int getQuantity() {
		return itens.values().stream().reduce(0, (next, acumulator) -> (next + acumulator));
	}

}
