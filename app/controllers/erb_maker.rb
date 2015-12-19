class ErbMaker

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)

    if env["PATH_INFO"] == "/about"
      page = "<h1><a href='/'>Are you lost?</a></h1>"
    else
    template = File.read("lib/templates/show.html.erb")
    mark_up = ERB.new(template)
    page = mark_up.result(binding)
    end

    [200, {'Content-Type' => 'text/html'}, [page]]
    
  end

end