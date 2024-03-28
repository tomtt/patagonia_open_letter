ActiveAdmin.register SupportingOrganisation do
  permit_params :name, :url, :logo

  form partial: 'form'

  show do
    attributes_table do
      row :name
      row :logo do |supporting_organisation|
        image_tag supporting_organisation.logo.variant(:carousel)
      end
      row :url do
        a supporting_organisation.url, href: supporting_organisation.url
      end
    end
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
