class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.string :product_name,    null:false
      t.text   :explanatory_name, null:false
      t.integer :price,          null:false
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
