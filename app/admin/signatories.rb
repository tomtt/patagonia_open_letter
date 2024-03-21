ActiveAdmin.register Signatory do
  config.sort_order = "position_asc"
  config.paginate   = false

  # reorderable

  # index as: :reorderable_table do
  #   column :id
  #   column :name
  # end

  show do |signatory|
    attributes_table do
      row :id
      row :name
    end
  end

  permit_params :name, :position
end
