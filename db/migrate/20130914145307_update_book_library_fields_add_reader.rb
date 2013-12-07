class UpdateBookLibraryFieldsAddReader < ActiveRecord::Migration
  def change
    add_column :book_library_book_relationships, :reader_relation_id, :integer
  end
end
