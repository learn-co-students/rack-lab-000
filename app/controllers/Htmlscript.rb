class Htmlscript

def initialize(app)
    @app = app
end

def call(env)
  status, headers, response = @app.call(env)
  body = response.first + "<html>"
  [status, headers, [body]]
end


end