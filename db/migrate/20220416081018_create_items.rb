class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, null: false, foreign_key: true
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
