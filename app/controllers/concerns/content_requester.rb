module ContentRequester
  private

  def content_for_key(key)
    ContentBlock.find_by_key(key)&.content || "**Here will be the content for \"#{key}\"**"
  end
end
