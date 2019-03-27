const axios = require('axios')

const http = function(baseURL, headers = {}) {
  const http = axios.create({ baseURL })

  http.defaults.headers = {
    "Content-Type": "application/json;charset=UTF-8"
  }

  Object.keys(headers).forEach(function(key) {
    http.defaults.headers[key] = headers[key]
  })

  return http
}

module.exports = http
