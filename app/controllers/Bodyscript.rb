class Bodyscript

def initialize(app)
    @app = app
end

def call(env)
  status, headers, response = @app.call(env)
  body = response.first + "<body>"
  [status, headers, [body]]
end


end