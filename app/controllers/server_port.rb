class ServerPort
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
	[status, headers, [body.first << "80"]]
  end
end