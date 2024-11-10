# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user
  has_one :friendly_user, through: :user
  has_one :hasselhoff, class_name: "David", foreign_key: "friend_id"

  delegate :david_name, to: :hasselhoff
  delegate :friend_name, to: :friendly_user
end
