class AddHolderIdAndStateToBook < ActiveRecord::Migration
  def change
    add_column :books, :holder_id, :integer
    add_column :books, :state, :string
  end
end
