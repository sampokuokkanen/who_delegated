# frozen_string_literal: true

class User < ApplicationRecord
  has_one :friend

  delegate :friend_name, to: :friend
end
