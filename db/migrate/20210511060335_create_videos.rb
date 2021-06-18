class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :thumbnail

      t.timestamps
    end
  end
end
