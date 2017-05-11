require 'erb'

class ErbMaker

    def initialize(app)
        @app = app
    end

    def call(env)
        status, headers, response = @app.call(env)
        erbTemplate = 'lib/templates/template.html.erb'
        template = ERB.new(File.read(erbTemplate))
        response_body = response.first + template.result(binding)

        if env["PATH_INFO"] == '/about' 
            [status, headers, ["<h1><a href='/'>Are you lost?</a></h1>"]]
        else 
            [status, headers, [response_body]]
        end
    end
end