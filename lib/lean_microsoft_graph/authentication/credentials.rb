# frozen_string_literal: true

module LeanMicrosoftGraph
  module Authentication
    class Credentials
      attr_reader :tenant_id, :client_id, :client_secret

      def initialize(tenant_id, client_id, client_secret)
        @tenant_id = tenant_id
        @client_id = client_id
        @client_secret = client_secret
      end
    end
  end
end