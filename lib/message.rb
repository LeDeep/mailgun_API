class Message

  attr_reader :text, :to, :from, :subject

  def initialize(attributes)
    @text = attributes[:text]
    @to = attributes[:to]
    @from = attributes[:from]
    @subject = attributes[:subject]
    @status = attributes[:status]
  end

  def self.send_it(attributes)
    response = Faraday.post do |request|
      request.url "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/messages"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form({:to => attributes[:to], :from => attributes[:from], :subject => attributes[:subject], :text => attributes[:text]})
    end
    status = response.status
    sent_message = self.new(:to => attributes[:to], :from => attributes[:from], :subject => attributes[:subject], :text => attributes[:text], :status => status)
  end

  def successful?
    @status == 200
  end

end

    response = Faraday.get do |request|
      request.url "https://api:#{API_KEY}@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/unsubscribes"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form({:address => 'sample@gmail.com', :tag => '*'})
    end

