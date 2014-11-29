
require_relative 'lib/connect'
require_relative 'lib/models'






# define the create address entry methods
def createEntry

  ### Warning: Nested methods in Ruby actually
  ###          affect the scope *outside* of the
  ###          outer method.  In most cases,
  ###          you should just move the inner
  ###          methods out of the outer method.
  ###
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
  ### Thought: 2 potential simplifications:
  ###
  ###   1. Don't use a special prompt for the
  ###      first phone number.
  ###
  ###   2. Create a #prompt_yn(...) method that
  ###      prints the specified prompt and waits
  ###      for user input.
  ###
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
	

  ### TODO: Add some error handling here.  It's
  ###       not safe to assume that the save will
  ###       always work.
	entry.save
	puts "address entry has been saved!"

end



def searchEntries
	puts "Searching for entries by last name."
	puts "search for person with this last name:"
	searchString = gets.chomp
	
  ### Pro-tip: you can do partial string matches
  ###          by using a 'LIKE' clause.  Ex:
  ###
  ###            AddressEntry.where('last_name LIKE ?', "%#{searchString}%")
  ###
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

    ### Question: Will this call to #exit still
    ###           be necessarily if you refactor
    ###           the main menu to loop instead
    ###           of using recursion?
		exit
	else
		puts "What's wrong with you, don't you know how to read!?!?"

    ### Note: This call to mainMenu is unnecessary.
		mainMenu()
	end

  ### Question: How can you make the main menu
  ###           repeat without calling this
  ###           method recursively?
	mainMenu()
end

# prompt the user for main menu choice

	

	


#run the program
mainMenu()

