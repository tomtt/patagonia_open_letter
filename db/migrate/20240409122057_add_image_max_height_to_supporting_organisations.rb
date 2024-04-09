class AddImageMaxHeightToSupportingOrganisations < ActiveRecord::Migration[7.1]
  def change
    add_column :supporting_organisations, :image_max_height, :integer
  end
end
