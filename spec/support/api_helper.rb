module ApiHelper
  def json
    JSON.parse(last_response.body)
  end
end
