class CreateBookLibraries < ActiveRecord::Migration
  def change
    create_table :book_libraries do |t|
      t.references :librariable, polymorphic: true

      t.timestamps
    end

    create_join_table :book_libraries, :books, table_name: :book_library_relationships do |t|
      t.string :state

      t.index [:book_library_id, :book_id]
      t.index [:book_id, :book_library_id]
    end
  end
end
