# frozen_string_literal: true

require "test_helper"

class Lean::Microsoft::GraphTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Lean::Microsoft::Graph::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
