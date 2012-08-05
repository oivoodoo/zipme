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

  def provide_access?(user = false)
    user_id.nil? or (user and user.id == user_id)
  end

  def click!
    update_attribute(:clicks, clicks + 1)
  end
end

