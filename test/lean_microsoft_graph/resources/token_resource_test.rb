
require 'test_helper'
require 'ostruct'

class LeanMicrosoftGraph::Resources::TokenResourceTest < Minitest::Test
  def setup
    @credentials = OpenStruct.new(
      tenant_id: 'tenant_id',
      client_id: 'client_id',
      client_secret: 'client_secret'
    )
    @stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post('/tenant_id/oauth2/v2.0/token') do
        [200, { 'Content-Type': 'application/json' }, 
          { access_token: 'new_access_token', expires_in: 3600 }.to_json]
      end
    end

    @token_resource = ::LeanMicrosoftGraph::Resources::TokenResource.new(@credentials, :test, @stubs)
  end

  def test_renew_token
    token = @token_resource.renew
    
    assert_equal 'new_access_token', token.value
    assert_equal 3600, token.expires_in
    
    @stubs.verify_stubbed_calls
  end
end
