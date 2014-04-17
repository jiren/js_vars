module JsVars 
  module Rails
    class Railtie < ::Rails::Railtie
      initializer 'js_vars.view_helpers' do
        ActionView::Base.send(:include, JsVars::TagHelper)
      end

=begin
      config.before_configuration do
        if config.action_view.javascript_expansions
          config.action_view.javascript_expansions[:defaults] << ['js_vars']
        end
      end
=end
    end
  end
end
