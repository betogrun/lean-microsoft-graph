# frozen_string_literal: true

module LeanMicrosoftGraph
  module Resources
    class TokenResource < ::LeanMicrosoftGraph::Resource
      def initialize(credentials, adapter = Faraday.default_adapter, stubs = nil)
        super(Faraday.new { |faraday| faraday.adapter(adapter, stubs)})
        @credentials = credentials
      end

      def renew
        url = "https://login.microsoftonline.com/#{@credentials.tenant_id}/oauth2/v2.0/token"
        headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
        body = {
          'client_id' => @credentials.client_id,
          'scope' => 'https://graph.microsoft.com/.default',
          'client_secret' => @credentials.client_secret,
          'grant_type' => 'client_credentials'
        }
        response = post_request(url, URI.encode_www_form(body), headers)

        Token.new(response[:access_token], response[:expires_in].to_i)
      end
    end
  end
end