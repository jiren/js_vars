require 'json'
require 'js_vars/version'
require 'js_vars/tag_helper'
require 'js_vars/var_map'
require 'js_vars/obj_ext'
require 'js_vars/rails'

module JsVars

  class << self

    attr_accessor :namespace

    def configure(&block)
      self.namespace = 'APP'
      yield(self) if block_given?
    end

    def add(vars, namespace = nil)
      VarMap.add(vars, namespace || self.namespace) if vars.is_a?(Hash) 
    end

    def clear
      VarMap.clear
    end

  end
end

Object.send(:include, JsVars::ObjExt) unless Object.respond_to?(:to_jsvar)
