package br.com.bookstore.conf;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Profile("prod")
public class JPAProductionConfiguration {
	
	@Autowired
	private Environment environment;
	
	@Bean
	public DataSource dataSource() throws URISyntaxException {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.postgresql.Driver");

		
		URI dbUri = new URI(environment.getProperty("DATABASE_URL"));
		
		// user:password@host:port/path
		
		dataSource.setUsername(dbUri.getUserInfo().split(":")[0]);
		dataSource.setPassword(dbUri.getUserInfo().split(":")[1]);

		dataSource.setUrl("jdbc:postgresql://" + dbUri.getHost() + ":" + dbUri.getPort() + dbUri.getPath());
		return dataSource;
	}
	
	@Bean
	public Properties additionalProperties() {
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
		props.setProperty("hibernate.show_sql", "true");
		props.setProperty("hibernate.hbm2ddl.auto", "update");
		return props;
	}

	
	

}
