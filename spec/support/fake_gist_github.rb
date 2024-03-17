require 'sinatra/base'

class FakeGistGithub < Sinatra::Base
  get '/tomtt/2bdafe5e1eeb992bc4bf0ec2e50c6e4e' do
    text_response 200, "boo"
  end

  get '*' do |path|
    status 200
    "URL not faked in FakeGist: '#{path}'"
  end

  private

  def text_response(response_code, content)
    content_type 'text/plain'
    status response_code
    content
  end
end
