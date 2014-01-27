#!/bin/sh

lynx -cmd_script=/home/pi/www/ruby/auto_post/fb  -useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:9.0.1) Gecko/20100101 Firefox/9.0.1" https://developers.facebook.com/tools/access_token/ > /home/pi/www/ruby/auto_post/access.txt
