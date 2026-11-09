
package com.website.twilio.config;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import javax.annotation.PostConstruct;
import com.twilio.Twilio;

@Configuration
public class TwilioConfig {

    @Value("${twilio.account.sid}")
    private String accountSid;

    @Value("${twilio.auth.token}")
    private String authToken;

    @PostConstruct
    public void init() {
        Logger logger = LoggerFactory.getLogger(TwilioConfig.class);
        logger.info("Initializing Twilio with SID: {}", accountSid);
        try {
            Twilio.init(accountSid, authToken);
            logger.info("Twilio initialized successfully.");
        } catch (Exception e) {
            logger.error("Error initializing Twilio: {}", e.getMessage(), e);
        }
    }
}


