class Link < ActiveRecord::Base
  attr_accessible :key, :url

  belongs_to :user

  validates :url, :presence => true

  uniquify :key

  def short
    "/links/#{key}" unless key.blank?
  end

  def to_param
    key
  end
end

