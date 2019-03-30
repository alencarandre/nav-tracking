const REGION = 'sa-east-1';
const AWS_ACCOUNT_ID = '999999999999';
const QUEUE_NAME = 'queue-name';
const QUEUE_URL = 'https://sqs.' + REGION + '.amazonaws.com/' + AWS_ACCOUNT_ID + '/' + QUEUE_NAME;

module.exports = {
  region: REGION,
  queueUrl: QUEUE_URL
}
