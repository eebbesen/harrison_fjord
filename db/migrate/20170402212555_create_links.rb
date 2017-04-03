class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
