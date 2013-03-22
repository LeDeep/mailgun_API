class Unsubscribe

  def self.all
    response = Faraday.get do |request|
      request.url "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/unsubscribes"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
    end
    body = JSON.parse(response.env[:body])
    unsubscribes = body['items']
    unsubscribes.map {|unsubscribe| unsubscribe['address']}
  end

  def self.add(address)
    response = Faraday.post do |request|
      request.url "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/unsubscribes"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form({:address => address, :tag => '*'})
    end
  end

  def self.remove(address)
    response = Faraday.delete do |request|
      request.url "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/unsubscribes"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form({:address => address, :tag => '*'})
    end
  end

  def self.check(address)
    response = Faraday.get do |request|
      request.url "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/unsubscribes"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form({:address => address, :tag => '*'})
    end
  end

end