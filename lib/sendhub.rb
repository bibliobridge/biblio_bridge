require "faraday"
require "yajl"


module SendHub
  USERNAME = ENV['SENDHUB_USERNAME']
  APIKEY = ENV['SENDHUB_APIKEY']

  def self.connection
    @conn = Faraday::Connection.new "https://api.sendhub.com/v1/contacts/"
  end

  def self.create_contact name, number
    r = Faraday.post "https://api.sendhub.com/v1/contacts/?username=#{SendHub::USERNAME}&api_key=#{SendHub::APIKEY}",
      Yajl::Encoder.encode(name: name, number: number), 'Content-Type' => 'application/json'
    Yajl::Parser.parse r.body
  end

  def self.send contact_id, message
    r = Faraday.post "https://api.sendhub.com/v1/messages/?username=#{SendHub::USERNAME}&api_key=#{SendHub::APIKEY}",
      Yajl::Encoder.encode(contacts: [contact_id], text: message), 'Content-Type' => 'application/json'
  end
end
