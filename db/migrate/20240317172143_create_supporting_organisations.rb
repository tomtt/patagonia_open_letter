class CreateSupportingOrganisations < ActiveRecord::Migration[7.1]
  def change
    create_table :supporting_organisations do |t|
      t.string :name

      t.timestamps
    end
  end
end
