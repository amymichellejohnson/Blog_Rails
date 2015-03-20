class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.string :blog

      t.timestamps
    end
  end
end
