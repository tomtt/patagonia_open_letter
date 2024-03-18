class CreateContentBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :content_blocks do |t|
      t.string :key
      t.text :content

      t.timestamps
    end
  end
end
