# bundle exec rake db:seed:single SEED=content_blocks_seed

open_letter_content = File.read(Rails.root.join("db", "seeds", "open_letter_content.md"))
page_introduction_content = File.read(Rails.root.join("db", "seeds", "page_introduction_content.md"))

puts "Creating open_letter content_block"
ContentBlock.find_or_create_by(key: "open_letter", content: open_letter_content)
puts "Creating page_introduction content_block"
ContentBlock.find_or_create_by(key: "page_introduction", content: page_introduction_content)
