class RemovePostdateFromArticle < ActiveRecord::Migration
  def up
    remove_column :articles, :postdate
      end

  def down
    add_column :articles, :postdate, :date
  end
end
