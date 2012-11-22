class AddFatherCommentIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :father_comment_id, :integer

  end
end
