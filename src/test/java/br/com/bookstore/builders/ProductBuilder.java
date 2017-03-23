package br.com.bookstore.builders;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.bookstore.model.Price;
import br.com.bookstore.model.PriceType;
import br.com.bookstore.model.Product;

public class ProductBuilder {

	private List<Product> Products = new ArrayList<>();

	private ProductBuilder(Product Product) {
		Products.add(Product);
	}

	public static ProductBuilder newProduct(PriceType priceType, BigDecimal value) {
		Product book = create("book 1", priceType, value);
		return new ProductBuilder(book);
	}

	public static ProductBuilder newProduct() {
		Product book = create("book 1", PriceType.BUNDLE, BigDecimal.TEN);
		return new ProductBuilder(book);
	}

	private static Product create(String bookName, PriceType priceType, BigDecimal valor) {
		Product book = new Product();
		book.setTitle(bookName);
		book.setPublished(Calendar.getInstance());
		book.setPages(150);
		book.setDescription("Good one");
		Price price = new Price();
		price.setType(priceType);
		price.setValue(valor);
		book.getPrices().add(price);
		return book;
	}

	public ProductBuilder more(int number) {
		Product base = Products.get(0);
		Price price = base.getPrices().get(0);
		for (int i = 0; i < number; i++) {
			Products.add(create("Book " + i, price.getType(), price.getValue()));
		}
		return this;
	}

	public Product buildOne() {
		return Products.get(0);
	}

	public List<Product> buildAll() {
		return Products;
	}
}
