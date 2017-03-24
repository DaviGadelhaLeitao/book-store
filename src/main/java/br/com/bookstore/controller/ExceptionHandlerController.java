package br.com.bookstore.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionHandlerController {
	
	@ExceptionHandler(Exception.class)
	public String handleGenericExceptions(Exception exception) {
		exception.printStackTrace();
		return "error";
	}

}
