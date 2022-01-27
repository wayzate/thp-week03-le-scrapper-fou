require './get_townhall_names.rb'
require './get_townhall_urls.rb'
require './get_townhall_email.rb'

def mairie_christmas()
  townhall_urls = get_townhall_urls
  townhall_names = get_townhall_names

  townhall_emails = []
  for url in townhall_urls
    townhall_emails.push(get_townhall_email(url))
  end

  return townhall_names.zip(townhall_emails).to_h
end
