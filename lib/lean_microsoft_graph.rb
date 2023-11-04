require 'faraday'
require 'faraday_middleware'
require 'json'

module LeanMicrosoftGraph
  require 'lean_microsoft_graph/version'
  require 'lean_microsoft_graph/error'
  require 'lean_microsoft_graph/resource'
  require 'lean_microsoft_graph/authentication/credentials'
  require 'lean_microsoft_graph/resources/token_resource'
  require 'lean_microsoft_graph/resources/token_resource/token'
end