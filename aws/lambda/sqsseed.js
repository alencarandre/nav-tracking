const AWS = require('aws-sdk');

const REGION = 'sa-east-1';
const AWS_ACCOUNT_ID = '999999999999';
const QUEUE_NAME = 'queue-name';
const QUEUE_URL = 'https://sqs.' + REGION + '.amazonaws.com/' + AWS_ACCOUNT_ID + '/' + QUEUE_NAME;

const sqs = new AWS.SQS({ region : REGION });

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
