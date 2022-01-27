require 'nokogiri'
require 'httparty'

def get_townhall_email(townhall_url)
  response = Nokogiri::HTML(HTTParty.get(townhall_url))

  email =  response
    .xpath("//tr/td[contains(text(), 'Adresse Email')]/../td[position() = 2]/text()")
    .map(&:to_s)
    .first
  return email
end
