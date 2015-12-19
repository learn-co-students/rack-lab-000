class ServerPort

  def initialize(app)
    @app = app
  end

  def call(env)
    [200, {'Content-Type' => 'text/html'}, [env["SERVER_PORT"]]]
  end

end