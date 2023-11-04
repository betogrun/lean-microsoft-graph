# frozen_string_literal: true

module LeanMicrosoftGraph
  module Authentication
    class TokenRetriever
      def initialize(token_resource)
        @token_resource = token_resource
        @token = nil
      end

      def to_proc
        -> { retrieve }
      end

      def retrieve
        return @token if @token && !@token.expired?

        @token = @token_resource.renew
      end
    end
  end
end