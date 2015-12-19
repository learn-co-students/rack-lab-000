class RequestMethod

def initialize(app)
    @app = app
end

def call(env)
  status, headers, response = @app.call(env)
  body = response.first + "GET"
  [status, headers, [body]]
end


end