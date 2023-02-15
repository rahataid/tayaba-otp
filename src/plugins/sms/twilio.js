const config = require('config');
const twilio = require('twilio');

// Make sure you add these parameters to "plugins.sms.params" in local.json file
const { accountSid, authToken, twilioNumber } = config.get('services.twilio');

module.exports = (phone, message) => {
  const client = twilio(accountSid, authToken);
  if (!phone.startsWith('+')) {
    if (!config.get('default_country_code')) throw Error('No Country Code found.');
    phone = `${config.get('default_country_code')}${phone}`;
  }
  return client.messages.create({
    body: message,
    from: twilioNumber,
    to: phone
  });
};
