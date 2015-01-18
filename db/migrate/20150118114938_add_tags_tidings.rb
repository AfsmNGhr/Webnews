class AddTagsTidings < ActiveRecord::Migration
  def change
    create_table :tags_tidings do |t|
      t.integer :tiding_id
      t.integer :tag_id
    end
  end
end
