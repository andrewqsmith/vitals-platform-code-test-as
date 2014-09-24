require 'award'

def update_quality(awards)
=begin
File complexity reduced by utilizing a class
=end
  awards.each { |award| award.award_update! }
end
