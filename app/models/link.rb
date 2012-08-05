class Link < ActiveRecord::Base
  attr_accessible :key, :url

  belongs_to :user

  validates :url, :presence => true

  uniquify :key

  def short
    "/#{key}" unless key.blank?
  end
end

