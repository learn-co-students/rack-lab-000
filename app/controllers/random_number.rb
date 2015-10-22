class RandomNumber
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
	[status, headers, body << rand(100).to_s]
  end  
end