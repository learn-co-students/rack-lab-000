class ErbMaker
  def initialize(app)
  	@app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    body.shift if body.first == ""
    request_method = body.shift
    server_port = body.shift
    random_number = body.shift

  	template = ERB.new(File.read("./lib/templates/index.html.erb"))
  	html = template.result(binding)
    [status, headers, [html]]
  end	
end