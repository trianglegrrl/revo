class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :description
      t.string :serving_type
      t.float :carbs
      t.float :fat
      t.float :protein
      t.float :calories

      t.timestamps
    end
  end
end
