class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.text :description
      t.integer :guid
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
