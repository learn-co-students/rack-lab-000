class RandomNumber

	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, response = @app.call(env)
    last_response = response.first + " - #{rand(1000)} - "
    if env["PATH_INFO"] == '/'
    	[status, headers, [last_response]]
    else
    	[status, headers, response]
    end
	end

end