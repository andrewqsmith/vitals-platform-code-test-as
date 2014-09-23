require 'award'

def update_quality(awards)
=begin
Modified the method to include new Blue Star critieria.
The modifications should result in -2 for each check to degrade 
the award twice as fast. 
=end
  awards.each do |award|
    if award.name != 'Blue First' && award.name != 'Blue Compare'
      if award.quality > 0
        if award.name != 'Blue Distinction Plus' 
          award.quality -= 1
		  # Subtract an additional quality point for Blue Star
		  if award.name == 'Blue Star'
			award.quality -= 1
		  end
        end
      end
    else
      if award.quality < 50
        award.quality += 1
        if award.name == 'Blue Compare'
          if award.expires_in < 11
            if award.quality < 50
              award.quality += 1
            end
          end
          if award.expires_in < 6
            if award.quality < 50
              award.quality += 1
            end
          end
        end
      end
    end
    if award.name != 'Blue Distinction Plus'
      award.expires_in -= 1
    end
    if award.expires_in < 0
      if award.name != 'Blue First'
        if award.name != 'Blue Compare'
          if award.quality > 0
            if award.name != 'Blue Distinction Plus'
				award.quality -= 1
				# Add check for blue star and decrease an additional point if true
				if	award.name == 'Blue Star'
						award.quality -= 1
				end
            end
          end
        else
          award.quality = award.quality - award.quality
        end
      else
        if award.quality < 50
          award.quality += 1
        end
      end
    end
  end
end
