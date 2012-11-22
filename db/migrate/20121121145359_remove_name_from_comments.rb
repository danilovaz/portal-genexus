class RemoveNameFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :name
      end

  def down
    add_column :comments, :name, :string
  end
end
