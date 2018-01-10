require 'erb'
class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    [status, headers, [render('home')]]
  end

  def render(file_name)
    ERB.new(File.read("./lib/templates/#{file_name}.html.erb")).result.chomp
  end
end
