class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.string :title
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
