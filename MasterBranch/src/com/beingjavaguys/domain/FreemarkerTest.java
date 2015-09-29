package com.beingjavaguys.domain;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;


public class FreemarkerTest {
	
	
	@Autowired
	private WebApplicationContext mAppContext;
	
	public Template FreemarkerTemplate() throws IOException, TemplateException{
		Configuration context = mAppContext.getBean("freemarkerMailConfiguration",Configuration.class);
		Template template = context.getTemplate("email_vacancy_apply.ftl");
		return template;
	}
	
}