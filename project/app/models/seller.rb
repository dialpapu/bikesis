require 'devise'
class Seller < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_uniqueness_of :personId, :message => "El identificador para esta persona ya existe"
validates_uniqueness_of :document, :message => "El documento de esa persona ya existe"
validates_length_of :personName, :within => 1..50
validates_length_of :lastName, :within => 1..50
validates_length_of :telephone, :within => 1..20
end
