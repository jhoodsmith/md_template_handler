require 'redcarpet'

if defined? Haml::Template
  Haml::Template.options[:ugly] = true
end

module MdTemplateHandler
  module Handler
    def self.call(template)
      source = erb.call(template)
      <<-SOURCE
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true 
    }
    Redcarpet::Markdown.new(renderer, options).render(begin;#{source};end)
    SOURCE
    end

    def self.erb
      @@erb ||= ActionView::Template.registered_template_handler(:erb)
    end
  end
end

ActionView::Template.register_template_handler :md, MdTemplateHandler::Handler
