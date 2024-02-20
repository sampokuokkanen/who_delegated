# frozen_string_literal: true

require "test_helper"

class WhoDelegatedTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert WhoDelegated::VERSION
  end

  test "it is possible to check if method is delegated" do
    f = Friend.new
    assert f.respond_to?(:user)
    u = User.new(friend: f)
    assert u.respond_to?(:friend_name)
    assert u.delegated_friend_name?, true
    assert u.delegated_method?(:friend_name), true
  end
end
