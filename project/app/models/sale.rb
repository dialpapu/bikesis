class Sale < ActiveRecord::Base
	dates_length_of :note, :within => 1..300
end
