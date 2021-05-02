class CreateSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :solutions do |t|
      t.string :ingredient
      t.string :description
      t.integer :product_id

      t.timestamps
    end
  end
end
