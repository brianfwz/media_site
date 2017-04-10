class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :headline
      t.attachment :image
      t.integer :ordering, default: 1
      t.integer :like, default: 0
      t.timestamps
      t.references :article, index: true
    end
  end
end
