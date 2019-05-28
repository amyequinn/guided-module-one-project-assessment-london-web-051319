class User < ActiveRecord::Base
  has_many :reviews
  has_many :hotels, through: :reviews
  
end
