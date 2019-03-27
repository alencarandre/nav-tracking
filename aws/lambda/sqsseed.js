const AWS = require('aws-sdk');
const config = require('./config')

const sqs = new AWS.SQS({ region : config.region });

const validEvent = function(event) {
  return event.guid && event.location
}

const queueData = function(event) {
  return {
    guid: event.guid,
    location: event.location,
    accessed_at: new Date().getTime()
  }
}

const queueParams = function(event, queueUrl) {
  return {
    MessageBody: JSON.stringify(queueData(event)),
    QueueUrl: queueUrl
  }
}

const sendMessage = function(params, context) {
  sqs.sendMessage(params, function(err, data) {
    if(err) {
      console.log('error:',"Fail Send Message" + err);
      context.done('error', "ERROR Put SQS");
    } else {
      console.log('data:', data.MessageId);
      context.done(null, '');
    }
  });
}

exports.handler = function(event, context) {
  if(validEvent(event)) {
    sendMessage(queueParams(event, config.queue_url), context)
  } else {
    context.done('error', 'Invalid event')
  }
}
