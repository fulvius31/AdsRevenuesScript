data=$(date "+%m-%d")
month=$(date "+%m")
yesterday=`expr $(date "+%d") - 1`

wget -O daily.json     --load-cookies cookies.txt "http://admin.ogury.co/utils/campaigns_stats?a=268727&start=2017-$data&end=2017-$data&es=publisher&_=1505421982878" -o daily1.html
wget -O monthly.json   --load-cookies cookies.txt "http://admin.ogury.co/utils/campaigns_stats?a=268727&start=2017-$month-01&end=2017-$data&es=publisher&_=1505421982878" -o month1.html
wget -O yesterday.json --load-cookies cookies.txt "http://admin.ogury.co/utils/campaigns_stats?a=268727&start=2017-$month-$yesterday&end=2017-$month-$yesterday&es=publisher&_=1505421982878" -o yesterday1.html

echo "\nOgury\n"
cat daily.json     | grep -Po '(?<="expenses":")[^"]+' | sed -e 's/^/Oggi /' | sed 's/,//'
cat yesterday.json | grep -Po '(?<="expenses":")[^"]+' | sed -e 's/^/Ieri /' | sed 's/,//' 
cat monthly.json   | grep -Po '(?<="expenses":")[^"]+' | sed -e 's/^/Mese /' | sed 's/,//'

