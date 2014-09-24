class Award
=begin
Class constructed to refractor code to ease away from Booleam complexity.
This should allow for easier reading for all programmers that may need
to further modify this file. 
=end
	attr_accessor :name, :expires_in, :quality
	
	def initialize(name, expires_in, quality)
	# Method to initialize the instance variables to be passed into the class
		@name = name
		@expires_in = expires_in
		@quality = quality
	end

	def has_expired?
		expires_in <= 0
	end
	
	def award_update!
	# Method utilized in updating the awards according to the assigned quality and name of award
		if (quality + award_name) <= 0
			@quality = 0
		elseif quality == 80
			return
		elseif (quality + award_name) >= 50
			@quality = 50
		else
			@quality += award_name
		end
		@expires_in -= 1 unless name == "Blue Distinction Plus"
	end

	def award_name
	# Utilized case to properly select award by name
		case name
		when "NORMAL ITEM"
			has_expired ? -2 : -1
		when "Blue First"
			has_expired ? 2 : 1
		when "Blue Distinction Plus"
			0
		when "Blue Compare"
			if has_expired
				-1 * quality
			elseif expires_in > 10
				1
			elseif expires_in > 5
				2
			else
				3
			end
		when "Blue Star"
			has_expired ? -4 : -2
		end
	end
end