module Inatra
  class << self

    @@routes = {}
    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(method, args, &block)
      append(method, args, &block)
    end

    def append(verb, path, &handler)
      @@routes[verb] = {}
      @@routes[verb][path] = handler
    end

    def call(env)
      verb = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']
      handler = @@routes[verb][path]
      handler.call
    end
  end
end
