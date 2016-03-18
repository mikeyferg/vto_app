class AddFaceToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :thumbnail_face, :string
  end
end
