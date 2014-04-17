module JsVars
  module TagHelper

    def js_vars_tag(default_namespace = 'APP')
      script_data = '' 

      JsVars::VarMap.get.each do |namespace, vars|
        namespace ||= default_namespace
        script_data += "if(!window.#{namespace}){ window.#{namespace} = {}};"
        script_data = vars.inject(script_data) {|s, (k, v)| s += "#{namespace}.#{k} = #{v.is_a?(String) ? v : v.to_json};" } if vars
      end

      return '' if JsVars::VarMap.empty?

      JsVars::VarMap.clear

      return script_data.html_safe if request.xhr?

      raw javascript_tag(jsvars: :jsvars){ script_data.html_safe }
    end

  end
end
