class CreateJoinTableBookLibraryBookRelationships < ActiveRecord::Migration
  def change
    create_table :book_library_book_relationships do |t|
      t.references :book_library
      t.references :book
      t.string :state

      t.index [:book_library_id, :book_id], name: 'by_book_library_id_book_id'
      t.index [:book_id, :book_library_id], name: 'by_book_id_book_library_id'
    end
  end
end
