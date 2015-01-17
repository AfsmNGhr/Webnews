class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :preview
      t.string :text

      t.timestamps null: false
    end
  end
end
