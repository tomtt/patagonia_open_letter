class PagesController < ApplicationController
  def home
    @supporting_organisations = SupportingOrganisation.all
    @signatories = Signatory.all
  end
end
