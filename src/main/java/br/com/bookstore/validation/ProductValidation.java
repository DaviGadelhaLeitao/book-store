package br.com.bookstore.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.bookstore.model.Product;

public class ProductValidation implements Validator {

	// This method indicate which class the Validation will support
	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "title", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "description", "field.required");
		
		Product product = (Product) target;
		if (product.getPages() == null) {
			errors.rejectValue("pages", "field.required");
		} else if (product.getPages() <= 0) {
			errors.rejectValue("pages", "field.required");
		}
	}
}
