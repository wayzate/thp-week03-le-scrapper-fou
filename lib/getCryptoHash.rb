require 'watir'
require 'webdrivers'
require 'nokogiri'

def getCryptoHash()
  browser = Watir::Browser.new
  browser.goto 'https://coinmarketcap.com/all/views/all/'
  50.times do
    browser.driver.execute_script("window.scrollBy(0,200)")
    sleep 0.05
  end
  response = Nokogiri::HTML(browser.html)
  browser.close

  currencySymbols =  response
    .xpath("//a[contains(@class, 'cmc-table__column-name--symbol cmc-link')]/text()")
    .map(&:to_s)

  currencyValues =  response
    .xpath("//div[contains(@class, 'sc-131di3y-0 cLgOOr')]/a[contains(@class, 'cmc-link')]/span/text()")
    .map{
      |nokogiriObject|
      nokogiriObject
        .to_s
        .delete_prefix('$')
        .to_f
    }

  return currencySymbols.zip(currencyValues).to_h
end
