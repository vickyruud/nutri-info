class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.text :ingredients
      t.text :steps
      t.integer :servings
      t.integer :cooking_time
      t.string :image_url

      t.timestamps
    end
  end
end
