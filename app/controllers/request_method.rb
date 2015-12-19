class RequestMethod

  def initialize(app)
    @app = app
  end

  def call(env)
    [200, {'Content-Type' => 'text/html'}, [env["REQUEST_METHOD"]]]
  end

end