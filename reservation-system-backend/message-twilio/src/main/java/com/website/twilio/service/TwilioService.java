package com.website.twilio.service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class TwilioService {

    @Value("${twilio.phone.number}")
    private String fromPhoneNumber;
    public void sendSms(String toPhoneNumber, String messageBody) {
        Logger logger = LoggerFactory.getLogger(TwilioService.class);
        logger.info("Sending SMS to {} with message: {}", toPhoneNumber, messageBody);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber(toPhoneNumber),
                new com.twilio.type.PhoneNumber(fromPhoneNumber),
                messageBody
        ).create();
        logger.info(message.getSid());
    }
}
