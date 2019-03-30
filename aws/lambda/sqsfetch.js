const AWS = require('aws-sdk');
const config = require('./config')

const sqs = new AWS.SQS({ region : config.region });

const queueParams = (queueUrl, visibilityTimeout) => {
  return {
    QueueUrl: queueUrl,
    VisibilityTimeout: visibilityTimeout,
    MaxNumberOfMessages: 10,
    WaitTimeSeconds: 5
  }
}

const receiveMessage = (context) => {
  sqs.receiveMessage(queueParams(config.queueUrl, 120), (error, message) => {
    if(error) {
      context.done('error on execute queue' + error, JSON.stringify(message));
    } else {
      context.done(null, JSON.stringify(message));
    }
  });
}

exports.handler = (event, context) => {
  receiveMessage(context);
}
