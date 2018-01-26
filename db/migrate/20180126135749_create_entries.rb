class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.datetime :published_at
      t.integer :feed_id

      t.timestamps
    end
  end
end
