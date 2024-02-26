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

  test "it is possible to get delegated target" do
    u = User.new
    assert u.delegated_target(:friend_name), :friend
  end

  test "works with preifx" do
    u = User.new
    assert u.delegated_friend_very_good_name?, true
    assert u.delegated_method?(:friend_very_good_name), true
    assert u.delegated_target(:friend_very_good_name), :friend
  end

  test "singleton methods" do
    assert User.respond_to?(:delegated_friend_name?)
    assert User.respond_to?(:delegated_friend_very_good_name?)
  end
end
