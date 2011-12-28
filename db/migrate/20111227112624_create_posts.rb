class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :author
      t.integer :count

      t.timestamps
    end
  end
end
