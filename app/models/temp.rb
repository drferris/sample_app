class Temp < ActiveRecord::Base

	def self.testing
		puts "hello world"
	end


	def self.GeneratePassword
		random = ('0'..'9').to_a
		('a'..'z').to_a.each do |i|
			random.push(i)
		end
		random << '~' << '@' << '#' << '%' << '&' << '*' << '-' << '=' << '+' << ',' << '.' << '<' << '>' << '?'
		random = random.shuffle
		id = random[0..9].join
		puts id
	end
end