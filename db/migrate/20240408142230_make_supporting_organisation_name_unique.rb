class MakeSupportingOrganisationNameUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :supporting_organisations, :name, unique: true
  end
end
