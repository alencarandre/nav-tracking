const guidPromise = require('./guid')
const config = require('./config')
const httpConfigurator = require('./http')
const http = httpConfigurator(config.tracking.baseURL)

const location = function() {
  return window.location.href
}

const trakingData = function(guid, location) {
  return { guid, location }
}

const sendTracking = function(path, trakingData) {
  http.post(path, trakingData).then(function() { console.log("Tracked") })
}

const traking = function() {
  guidPromise()
    .then(function(guid) { sendTracking('/tracking', trakingData(guid, location())) })
    .catch(function() { console.log('Error on track URL') })
}

module.exports = traking
