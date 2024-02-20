# frozen_string_literal: true

class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.string :friend_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
