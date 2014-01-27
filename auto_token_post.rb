#!/usr/bin/ruby
sleep(120)
`/home/pi/www/ruby/auto_post/make_token.sh`
require "koala"
f = open("/home/pi/www/ruby/auto_post/token.txt")
token = f.gets
token = token.chomp
ACCESS_TOKEN = token
p ACCESS_TOKEN 
#ACCESS_TOKEN = ""
@graph = Koala::Facebook::API.new(ACCESS_TOKEN)
#@graph = Koala::Facebook::API.new(token)

#puts @graph.get_object("me")
pages = @graph.get_connections("me","accounts")
pages.each do |i|
  if i["id"] == "480691195380323"
    #puts "OK"
    #puts i["access_token"]
    fb_page_token = i["access_token"]
    @page_graph = Koala::Facebook::API.new(fb_page_token)
    #puts @page_graph.get_object("me")
    @page_graph.put_connections("480691195380323", "feed", :message => "From Raspberry Pi!!!\n\n" << ACCESS_TOKEN)
    break
  end
end
#puts @graph.get_connections("me","accounts")
