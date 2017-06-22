class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :attachment
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
