class RequestMethod

	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, response = @app.call(env)
    last_response = response.first + "#{env["REQUEST_METHOD"]}"
    [status, headers, [last_response]]
	end

end