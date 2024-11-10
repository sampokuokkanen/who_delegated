# frozen_string_literal: true

class User < ApplicationRecord
  has_one :friend

  delegate :friend_name, to: :friend
  delegate :very_good_name, to: :friend, prefix: true

  has_one :friendly_user, class_name: "User", foreign_key: "friendly_user_id"
  delegate :friend_name, to: :friendly_user, prefix: true

  delegate :friendly_name, to: :friendly_user, prefix: false
  delegate :david_name, to: :friend
  delegate :david_name, to: :friend, prefix: true

  def friendly_name
    "Friendly #{name}"
  end
end
