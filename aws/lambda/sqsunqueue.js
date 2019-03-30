const AWS = require('aws-sdk');
const config = require('./config')

const sqs = new AWS.SQS({ region : config.region });

const validEvent = (event) => (event.receiptHandle)

const queueParams = (event, queueUrl) => ({
  QueueUrl: queueUrl,
  ReceiptHandle: event.receiptHandle
})

const unqueueMessage = (queueParams, context) => {
  sqs.deleteMessage(queueParams, (error, data) => {
    if(error) {
      context.done('error on drop queue' + error, JSON.stringify(message), error);
    } else {
      context.done(null, '');
    }
  });
}

exports.handler = (event, context) => {
  if(validEvent(event)) {
    unqueueMessage(queueParams(event, config.queueUrl), context)
  } else {
    context.done('error', 'Invalid event')
  }
}
