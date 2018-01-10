class ServerPort
  def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      response_body = response.first + " 80"

      [status, headers, [response_body]]
    end
end
