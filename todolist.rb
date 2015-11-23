$todos = [] # global variable to hold all To-Dos
$quote = ""
def todolist
	system "clear"
	exit = false
	quote_of_the_day # calls randomizer and determines the quote of the day
	until exit # until exit is true
		puts "\"" + $quote + "\""
		puts "================="
		puts "To Dos:"
		if $todos.empty?
			puts "You're clear!"
		else
			($todos.count).times {|i| puts("[" + (i+1).to_s + "] " + $todos[i])}
		end
		puts "================="
		puts "1. Add item"
		puts "2. Complete item"
		puts "3. Exit"
		puts # empty line for visibility
		input = gets.chomp.to_i

		if input == 1 # add item
			add_item # call method to add item
		elsif input == 2 #complete item
			complete_item 
		elsif input == 3 # exit
			puts "Alrighty! Till next time!"
			return exit = true
		end
		system "clear"
	end
	return self
end


def add_item
	added = false
		until added
			puts "What do you gotta do?"
			new_do = gets.chomp
			puts "You want to add: \"#{new_do}\" (Y/N or [E]xit)?"
			answer = gets.chomp.downcase
			if answer == "y"
				new_do = new_do.downcase.capitalize + "."
				$todos << new_do
				added = true
			elsif answer == "e"
				added = true # exit the loop
			end 
		end
end

def complete_item
	completed = false
		until completed
			puts "Which number did you finish? (Number or [E]xit)"
			answer = gets.chomp
			num_answer = answer.to_i
			if answer.downcase == "e"
				completed = true
			elsif $todos[num_answer-1] == nil
				puts "That's not a todo!"
			else
				puts "Complete--> " + "\"" + "[#{answer}] " + $todos[num_answer-1] + "\"" + "? (Y/N or [E]xit)"
				confirm = gets.chomp.downcase
				if confirm == "y"
					$todos.delete($todos[num_answer-1])
					completed = true
				elsif confirm == "e"
					completed = true
				end
			end
		end
end

def quote_of_the_day
	# call rand
	q = srand%8 + 1 # +1 makes sure its never 0, and that 8 has a chance to be selected
	# then the program will be that quote for the rest of the runtime. Increase 8 to whatever new number of quotes you have when necessary
	if q == 1
		$quote = "Please: Do everything you possibly can in one lifetime."
	elsif q == 2
		$quote = "I am not a product of my circumstances. I am a product of my decisions."
	elsif q == 3
		$quote = "Anyone who lives within their means suffers from a lack of imagination"
	elsif q == 4
		$quote = "If you want to fix something, you have to take everything apart and figure out what’s important"
	elsif q == 5
		$quote = "The difference between a goal and a dream is a deadline."
	elsif q == 6
		$quote = "98% of what I worried about never happened"
	elsif q == 7
		$quote = "Worry does not empty tomorrow of its sorrow; it empties today of its strength"
	elsif q == 8
		$quote = "Sometimes I feel like giving up, then I remember I have a lot of people to prove wrong."
	end
end
