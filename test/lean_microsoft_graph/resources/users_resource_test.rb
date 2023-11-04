# frozen_string_literal: true

require 'test_helper'

class LeanMicrosoftGraph::Resources::UsersResourceTest < Minitest::Test
  def setup
    @stubs = Faraday::Adapter::Test::Stubs.new
    connection = Faraday.new { |faraday| faraday.adapter :test, @stubs }
    @users_resource = ::LeanMicrosoftGraph::Resources::UsersResource.new(connection)
  end

  def test_count
    @stubs.get('/users/$count') { |_env| [200, {}, '4'] }

    count = @users_resource.count

    assert_equal 4, count
  end

  def test_get_all
    @stubs.get('/users') do |_env|
      [200, {}, { value: [{ id: '1' }, { id: '2' }], '@odata.nextLink': 'url' }.to_json]
    end

    users = @users_resource.get_all(2)

    assert_equal([{ id: '1' }, { id: '2' }], users.map { |user| user.to_h.slice(:id) })
    assert_equal 'url', users.next_batch_reference
  end

  def test_get_all_by_reference
    @stubs.get('/url') do |_env|
      [200, {}, { value: [{ id: '3' }, { id: '4' }] }.to_json]
    end

    users = @users_resource.get_all_by_reference('url')

    assert_equal([{ id: '3' }, { id: '4' }], users.map { |user| user.to_h.slice(:id) })
    assert_nil users.next_batch_reference
  end

  def teardown
    @stubs.verify_stubbed_calls
  end
end