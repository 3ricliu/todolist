def todolist
	todos = []
	exit = false
	until exit # until exit is true
	puts "To Dos"
	if todos.empty?
		puts "You're clear!"
	else
		(todos.count).times {|i| puts("[" + (i+1).to_s + "] " + todos[i])}
	end
	puts "================="
	puts "1. Add item"
	puts "2. Complete item"
	puts "3. Exit"
	input = gets.chomp.to_i

	if input == 1 # add item
		added = false
		until added
			puts "What do you gotta do?"
			new_do = gets.chomp
			puts "You want to add: #{new_do} (Y/N or E)?"
			answer = gets.chomp.downcase
			if answer == "y"
				new_do = new_do.downcase.capitalize + "."
				todos << new_do
				added = true
			elsif answer == "e"
				added = true # exit the loop
			end 
		end
	elsif input == 2 #complete item
		completed = false
		until completed
			puts "Which number did you finish (Number or E)?"
			answer = gets.chomp
			num_answer = answer.to_i
			if answer.downcase == "e"
				completed = true
			elsif todos[num_answer-1] == nil
				puts "That's not a todo!"
			else
				puts "Are you sure you want to complete number #{answer} (Y/N or E)?"
				confirm = gets.chomp.downcase
				if confirm == "y"
					todos.delete(todos[num_answer-1])
					completed = true
				elsif confirm == "e"
					completed = true
				end
			end
		end
	elsif input == 3 # exit
		puts "Alrighty! Till next time!"
		exit = true
	end
	system "clear"
end
return self
end
