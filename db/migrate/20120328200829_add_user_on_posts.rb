class AddUserOnPosts < ActiveRecord::Migration
  def up
    add_column :posts, :user_id, :reference
  end

  def down
  end
end
