require 'webdrivers'
require 'nokogiri'

def get_townhall_urls()
  response = Nokogiri::HTML(HTTParty.get('http://annuaire-des-mairies.com/val-d-oise.html'))

  townhall_url =  response
    .xpath("//a[contains(@class, 'lientxt')]/@href")
    .map(&:to_s)
    .map{ |urlSuffix| 'http://annuaire-des-mairies.com' + urlSuffix.delete_prefix('.')}

  return townhall_url
end
