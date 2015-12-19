class ErbMaker

	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, response = @app.call(env)
		template = ERB.new File.read("lib/templates/created_template.html.erb")
		template.result
    [status, headers, response]
	end

end