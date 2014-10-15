class Seller 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :personId, :document, :username, :userLastName, :email, :password, :password_confirmation, :telephone, :userType, :status
  
  validates_presence_of :personId, :document, :username, :userLastName, :email, :password, :password_confirmation, :telephone, :userType, :status
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :multiline =>true
  validates_length_of :telephone, :maximum => 10
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
    
end
