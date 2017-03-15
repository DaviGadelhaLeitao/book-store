package br.com.bookstore.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION, proxyMode=ScopedProxyMode.TARGET_CLASS)
public class ShoppingCart implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Map<CartItem, Integer> items = new LinkedHashMap<CartItem, Integer>();
	
	public Collection<CartItem> getItems() {
		return items.keySet();
	}
	
	public void addItemInCart(CartItem item) {
		items.put(item, getQuantityOfAnItemInACart(item) + 1);
	}

	public Integer getQuantityOfAnItemInACart(CartItem item) {
		if (!items.containsKey(item)) {
			items.put(item, 0);
		}
		return items.get(item);
	}
	
	public Integer getQuantity() {
		return items.values().stream().reduce(0, (next, acumulator) -> (next + acumulator));
	}
	
	public BigDecimal getTotalPriceOfAnItemInCart(CartItem item) {
        return item.getTotal(getQuantityOfAnItemInACart(item));
    }
	
	public BigDecimal getTotal() {
        BigDecimal total = BigDecimal.ZERO;

        for(CartItem item : items.keySet()) {
        	total = total.add(getTotalPriceOfAnItemInCart(item));
        }
		return total;
    }

	public void remove(Integer productId, PriceType priceType) {
		Product product = new Product();
		product.setId(productId);
		items.remove(new CartItem(product, priceType));
	}

}








