class HttpMethodNotAllowed
  def initialize(app)
    @app = app
  end

  def call(env)
    if !ActionDispatch::Request::HTTP_METHODS.include?(env['REQUEST_METHOD'].upcase)
      Rails.logger.info('ActionController::UnknownHttpMethod')
      [405, { 'Content-Type' => 'application/json' }, ['Method Not Allowed'.to_json]]
    else
      @status, @headers, @response = @app.call(env)
      [@status, @headers, @response]
    end
  end
end
