class ServerPort

	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, response = @app.call(env)
    last_response = response.first + "#{env["SERVER_PORT"]}"
    [status, headers, [last_response]]
	end

end