class Link < ActiveRecord::Base
  attr_accessible :key, :url

  belongs_to :user

  validates :url, :presence => true

  validates_presence_of :key, :on => :update

  uniquify :key

  def short
    "/#{key}" unless key.blank?
  end

  def to_json(options = {})
    super(methods: :short)
  end
end

