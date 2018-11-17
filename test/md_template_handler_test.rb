require 'test_helper'

class MdTemplateHandler::Test < ActiveSupport::TestCase
  test "registers a template handler" do
    assert_equal(
      MdTemplateHandler::Handler,
      ActionView::Template.registered_template_handler(:md)
    )
  end
end

class MdTemplateHandlerRailsTest < ActionDispatch::IntegrationTest
  test "md template handler" do
    get '/hello'

    expected = '<p>Hello, <strong>World</strong>!</p>' + "\n"
    assert_equal expected, response.body
  end
end
