# frozen_string_literal: true

module LeanMicrosoftGraph
  class Resource
    def initialize(connection)
      @connection = connection
    end

    def get_request(url, params = {}, headers = {}, &block)
      handle_response(@connection.get(url, params, headers, &block))
    end

    def post_request(url, body = {}, headers = {}, &block)
      handle_response(@connection.post(url, body, headers, &block))
    end

    private

    def handle_response(response)
    	parsed_response = JSON.parse(response.body, symbolize_names: true)
      return parsed_response if (200..299).include?(response.status)

      error_message = parsed_response[:error_description]
      error_code = parsed_response[:error_codes]

      puts parsed_response

      case { status: response.status, code: error_code, message: error_message }
      in { status: 400, code: code, message: message }
        raise Error, "Bad request. Code: #{code}. Message: #{message}"
      in { status: 401, code: code, message: message }
        raise Error, "Unauthorized. Check permissions or authentication token. Code: #{code}. Message: #{message}"
      in { status: 403, code: code, message: message }
        raise Error, "Forbidden. Insufficient permissions. Code: #{code}. Message: #{message}"
      in { status: 404, code: code, message: message }
        raise Error, "Resource not found. Code: #{code}. Message: #{message}"
      in { status: 429, code: code, message: message }
        raise Error, "Too many requests. Rate limit exceeded. Code: #{code}. Message: #{message}"
      in { status: 500, code: code, message: message }
        raise Error, "Internal server error. Code: #{code}. Message: #{message}"
      in { status: 503, code: code, message: message }
        raise Error, "Service unavailable. Try again later. Code: #{code}. Message: #{message}"
      else
        raise Error, "An unknown error occurred with status: #{response.status}."
      end
    end
  end
end