 /**
 * 
 */
package com.exide.sfcrm.constants;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author neethub
 *
 */
@Configuration
public class PropertyConstants {
	
	@Value("${server.contextPath}")
	public String PAGE_CONTEXT ;
	
	@Value("${sfcrm.pagelimit}")
	public Integer PAGE_LIMIT ;
	
	@Value("${app.contextPath}")
	public String APP_CONTEXT ;
	
	@Value("${smtp.server.url}")
	public String SMTP_SERVER_URL ;
	
	@Value("${smtp.server.port}")
	public String SMTP_SERVER_PORT;
	
	@Value("${smtp.server.auth}")
	public String SMTP_SERVER_AUTH;
	
	@Value("${smtp.server.from}")
	public String SMTP_SERVER_FROM_ADDRESS ;
	
	@Value("${smtp.server.username}")
	public String SMTP_SERVER_USERNAME ;
	
	@Value("${smtp.server.password}")
	public String SMTP_SERVER_PASSWORD ;
	
	@Value("${mail.subject}")
	public String MAIL_SUBJECT ;
	
	@Value("${mail.body}")
	public String MAIL_BODY ;
	
	@Value("${app.static.path}")
	public String APP_STATIC_PATH;
	
	
}
