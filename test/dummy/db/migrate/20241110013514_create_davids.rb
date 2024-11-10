class CreateDavids < ActiveRecord::Migration[7.1]
  def change
    create_table :davids do |t|
      t.string :name
      t.references :friend, null: false, foreign_key: true
      t.timestamps
    end
  end
end
