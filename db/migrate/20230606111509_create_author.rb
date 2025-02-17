class CreateAuthor < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
    t.string :name
    t.integer :contact
    t.references :book, foreign_key: true
    t.references :user, foreign_key: true
    end
  end
end
