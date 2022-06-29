require_relative 'time_handler'
require_relative 'app'

use Rack::Reloader, 0
use Rack::ContentType, 'text/html'

map '/time' do
  run App.new
end
