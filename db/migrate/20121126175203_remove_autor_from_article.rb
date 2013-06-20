class RemoveAutorFromArticle < ActiveRecord::Migration
  def up
    remove_column :articles, :autor
      end

  def down
    add_column :articles, :autor, :string
  end
end
