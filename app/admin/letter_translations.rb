ActiveAdmin.register LetterTranslation do
  permit_params :language_name, :language_code, :pdf

  form partial: 'form'
end
