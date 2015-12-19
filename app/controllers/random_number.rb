class RandomNumber

  def initialize(app)
    @app = app
  end

  def call(env)
    [200, {'Content-Type' => 'text/html'}, [rand(1-6)]]
  end

end