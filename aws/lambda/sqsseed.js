const AWS = require('aws-sdk');
const config = require('./config')

const sqs = new AWS.SQS({ region : config.region });

const validEvent = (event) => {
  return event.guid && event.location
}

const queueData = (event) => {
  return {
    guid: event.guid,
    location: event.location,
    accessed_at: new Date().getTime()
  }
}

const queueParams = (event, queueUrl) => {
  return {
    MessageBody: JSON.stringify(queueData(event)),
    QueueUrl: queueUrl
  }
}

const sendMessage = (params, context) => {
  sqs.sendMessage(params, (err, data) => {
    if(err) {
      console.log('error:',"Fail Send Message" + err);
      context.done('error', "ERROR Put SQS");
    } else {
      console.log('data:', data.MessageId);
      context.done(null, '');
    }
  });
}

exports.handler = (event, context) => {
  if(validEvent(event)) {
    sendMessage(queueParams(event, config.queueUrl), context)
  } else {
    context.done('error', 'Invalid event')
  }
}
