class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
