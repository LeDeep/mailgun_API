class Unsubscribe

  def self.all
    response = Faraday.get do |request|
    request.url "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/unsubscribes"
    request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")

    body = JSON.parse(response.env[:body])
    unsubscribes = body['items']
    unsubscribes.map {|unsubscribe| unsubscribe['address']}
  end


end