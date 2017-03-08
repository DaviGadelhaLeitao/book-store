package br.com.bookstore.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
				+ " fetch p.types price where p.id = :id", Product.class).setParameter("id", id).getSingleResult();
	}
}
