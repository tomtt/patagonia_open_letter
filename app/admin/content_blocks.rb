ActiveAdmin.register ContentBlock do
  permit_params :key, :content

  show title: :admin_description

  form do |f|
    f.inputs 'ContentBlock' do
      f.input :key
      f.input :content, as: :simplemde_editor
    end
    f.actions
  end
end
