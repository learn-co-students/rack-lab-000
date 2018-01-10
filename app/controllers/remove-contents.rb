require_relative "erb-maker"
class RemoveContents
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    req = Rack::Request.new(env)

    if req.path.match(/about/)
      [status, headers, [ErbMaker.new(@app).render("lost")]]
    else
      [status, headers, [response]]
    end

  end
end
