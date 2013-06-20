class RemoveEmailFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :email
      end

  def down
    add_column :comments, :email, :string
  end
end
