ActiveAdmin.register Signatory do
  permit_params :name, :logo, :position

  config.sort_order = "position_asc"
  config.paginate   = false

  form partial: "form"

  # reorderable

  # index as: :reorderable_table do
  #   column :id
  #   column :name
  # end

  index do
    selectable_column
    column :id
    column :position
    column :name
    column :logo do |x|
      if x.logo.attached?
        image_tag(x.logo.variant(:thumb))
      else
        para "No logo"
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :position
      row :name
      row :logo do |x|
        if x.logo.attached?
          image_tag x.logo.variant(:signatory_list)
        else
          para "No logo"
        end
      end
    end
  end
end
