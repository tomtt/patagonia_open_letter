ActiveAdmin.register LetterTranslation do
  permit_params :language_name, :language_code, :pdf

  form partial: 'form'

  def pdf_preview

  end

  show title: :description do
    image_tag(url_for(letter_translation.pdf_preview))
  end
end
