class HomeController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all
  end
end

