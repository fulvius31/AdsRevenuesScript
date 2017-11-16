firstadd=  $(cat  monthly.json  | grep -Po '(?<="expenses":")[^"]+' | cut -c 2- | sed 's/,//')
secondadd= $(cat monthlyappnext | sed 's/\\//g' | grep -Po '(?<="Earning": )[^r]+')
thirdadd=  $(cat  monthadcolony | sed 's/\\//g' | grep -Po '(?<="totals":{"Earnings":)[^,]+')

echo "$firstadd + $secondadd + $thirdadd" | bc | sed -e 's/^/\nTot Month$/'

