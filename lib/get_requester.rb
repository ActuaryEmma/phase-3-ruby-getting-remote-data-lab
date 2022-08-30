# Write your code here
require 'json'
require 'open-uri'
require 'net/http'

class GetRequester
   attr_accessor :url
   def initialize(url)
    @url = url
   end
   
    def get_response_body
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        programs = JSON.parse(self.get_response_body)
        programs.collect do |program|
          program
        end
    end
end
get_requester = GetRequester.new('https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json')
puts get_requester.parse_json
