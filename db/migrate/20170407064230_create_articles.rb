class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string  :title
      t.datetime :posted_at
      t.integer :like, default: 0
      t.timestamps
    end
  end
end
