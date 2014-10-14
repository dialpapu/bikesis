class Article < ActiveRecord::Base
	validates_length_of :articleTitle, :within => 1..50
	validates_length_of :body, :within => 1..1000
	validates_length_of :summary, :within => 1..300
end
