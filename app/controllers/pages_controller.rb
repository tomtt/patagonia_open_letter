class PagesController < ApplicationController
  def home
    @signatories = Signatory.all
  end
end
