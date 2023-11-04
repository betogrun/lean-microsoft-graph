# frozen_string_literal: true

class LeanMicrosoftGraph::ClientTest < Minitest::Test
  def setup
    @tenant_id = 'tenant_id'
    @client_id = 'client_id'
    @client_secret = 'client_secret'
    @stubs = Faraday::Adapter::Test::Stubs.new

    @stubs.post("/#{@tenant_id}/oauth2/v2.0/token") do
      [200, {}, '{"access_token": "token", "expires_in": 3600}']
    end

    @stubs.get('/v1.0/test_endpoint') do |env|
      assert_equal 'Bearer token', env[:request_headers]['Authorization']
      [200, {'Content-Type' => 'application/json'}, '{"data": "test"}']
    end
  end

  def test_get_request_includes_token
    client = LeanMicrosoftGraph::Client.new(
      tenant_id: @tenant_id,
      client_id: @client_id,
      client_secret: @client_secret,
      adapter: :test,
      stubs: @stubs
    )

    response = client.connection.get('/v1.0/test_endpoint')

    assert_equal 200, response.status
    assert_equal 'test', JSON.parse(response.body)['data']
  end

  def teardown
    @stubs.verify_stubbed_calls
  end
end