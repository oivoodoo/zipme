class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password

  validates_presence_of :email
end

