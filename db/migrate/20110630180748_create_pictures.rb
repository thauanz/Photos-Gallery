class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.references :user
      t.references :gallery

      t.timestamps
    end
    add_index :pictures, :user_id
    add_index :pictures, :gallery_id
  end
end

