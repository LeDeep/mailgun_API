require 'faraday'
require 'json'
require 'rspec'
require 'webmock/rspec'

require 'uri'
require 'base64'
require 'message'


API_KEY = "key-9bqoe-5osuesvts8uq-4wksux6s79pe5"
VALID_RESPONSE = '#<Faraday::Response:0x007ffbcb044bf0 @env={:method=>:post, :body=>"{\n  \"message\": \"Queued. Thank you.\",\n  \"id\": \"<20130322174548.17053.60283@foobar2.epicodus.mailgun.org>\"\n}", :url=>#<URI::HTTPS:0x007ffbcb063898 URL:https://api:key-9bqoe-5osuesvts8uq-4wksux6s79pe5@api.mailgun.net/v2/foobar2.epicodus.mailgun.org/messages>, :request_headers=>{"User-Agent"=>"Faraday v0.8.6", "Authorization"=>"Basic YXBpOmtleS05YnFvZS01b3N1ZXN2dHM4dXEtNHdrc3V4NnM3OXBlNQ==", "Content-Type"=>"application/x-www-form-urlencoded"}, :parallel_manager=>nil, :request=>{:proxy=>nil}, :ssl=>{}, :status=>200, :response_headers=>{"server"=>"nginx/1.0.14", "date"=>"Fri, 22 Mar 2013 17:45:48 GMT", "content-type"=>"application/json", "connection"=>"close", "content-length"=>"106", "content-disposition"=>"inline", "access-control-allow-origin"=>"*", "access-control-max-age"=>"600", "access-control-allow-methods"=>"GET, POST, PUT, DELETE, OPTIONS", "access-control-allow-headers"=>"Content-Type, x-requested-with"}, :response=>#<Faraday::Response:0x007ffbcb044bf0 ...>}, @on_complete_callbacks=[]>'