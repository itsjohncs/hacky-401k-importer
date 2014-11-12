I made these tools to process transaction data from Aspire (my 401k provider) into Quicken 2015 so I can track them. To use...

* Do a search for the desired date range in "Detailed Account History" of Aspire online
* Export the results
* open with open office or w/e and save as a CSV
* Run `csv-to-ridiculous-format.py` on the csv with one of "Safe Harbor Match", "Employee Deferral", or "Employee Roth"
* copy and paste the output into the trasactions variable in `import-401k.applescript`
* Run the script. You'll have two seconds to click focus into Quicken's transactions pane. The script will control your keyboard.
