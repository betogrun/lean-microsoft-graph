require 'test_helper'

class LeanMicrosoftGraph::UsersResourceTest < Minitest::Test
  def setup
    @stubs = Faraday::Adapter::Test::Stubs.new
    connection = Faraday.new { |faraday| faraday.adapter :test, @stubs }
    @resource = ::LeanMicrosoftGraph::Resource.new(connection)
  end

  def test_handle_success_response
    @stubs.get('/test_endpoint') do |_env| 
      [200, {}, '{"data": "test"}']
    end

    assert_equal({ data: 'test' }, @resource.get_request('/test_endpoint'))
  end

  def test_handle_bad_request_response
    @stubs.get('/test_endpoint') do |_env| 
      [400, {}, '{"error": {"code": "bad_request", "message": "Bad request"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Bad request. Code: bad_request. Message: Bad request') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [400, {}, '{"error_codes": "bad_request", "error_description": "Bad request"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Bad request. Code: bad_request. Message: Bad request') do
      @resource.get_request('/test_endpoint')
    end
  end

  def test_handle_unauthorized_response
    @stubs.get('/test_endpoint') do |_env| 
      [401, {}, '{"error": {"code": "unauthorized", "message": "Unauthorized"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Unauthorized. Check permissions or authentication token. Code: unauthorized. Message: Unauthorized') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [401, {}, '{"error_codes": "unauthorized", "error_description": "Unauthorized"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Unauthorized. Check permissions or authentication token. Code: unauthorized. Message: Unauthorized') do
      @resource.get_request('/test_endpoint')
    end
  end

  def test_handle_forbidden_response
    @stubs.get('/test_endpoint') do |_env| 
      [403, {}, '{"error": {"code": "forbidden", "message": "Forbidden"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Forbidden. Insufficient permissions. Code: forbidden. Message: Forbidden') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [403, {}, '{"error_codes": "forbidden", "error_description": "Forbidden"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Forbidden. Insufficient permissions. Code: forbidden. Message: Forbidden') do
      @resource.get_request('/test_endpoint')
    end
  end

  def test_handle_not_found_response
    @stubs.get('/test_endpoint') do |_env| 
      [404, {}, '{"error": {"code": "not_found", "message": "Not found"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Resource not found. Code: not_found. Message: Not found') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [404, {}, '{"error_codes": "not_found", "error_description": "Not found"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Resource not found. Code: not_found. Message: Not found') do
      @resource.get_request('/test_endpoint')
    end
  end

  def test_handle_too_many_requests_response
    @stubs.get('/test_endpoint') do |_env| 
      [429, {}, '{"error": {"code": "too_many_requests", "message": "Too many requests"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Too many requests. Rate limit exceeded. Code: too_many_requests. Message: Too many requests') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [429, {}, '{"error_codes": "too_many_requests", "error_description": "Too many requests"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Too many requests. Rate limit exceeded. Code: too_many_requests. Message: Too many requests') do
      @resource.get_request('/test_endpoint')
    end
  end

  def test_handle_internal_server_error_response
    @stubs.get('/test_endpoint') do |_env| 
      [500, {}, '{"error": {"code": "internal_server_error", "message": "Internal server error"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Internal server error. Code: internal_server_error. Message: Internal server error') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [500, {}, '{"error_codes": "internal_server_error", "error_description": "Internal server error"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Internal server error. Code: internal_server_error. Message: Internal server error') do
      @resource.get_request('/test_endpoint')
    end
  end

  def test_handle_service_unavailable_response
    @stubs.get('/test_endpoint') do |_env| 
      [503, {}, '{"error": {"code": "service_unavailable", "message": "Service unavailable"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Service unavailable. Try again later. Code: service_unavailable. Message: Service unavailable') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [503, {}, '{"error_codes": "service_unavailable", "error_description": "Service unavailable"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'Service unavailable. Try again later. Code: service_unavailable. Message: Service unavailable') do
      @resource.get_request('/test_endpoint')
    end
  end

  def test_handle_unknown_error_response
    @stubs.get('/test_endpoint') do |_env| 
      [504, {}, '{"error": {"code": "unknown", "message": "Unknown error"}}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'An unknown error occurred with status: 504.') do
      @resource.get_request('/test_endpoint')
    end

    @stubs.get('/test_endpoint') do |_env| 
      [504, {}, '{"error_codes": "unknown", "error_description": "Unknown error"}']
    end

    assert_raises(LeanMicrosoftGraph::Error, 'An unknown error occurred with status: 504.') do
      @resource.get_request('/test_endpoint')
    end
  end
end