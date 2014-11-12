#!/usr/bin/osascript

on run argv
	set transactions to {}
	delay 2
	repeat with i from 1 to count of transactions

		-- Create new record
		tell application "System Events" to keystroke "n" using command down
		delay 0.5

		-- Enter in the date
		tell application "System Events" to keystroke item 1 of date of item i of transactions
		tell application "System Events" to key code 124 -- right arrow
		delay 0.5
		tell application "System Events" to keystroke item 2 of date of item i of transactions
		tell application "System Events" to key code 124 -- right arrow
		delay 0.5
		tell application "System Events" to keystroke item 3 of date of item i of transactions
		tell application "System Events" to key code 48 -- tab
		delay 0.5

		-- Transaction type
		tell application "System Events" to keystroke transaction_type of item i of transactions
		tell application "System Events" to key code 48 -- tab
		delay 0.5

		-- Skip past the duplicated date field
		tell application "System Events" to key code 48 -- tab

		-- Security name
		tell application "System Events" to keystroke security of item i of transactions
		tell application "System Events" to key code 48 -- tab
		delay 0.5

		-- Total cost
		tell application "System Events" to keystroke cost of item i of transactions
		tell application "System Events" to key code 48 -- tab
		delay 0.5

		-- Number of shares
		tell application "System Events" to keystroke shares of item i of transactions
		tell application "System Events" to key code 48 -- tab
		delay 0.5

		-- Hit return to finish the transaction
		tell application "System Events" to key code 36 -- tab

		-- It might want to download stuff so give it time
		delay 5
	end repeat
    return 2
end run
