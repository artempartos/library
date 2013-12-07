class CreateUserBookRelationships < ActiveRecord::Migration
  def change
    create_table :user_book_relationships do |t|
      t.integer :user_id
      t.integer :book_library_book_relationship_id
      t.string :state
      t.datetime :readed_at
      t.datetime :returned_at

      t.timestamps
    end
  end
end
