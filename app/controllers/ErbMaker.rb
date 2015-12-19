class ErbMaker

def initialize(app)
    @app = app
end

def call(env)
  status, headers, response = @app.call(env)
  req = Rack::Request.new(env)
  template = render_template
  case req.fullpath
    when "/"
      body = response.first
    else
      body = template
    end
  [status, headers, [body]]
end

def render_template
  template = File.read('lib/templates/main.html.erb')
  renderer = ERB.new(template)
  renderer.result(binding)
end



end
