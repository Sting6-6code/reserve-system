package com.website.twilio.controller;
import com.website.twilio.service.TwilioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/twilio")
public class TwilioController {
    @Autowired
    private TwilioService twilioService;

    @PostMapping("/send-sms")
    public void sendSms(@RequestBody SmsRequest smsRequest) {
        twilioService.sendSms(smsRequest.getToPhoneNumber(), smsRequest.getMessageBody());
    }
}

class SmsRequest {
    private String toPhoneNumber;
    private String messageBody;

    // getters and setters
    public String getToPhoneNumber() {
        return toPhoneNumber;
    }

    public void setToPhoneNumber(String toPhoneNumber) {
        this.toPhoneNumber = toPhoneNumber;
    }

    public String getMessageBody() {
        return messageBody;
    }

    public void setMessageBody(String messageBody) {
        this.messageBody = messageBody;
    }
}