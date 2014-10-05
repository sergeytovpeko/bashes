
# Output 750 keywords tasks
less parsers.log | awk -F'\t' '{if ($2==18) print $0}' | grep -A 750 '790: 1 mobile market' | awk -F'\t' '{print $6}' | awk -F': ' '{print $2}'
