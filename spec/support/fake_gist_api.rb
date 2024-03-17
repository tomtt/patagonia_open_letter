require 'sinatra/base'

class FakeGistApi < Sinatra::Base
  get '/gists/2bdafe5e1eeb992bc4bf0ec2e50c6e4e' do
    # C diatonic notes
    json_response 200, '2bdafe5e1eeb992bc4bf0ec2e50c6e4e'
  end

  get '/gists/ce823ce60a61bde7cf180afd9ec2cd40' do
    # Guitar strings
    json_response 200, 'ce823ce60a61bde7cf180afd9ec2cd40'
  end

  get '*' do |path|
    status 200
    "URL not faked in FakeGistApi: '#{path}'"
  end

  private

  def json_response(response_code, id)
    filename = TomttPlayground.root.join('spec', 'fake_responses', 'api.github.com', "#{id}.json")
    if File.exist? filename
      content_type :json
      status response_code
      File.open(filename).read
    else
      status 200
      "No fake file for FakeGistApi '#{id}'"
    end
  end
end
