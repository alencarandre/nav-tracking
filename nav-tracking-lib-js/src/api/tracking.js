const guidPromise = require('./guid')
const config = require('./config')
const httpConfigurator = require('./http')
const http = httpConfigurator(config.tracking.baseURL)

const location = function() {
  return window.location.href
}

const trackingData = function(guid, location) {
  return { guid, location }
}

const sendTracking = function(path, trackingData) {
  http.post(path, trackingData).then(function() { console.log("Tracked") })
}

const tracking = function() {
  guidPromise()
    .then(function(guid) { sendTracking('/tracking', trackingData(guid, location())) })
    .catch(function() { console.log('Error on track URL') })
}

module.exports = tracking
