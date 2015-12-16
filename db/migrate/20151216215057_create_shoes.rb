class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.references :user, index: true
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
