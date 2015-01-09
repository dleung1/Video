class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :filepath
      t.string :imagefilepath
      t.references :users, index: true

      t.timestamps
    end
  end
end
