const config = require('./config')
const httpConfigurator = require('./http')
const http = httpConfigurator(config.contact.baseURL)

const contactData = function(name, email) {
  return { contact: { name, email } }
}

const submit = function(name, email) {
  return new Promise(function(resolve, reject) {
    http
      .post('/contacts', contactData(name, email))
      .then(function(response) { resolve(response.data) })
      .catch(function(error) { debugger; reject(error.response.data) })
  })
}

module.exports = { submit }
