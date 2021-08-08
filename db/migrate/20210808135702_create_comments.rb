class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :anime_id
      t.integer :user_id
      t.text :comment_content

      t.timestamps
    end
  end
end
