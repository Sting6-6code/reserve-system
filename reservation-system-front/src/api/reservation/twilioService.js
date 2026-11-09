import axios from 'axios';

const baseUrl = 'http://localhost:8080'; // Replace with your actual backend API URL

const twilioService = {
    sendSms(toPhoneNumber, messageBody) {
        const url = `${baseUrl}/api/twilio/send-sms`;
        const data = {
            toPhoneNumber,
            messageBody,
        };

        return axios.post(url, data)
            .then(response => {
                console.log('SMS sent successfully:', response.data);
            })
            .catch(error => {
                console.error('Error sending SMS:', error);
                throw error; // Re-throw the error for handling in the component
            });
    },
};

export default twilioService;