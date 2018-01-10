require_relative 'config/environment'
require_relative 'app/controllers/server-port-middleware'
require_relative 'app/controllers/request-method'
require_relative 'app/controllers/remove-contents'

use RemoveContents
use ServerPort
use RequestMethod
use ErbMaker
run Application.new
