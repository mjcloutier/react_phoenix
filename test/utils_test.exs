defmodule ReactPhoenixTest.Utils do
  use ExUnit.Case
  import ReactPhoenix.Utils
  # defmodule MyApp.PageView do
  #   use Phoenix.View, root: "test/fixtures/templates"
  #   use Phoenix.HTML
  #   import ReactPhoenix.Utils
  # end

  test "react_component should render wrapper with prerender: false" do
    {:safe, html} = react_component "Hello", %{a: 1}, prerender: false
    assert (to_string html) == "<div data-react-class=\'Hello\' data-react-props=\'{\"a\":1}\'></div>"
  end

  test "react_component should render content with prerender: true" do
    ReactPhoenix.JSContext.load_javascript """
    var Hello = React.createClass({render: function(){return React.createElement('div', {}, "hello")}})
    """

    {:safe, html} = react_component "Hello", %{a: 1}, prerender: true
    assert (to_string html) != "<div data-react-class=\'Hello\' data-react-props=\'{\"a\":1}\' ></div>"
  end
end
