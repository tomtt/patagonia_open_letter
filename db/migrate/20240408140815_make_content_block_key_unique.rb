class MakeContentBlockKeyUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :content_blocks, :key, unique: true
  end
end
