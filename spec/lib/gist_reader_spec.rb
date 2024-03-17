require 'gist_reader'
require 'open-uri'

RSpec.describe GistReader do
  describe "read" do
    it "raises when url is empty" do
      expect { GistReader.read("") }.to raise_error GistReader::NoValidGistUrlError
    end

    it "raises an error when url does not contain 'gist'" do
      expect { GistReader.read("ponypark.com") }.to raise_error GistReader::NoValidGistUrlError
    end

    it "reads from full url if it is a raw gist" do
      raw_gist_url = "https://gist.githubusercontent.com/tomtt/2bdafe5e1eeb992bc4bf0ec2e50c6e4e/raw/88105b1716f387614839d0ebab66c71e4d9c94e1/C%2520diatonic%2520notes"
      expect(URI).to receive(:open).with(raw_gist_url).and_return(double('url', read: ""))
      GistReader.read(raw_gist_url)
    end
  end
end
