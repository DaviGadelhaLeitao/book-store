package br.com.bookstore.daos;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import br.com.bookstore.builders.ProductBuilder;
import br.com.bookstore.conf.DataSourceConfigurationTest;
import br.com.bookstore.conf.JPAConfiguration;
import br.com.bookstore.model.PriceType;
import br.com.bookstore.model.Product;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfiguration.class,ProductDAO.class, DataSourceConfigurationTest.class})
@ActiveProfiles("test")
public class ProductDAOTest {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Test
	@Transactional
	public void mustSumTheValueOfAllBooksOfAPriceType() {
		
		List<Product> printedBooks = ProductBuilder.newProduct(PriceType.PRINTED, BigDecimal.TEN).more(3).buildAll();
		List<Product> eBooks = ProductBuilder.newProduct(PriceType.EBOOK, BigDecimal.TEN).more(3).buildAll();
		
		for (Product product : printedBooks) {
			productDAO.save(product);
		}
		
		for (Product product : eBooks) {
			productDAO.save(product);
		}
		
		BigDecimal value = productDAO.sumTotalValueOfBooksByPriceType(PriceType.EBOOK);
		
		Assert.assertEquals(new BigDecimal(40).setScale(2), value);
		
	}

}
