package br.com.bookstore.model;

import java.math.BigDecimal;

import javax.persistence.Embeddable;

@Embeddable
public class Type {

	private BigDecimal value;
	private BookType type;
	
	public BigDecimal getValue() {
		return value;
	}
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	public BookType getType() {
		return type;
	}
	public void setType(BookType type) {
		this.type = type;
	}
	
}
