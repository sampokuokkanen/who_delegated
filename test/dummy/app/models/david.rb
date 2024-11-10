# frozen_string_literal: true

class David < ApplicationRecord
  belongs_to :friend

  def david_name
    name
  end
end
