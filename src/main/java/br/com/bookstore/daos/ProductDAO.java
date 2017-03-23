package br.com.bookstore.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bookstore.model.PriceType;
import br.com.bookstore.model.Product;

@Repository
@Transactional
public class ProductDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void save(Product product) {
		manager.persist(product);
	}
	
	public List<Product> list() {
		return manager.createQuery("select p from Product p", Product.class).getResultList();
	}

	public Product find(Integer id) {
		return manager.createQuery("select distinct(p) from Product p join"
				+ " fetch p.prices prices where p.id = :id", Product.class).setParameter("id", id).getSingleResult();
	}
	
	public BigDecimal sumTotalValueOfBooksByPriceType(PriceType priceType) {
		TypedQuery<BigDecimal> query = manager.createQuery("select sum(price.value) from Product p join p.prices price where price.type = :priceType", BigDecimal.class);
		query.setParameter("priceType", priceType);
		return query.getSingleResult();
	}
}
