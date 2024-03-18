class AddUrlToSupportingOrganisations < ActiveRecord::Migration[7.1]
  def change
    add_column :supporting_organisations, :url, :string
  end
end
