const uuidv1 = require('uuid/v1')

const generateGuid = function() {
  return new Promise(function(resolve, reject) {
    resolve(uuidv1())
  })
}

const storeGuid = function(guid) {
  localStorage.guid = guid

  return guid
}

const definedGuid = function() {
  return (localStorage.guid != undefined && localStorage.guid != null)
}

const fetchGuid = function() {
  return localStorage.guid
}

const getGuidPromise = function() {
  return new Promise(function(resolve, reject) {
    if(!definedGuid()) {
      generateGuid().then(function(guid) {
        resolve(storeGuid(guid))
      })
    } else {
      resolve(fetchGuid())
    }
  })
}

module.exports = getGuidPromise
