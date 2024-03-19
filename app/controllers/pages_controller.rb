class PagesController < ApplicationController
  include ContentRequester

  def home
    @page_introduction_content = content_for_key("page_introduction")
    @open_letter_content = content_for_key("open_letter")
    @supporting_organisations = SupportingOrganisation.all
    @signatories = Signatory.all
  end
end
