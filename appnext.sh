data=$(date "+%m-%d")
month=$(date "+%m")
yesterday=`expr $(date "+%d") - 1`

curl -s 'https://selfservice.appnext.com/Revenue/Service.asmx/GetReport' --cookie cookies.txt -H 'Origin: https://selfservice.appnext.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: it-IT,it;q=0.8,en-US;q=0.6,en;q=0.4' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36' -H 'Content-Type: application/json; charset=UTF-8' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://selfservice.appnext.com/Revenue/Reports.aspx' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --data-binary '{"type":"Apps1","from":"2017-'$data'","to":"2017-'$data'"}' --compressed > dailyappnext

curl -s 'https://selfservice.appnext.com/Revenue/Service.asmx/GetReport' --cookie cookies.txt -H 'Origin: https://selfservice.appnext.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: it-IT,it;q=0.8,en-US;q=0.6,en;q=0.4' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36' -H 'Content-Type: application/json; charset=UTF-8' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://selfservice.appnext.com/Revenue/Reports.aspx' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --data-binary '{"type":"Apps1","from":"2017-'$month'-01","to":"2017-'$data'"}' --compressed > monthlyappnext

curl -s  'https://selfservice.appnext.com/Revenue/Service.asmx/GetReport' --cookie cookies.txt -H 'Origin: https://selfservice.appnext.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: it-IT,it;q=0.8,en-US;q=0.6,en;q=0.4' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36' -H 'Content-Type: application/json; charset=UTF-8' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://selfservice.appnext.com/Revenue/Reports.aspx' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --data-binary '{"type":"Apps1","from":"2017-'$month'-'$yesterday'","to":"2017-'$month'-'$yesterday'"}' --compressed > yesterdayappnext



echo "\nAppnext\n"
cat dailyappnext     | sed 's/\\//g' | grep -Po '(?<="Earning": )[^r]+' | sed -e 's/^/Oggi $/' 
cat yesterdayappnext | sed 's/\\//g' | grep -Po '(?<="Earning": )[^r]+' | sed -e 's/^/Ieri $/' 
cat monthlyappnext   | sed 's/\\//g' | grep -Po '(?<="Earning": )[^r]+' | sed -e 's/^/Mese $/' 