class Link < ActiveRecord::Base
  attr_accessible :key, :url

  belongs_to :user

  validates :url, :presence => true
  validates :key, :presence => true, :uniqueness => true

  uniquify :key
end

