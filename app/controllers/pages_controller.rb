class PagesController < ApplicationController
  include ContentRequester

  def home
    @page_introduction_content = content_for_key("page_introduction")
    @open_letter_content = content_for_key("open_letter")
    @the_ask_content = content_for_key("the_ask")
    @supporting_organisations = SupportingOrganisation.all.has_logo
    @signatories = Signatory.all
    @letter_translations = LetterTranslation.all.has_pdf
  end

  def supporting_organisations
    @supporting_organisations = SupportingOrganisation.all
  end
end
