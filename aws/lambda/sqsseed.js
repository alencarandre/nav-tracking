const AWS = require('aws-sdk');
const config = require('./config')

const sqs = new AWS.SQS({ region : config.region });

exports.handler = function(event, context) {
  const params = {
    MessageBody: JSON.stringify(event),
    QueueUrl: QUEUE_URL
  };

  sqs.sendMessage(params, function(err, data) {
    if(err) {
      console.log('error:',"Fail Send Message" + err);
      context.done('error', "ERROR Put SQS");
    } else{
      console.log('data:', data.MessageId);
      context.done(null, '');
    }
  });
}
