require 'nokogiri'
require 'httparty'

def get_townhall_names()
  response = Nokogiri::HTML(HTTParty.get('http://annuaire-des-mairies.com/val-d-oise.html'))

  townhall_url =  response
    .xpath("//a[contains(@class, 'lientxt')]/@href")
    .map(&:to_s)
    .map{ |urlSuffix| urlSuffix.delete_prefix('./95/').delete_suffix('.html')}

  return townhall_url
end
