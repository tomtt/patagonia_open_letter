ActiveAdmin.register SupportingOrganisation do
  permit_params :position, :name, :url, :logo, :image_max_height

  form partial: 'form'

  show do
    attributes_table do
      row :position
      row :name
      row :logo do |x|
        if x.logo.attached?
          image_tag x.logo.variant(:carousel)
        else
          para "No logo"
        end
      end
      row :url do
        a supporting_organisation.url, href: supporting_organisation.url
      end
    end
  end

  index do
    selectable_column
    column :id
    column :position
    column :name
    column :url
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

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
