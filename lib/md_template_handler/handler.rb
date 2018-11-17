require 'redcarpet'

if defined? Haml::Template
  Haml::Template.options[:ugly] = true
end

module MdTemplateHandler
  module Handler
    def self.call(template)
      compiled_template = erb.call(template)
      "MdTemplateHandler::Handler.render(begin;#{compiled_template};end)"
    end

    def self.render(source)
      renderer = Redcarpet::Render::HTML.new
      Redcarpet::Markdown.new(renderer).render(source)
    end

    def self.erb
      @@erb ||= ActionView::Template.registered_template_handler(:erb)
    end
  end
end

ActionView::Template.register_template_handler :md, MdTemplateHandler::Handler
