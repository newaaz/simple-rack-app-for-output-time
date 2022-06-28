class App  
  def call(env)
    request = Rack::Request.new(env)
    line_to_time = TimeHandler.new(request.params["format"].split(','))

    build_responce(line_to_time)
  end

  def build_responce(line_to_time)
    responce = Rack::Response.new(line_to_time.format[:body])
    responce.status = line_to_time.format[:status]
    responce.finish
  end
end
