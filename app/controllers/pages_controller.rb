class PagesController < ApplicationController
  def home
    @page_introduction_content = content_for_key("page_introduction")
    @open_letter_content = content_for_key("open_letter")
    @supporting_organisations = SupportingOrganisation.all
    @signatories = Signatory.all
  end

  private

  def  content_for_key(key)
    ContentBlock.find_by_key(key)&.content || "**Here will be the content for \"#{key}\"**"
  end
end
