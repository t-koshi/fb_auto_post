#!/usr/bin/ruby
#sleep(120)
#`cd /home/pi/www/ruby/auto_post/put_picture`
loop do
	`lynx -cmd_script=./fb  -useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:9.0.1) Gecko/20100101 Firefox/9.0.1" https://developers.facebook.com/tools/access_token/ > ./access.txt &`
	sleep(120)
	#`./make_token.sh`
	`./make_token2.sh`
	`raspistill -o /home/pi/img/image.jpg`
	require "koala"
	f = open("./token.txt")
	token = f.gets
	ACCESS_TOKEN = token
	p ACCESS_TOKEN 
	temp = `vcgencmd measure_temp`
	@graph = Koala::Facebook::API.new(ACCESS_TOKEN)

	pages = @graph.get_connections("me","accounts")
	pages.each do |i|
	  if i["id"] == "480691195380323"
	    temp = `vcgencmd measure_temp`
            ondo = `./temp.sh`		
	    fb_page_token = i["access_token"]
	    @page_graph = Koala::Facebook::API.new(fb_page_token)
	    #@page_graph.put_picture("/home/pi/img/image.jpg",{:message => temp+"\n"+ondo},"494951020621007")
	    @page_graph.put_picture("/home/pi/img/image.jpg",{:message => temp+"\n"+ondo})
	    break
	  end
	end
	`killall -9 lynx`
	sleep(3600)
end
#puts @graph.get_connections("me","accounts")
