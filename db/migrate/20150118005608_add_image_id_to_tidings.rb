class AddImageIdToTidings < ActiveRecord::Migration
  def change
    add_column :tidings, :image_id, :string
  end
end
