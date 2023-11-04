# frozen_string_literal: true

module LeanMicrosoftGraph
  module Resources
    class TokenResource
      class Token
        attr_reader :value, :expires_in

        def initialize(value, expires_in)
          @value = value
          @expires_in = expires_in
          @created_at = Time.now
        end

        def expires_at
          @created_at + @expires_in
        end

        def expired?
          Time.now > expires_at
        end

        def to_s
          @value
        end
      end
    end
  end
end