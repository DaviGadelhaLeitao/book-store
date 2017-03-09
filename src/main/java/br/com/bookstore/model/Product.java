package br.com.bookstore.model;

import java.util.Calendar;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Product {
	
	// let the database manage the id
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String title;
	private String description;
	private Integer pages;
	private String summary;
	@DateTimeFormat
	private Calendar published;
	@ElementCollection
	private List<Price> types;
	
	@Override
	public String toString() {
		return "Product [title=" + title + ", description=" + description + ", pages=" + pages + "]";
	}
	public String getTitle() {
		return title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getPages() {
		return pages;
	}
	public void setPages(Integer pages) {
		this.pages = pages;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Calendar getPublished() {
		return published;
	}
	public void setPublished(Calendar published) {
		this.published = published;
	}
	public List<Price> getTypes() {
		return types;
	}
	public void setTypes(List<Price> types) {
		this.types = types;
	}
}
