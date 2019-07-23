class CreateMealItems < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_items do |t|
      t.belongs_to :food, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.float :servings
      t.datetime :eaten_at

      t.timestamps
    end
  end
end
