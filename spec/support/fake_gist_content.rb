require 'sinatra/base'

class FakeGistContent < Sinatra::Base
  get '/tomtt/2bdafe5e1eeb992bc4bf0ec2e50c6e4e/raw/88105b1716f387614839d0ebab66c71e4d9c94e1/C%20diatonic%20notes' do
    text_response 200, "C\nD\nE\nF\nG\nA\nB\n"
  end

  get '/tomtt/ce823ce60a61bde7cf180afd9ec2cd40/raw/2fbd6f111f5d864e70f5676ee70f0777d283f783/guitar-strings' do
    text_response 200, ["E", "A", "D", "G", "B", "e"].join("\n")
  end

  get '*' do |path|
    status 200
    "URL not faked in FakeGistContent: '#{path}'"
  end

  private

  def text_response(response_code, content)
    content_type 'text/plain'
    status response_code
    content
  end
end
