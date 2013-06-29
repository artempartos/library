class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.string :isbn
      t.integer :pages
      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
