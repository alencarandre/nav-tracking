require 'aws-sdk-core'
require 'aws-sigv4'

require_relative 'nav-tracking-sdk/types'
require_relative 'nav-tracking-sdk/client_api'
require_relative 'nav-tracking-sdk/client'
require_relative 'nav-tracking-sdk/errors'
require_relative 'nav-tracking-sdk/resource'
require_relative 'nav-tracking-sdk/customizations'

# This module provides support for nav-tracking. This module is available in the
# `nav-tracking-sdk` gem.
#
# # Client
#
# The {Client} class provides one method for each API operation. Operation
# methods each accept a hash of request parameters and return a response
# structure.
#
# See {Client} for more information.
#
# # Errors
#
# Errors returned from nav-tracking all
# extend {Errors::ServiceError}.
#
#     begin
#       # do stuff
#     rescue NavTracking::Errors::ServiceError
#       # rescues all service API errors
#     end
#
# See {Errors} for more information.
#
# @service
module NavTracking

  GEM_VERSION = '0.1.0'

end
