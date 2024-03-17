require 'sinatra/base'

class FakeDomainThatErrors < Sinatra::Base
  get '/html' do
    "<html>No lines here, only html</html>"
  end

  get '/html-paragraphs' do
    "A body with <p>a paragraph</p>"
  end

  get '/:code' do
    status params[:code].to_i
    "I failed with #{params[:code]}"
  end
end
