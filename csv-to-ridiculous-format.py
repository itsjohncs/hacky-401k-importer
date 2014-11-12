#!/usr/bin/env python

import csv
import sys

RIDICULOUS_FORMAT = (
	'{date: {"%(month)s", "%(day)s", "%(year)s"}, '
	'transaction_type: "%(transaction_type)s", '
	'security: "%(security)s", '
	'cost: "%(cost)s", '
	'shares: "%(shares)s"}')

with open(sys.argv[1]) as f:
	rows = list(csv.reader(f))[1:]

transactions = []
for i in rows:
	if i[9] != sys.argv[2]:
		continue

	raw_date = i[12] # Trade Date
	assert i[1] == "Contribution" # Trade Type, I think there may be a sell I'll need to handle
	month, day, year = raw_date.split("/")
	transactions.append({
		"month": month,
		"day": day,
		"year": year,
		"transaction_type": "Buy",
		"security": i[6], # Ticker
		"cost": i[15], # Dollars
		"shares": i[14], # Shares
	})
	
print "{" + ", ".join(RIDICULOUS_FORMAT % i for i in transactions) + "}"
