class ErbMaker

  def initialize(app)
    @app = app
  end

  def call(env)
    round = "text"
    round1 = "text"
    round2 = "text"
    round3 = "text"
    round4 = "text"

    template = ERB.new(File.open('lib/templates/any_erb_text.html.erb').read)
    File.open("lib/templates/#{round}", "w+") do |f|
        f << template.result(binding)
        f.close
      end
      if (env["PATH_INFO"] == "/about")
        
    status, headers, response = @app.call(env)
body = "<h1><a href='/'>Are you lost?</a></h1>"
    [status, headers, [body]]
    else 

       status, headers, response = @app.call(env)
    body = response.first + "<html>
  <head>
    <title></title>
  </head>
  <body>" + " - " + "\n " +
  "<h1><a href='/'>Are you lost?</a></h1>"
    [status, headers, [body]]
  end
  end

end