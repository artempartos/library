class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.string :title
      t.string :file
      t.integer :book_id

      t.timestamps
    end
  end

  def down
    drop_table :images
  end
end