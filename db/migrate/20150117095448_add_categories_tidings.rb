class AddCategoriesTidings < ActiveRecord::Migration
  def change
    create_table :categories_tidings do |t|
      t.integer :tiding_id
      t.integer :category_id
    end
  end
end
