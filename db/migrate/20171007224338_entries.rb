class Entries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :title, { limit: 64 }
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
