class PagesController < ApplicationController
  def home
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @open_letter_content = ContentBlock.find_by_key!("open_letter").content
    @supporting_organisations = SupportingOrganisation.all
    @signatories = Signatory.all
  end
end
