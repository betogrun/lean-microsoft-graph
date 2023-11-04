# frozen_string_literal: true

module LeanMicrosoftGraph
  module Resources
    class  UsersResource < ::LeanMicrosoftGraph::Resource
      def count
        get_request('users/$count') do |req|
          req.headers['ConsistencyLevel'] = 'eventual'
        end
      end

      def get_all(per_page)
        response = get_request('users') do |req|
          req.params['$top'] = per_page
        end

        Users.new(response)
      end

      def get_all_by_reference(url)
        response = get_request(url)

        Users.new(response)
      end
    end
  end
end