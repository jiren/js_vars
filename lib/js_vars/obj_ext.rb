module  JsVars
  module ObjExt

    def to_jsvar(var_name, options = {})
      JsVars.add(
        { 
          var_name => self.to_json(options[:json] || {} ) 
        },
        options[:namespace]
      )
    end

  end
end
