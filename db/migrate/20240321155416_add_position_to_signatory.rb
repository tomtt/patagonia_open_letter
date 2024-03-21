class Signatory < ApplicationRecord
end

class AddPositionToSignatory < ActiveRecord::Migration[7.1]
  def change
    add_column :signatories, :position, :integer
    Signatory.order(:updated_at).each.with_index(1) do |signatory, index|
      signatory.update_column :position, index
    end
  end
end
