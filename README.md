# JsVars

It is view helper to render javascript variables in one place with namespaces. 

How to add js variables.  `@user.to_jsvar(:user)` this will add `@user` json value to variable map and it is render by `js_vars_tag` in view 

i.e
    APP = { user: {name: 'jiren', id: 1}, address: {city: 'pune'} }

### Why?

Many times we are using `javascript_tag` or `:javascript` to render javascript variables or json data in view.

i.e

  	:javascript
      var users = #{@users.to_json}  
    
  OR 
    
  	javascript_tag do
    	var users = #{@users.to_json} 
  	end  
  
So here there are no namespace for javascript variables i.e `var APP = {users: [....]}` and they are global. May be there are chances to conflict with other variables with same name. Also in debugging we find difficulties to find variable because variables are not define in namespace. If there are namespace so we can view all variables in namespace from debugging console.

To solve this problems I have written gem `jsvars`.

## Usage

- Add any object to js var map

  		@users.to_jsvars(:users)
     	@address.to_jsvars(:address)

- For rendering all added variables in html. Add following tag to end of the layout.
     
     	= js_vars_tag 
     
     OR
     
     	<%= js_vars_tag %>
    
     Output in html 

     		<script jsvars="jsvars">//<![CDATA[ if(!window.APP){ window.APP = {}};APP.users = [1,2,3]; window.address = 'pune'//]]></script>
     
 
  Here `APP` is a namespace which hold `users` and `address` variables. 

- `to_jsvars` options
     
    @users.to_jsvars(:users, namespace: 'User', json: { only: [:id]})  

  namespace: To change particular variable namespace
  json: To change rendering object fields.

### Configuration - It is optional

  To change default namespace add following code to your config initializers
  
  i.e in `config/initializers/js_vars.rb`
 	
    JsVars.configure do |c|
      c.namespace = 'MyNamespace'
    end

  So now by default all variables renders in  `MyNamespace` namespace
  

## Installation

Add this line to your application's Gemfile:

    gem 'jsvars'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsvars

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
