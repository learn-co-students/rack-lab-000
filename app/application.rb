class Application

	def call(env)
		if env["PATH_INFO"] == '/'
		  [200, {"Content-Type" => "text/html"}, ["<html><body></body></html>"]]
		else
			[404, {"Content-Type" => "text/html"}, ["<h1><a href='/'>Are you lost?</a></h1>"]]
		end
	end

end