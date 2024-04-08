class AddPositionToSupportingOrganisations < ActiveRecord::Migration[7.1]
  def change
    add_column :supporting_organisations, :position, :integer
  end
end
