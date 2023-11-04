# frozen_string_literal: true

require 'test_helper'

class LeanMicrosoftGraph::Authentication::TokenRetrieverTest < Minitest::Test
  def setup
    @token_resource = mock('TokenResource')
    @token_retriever = ::LeanMicrosoftGraph::Authentication::TokenRetriever.new(@token_resource)
  end

  def test_retrieve_with_unexpired_token
    unexpired_token = mock('Token')
    unexpired_token.stubs(:expired?).returns(false)
    @token_retriever.instance_variable_set(:@token, unexpired_token)

    assert_equal unexpired_token, @token_retriever.retrieve
  end

  def test_retrieve_with_expired_token
    expired_token = mock('Token')
    expired_token.stubs(:expired?).returns(true)
    @token_retriever.instance_variable_set(:@token, expired_token)

    new_token = mock('Token')
    @token_resource.stubs(:renew).returns(new_token)

    assert_equal new_token, @token_retriever.retrieve
  end
end