class MakeSignatoryNameUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :signatories, :name, unique: true
  end
end
