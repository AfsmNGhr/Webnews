class AddPreviewToTidings < ActiveRecord::Migration
  def change
    add_column :tidings, :preview, :string
  end
end
