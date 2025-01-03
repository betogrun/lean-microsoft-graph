# frozen_string_literal: true

require 'faraday/retry'

module LeanMicrosoftGraph
  class Client
    def initialize(tenant_id:, client_id:, client_secret:, adapter: Faraday.default_adapter, stubs: nil)
      @tenant_id = tenant_id
      @client_id = client_id
      @client_secret = client_secret
      @adapter = adapter
      @stubs = stubs # Stubs for testing purpouses
    end

    def users
      Resources::UsersResource.new(connection)
    end

    private

    def connection
      @connection ||= Faraday.new(url: 'https://graph.microsoft.com/v1.0') do |faraday|
        faraday.request :authorization, 'Bearer', proc(&token_retriever)
        faraday.request :url_encoded
        faraday.request :retry, retry_statuses: [429]
        faraday.adapter @adapter, @stubs
      end
    end

    def token_retriever
      @token_retriever ||= begin
        token_resource = Resources::TokenResource.new(credentials, @adapter, @stubs)
        Authentication::TokenRetriever.new(token_resource)
      end
    end

    def credentials
      Authentication::Credentials.new(@tenant_id, @client_id, @client_secret)
    end
  end
end
