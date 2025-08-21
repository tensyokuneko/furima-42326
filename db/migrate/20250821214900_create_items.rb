class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_fee_id
      t.integer :prefecture_id
      t.integer :shipping_days_id
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
