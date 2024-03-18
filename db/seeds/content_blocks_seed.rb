# bundle exec rake db:seed:single SEED=content_blocks_seed

open_letter_content = File.read(Rails.root.join("db", "seeds", "open_letter_content.md"))

puts "Creating open letter content_block"
ContentBlock.find_or_create_by(key: "open_letter", content: open_letter_content)
