class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :header_background_color
      t.string :header_text_color
      t.string :header_background_star_color
      t.string :body_background_color
      t.string :body_text_color

      t.timestamps null: false
    end
  end
end
