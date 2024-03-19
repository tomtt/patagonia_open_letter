module PagesHelper
  def markdown_render(content)
    @@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @@markdown.render(content).html_safe
  end
end
