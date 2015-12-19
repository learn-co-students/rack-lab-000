require_relative 'config/environment'

use ServerPort
use RequestMethod
use ErbMaker
run Application.new
