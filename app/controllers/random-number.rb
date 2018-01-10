class RandomNumber
def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      response_body = "#{rand(1..1000)}"

      [status, headers, [response_body]]
    end
end
