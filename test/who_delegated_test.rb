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
    assert User.respond_to?(:delegated_friend_name?), true
    assert User.respond_to?(:delegated_friend_very_good_name?), true
    assert User.delegated_method?(:friend_name), true
    assert User.delegated_target(:friend_very_good_name), :friend
  end

  test "delegating when class_name is provided" do
    u = User.new
    assert u.delegated_friendly_user_friend_name?, true
    assert u.delegated_method?(:friendly_user_friend_name), true
    assert u.delegated_target(:friendly_user_friend_name), :friend
  end

  test "delegating through a class" do
    d = David.new(name: "David")
    f = Friend.new(hasselhoff: d)
    u = User.new(friend: f)
    assert u.david_name, "David"
    assert u.delegated_target(:david_name), :david
  end

  test "delegating through a class with prefix" do
    d = David.new(name: "David")
    f = Friend.new(hasselhoff: d)
    u = User.new(friend: f)
    assert u.delegated_friend_david_name?, true
    assert u.delegated_method?(:friend_david_name), true
    assert u.delegated_target(:friend_david_name), :david
  end

  test "delegating from friend to users friendly user" do
    u = User.create! name: "Timmy"
    u.friendly_user = User.create!(name: "Jimmy")
    f = Friend.create!(user: u)
    assert f.delegated_friend_name?, true
    assert f.delegated_method?(:friend_name), true
    assert f.delegated_target(:friend_name), :user
  end
end
