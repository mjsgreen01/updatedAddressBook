
require_relative 'lib/connect'
require_relative 'lib/models'






# define the create address entry methods
def createEntry

	def addPhone(entry)
		puts "Phone number category:"
		phoneCat = gets.chomp
		puts "Phone number digits:"
		phoneNum = gets.chomp

		entry.phone_numbers.push PhoneNumber.new({
			category: phoneCat,
			digits: phoneNum
		})
	end

	def addEmail(entry)
		puts "Email category:"
		emailCat = gets.chomp
		puts "Email address:"
		emailAdd = gets.chomp

		entry.emails.push Email.new({
			category: emailCat,
			address: emailAdd
		})

	end

	puts "You are about to add a new entry to the address book"

	puts "First name:"
	first = gets.chomp
	puts "Last name:"
	last = gets.chomp

	entry = AddressEntry.new({first_name: first, last_name: last})

	puts "Add a phone number? (y/n)"
	yesno = gets.chomp
	#I'm sure there's a better way to do this...
	if yesno == "y"
		addPhone(entry)
		while yesno == "y"
			puts "Add another phone number? (y/n)"
			yesno = gets.chomp
			if yesno == "y"
				addPhone(entry)
			end
		end
	end

	puts "Add an email? (y/n)"
	yesno = gets.chomp
	#I'm sure there's a better way to do this...
	if yesno == "y"
		addEmail(entry)
		while yesno == "y"
			puts "Add another email? (y/n)"
			yesno = gets.chomp
			if yesno == "y"
				addEmail(entry)
			end
		end
	end
	

	entry.save
	puts "address entry has been saved!"

end



def searchEntries
	puts "Searching for entries by last name."
	puts "search for person with this last name:"
	searchString = gets.chomp
	
	matches = AddressEntry.where(last_name: searchString)

	puts "Found #{matches.length} matches\n\n"

	matches.each_with_index do |item, index|

		puts "match number #{index+1}:"
		puts "first name: #{item.first_name}"
		puts "last name: #{item.last_name}"
		puts "Phone numbers:"
		item.phone_numbers.each do |number|
			puts "[#{number.id}] :  #{number.digits}"
		end
		puts "Email addresses:"
		item.emails.each do |email|
			puts email.address
		end
		puts "---------------------------------"
	end
end






def mainMenu
	newEntry = "Create new entry"
	quitApplication = "Quit application"
	searchEntry = "Search for entries"

	puts "MAIN MENU"
	puts newEntry
	puts searchEntry
	puts quitApplication

	puts "What do you want to do?"
	mainChoice = gets.chomp

	if mainChoice == newEntry
		createEntry()
	elsif mainChoice == searchEntry
		searchEntries()
	elsif mainChoice == quitApplication
		puts "Don't worry, your #{AddressEntry.all.length} entries are safely stored in the database"
		puts("Peace out")
		exit
	else
		puts "What's wrong with you, don't you know how to read!?!?"
		mainMenu()
	end

	mainMenu()
end

# prompt the user for main menu choice

	

	


#run the program
mainMenu()

