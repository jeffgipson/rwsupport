class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fav_posts, :text, array: true, default: []
  end
end
