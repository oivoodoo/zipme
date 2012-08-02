class LinksController < ApplicationController
  before_filter :find_link, :only => :show

  def show
    redirect_to @link.url
  end

  def create
    @link = Link.new(params[:link])

    head(400) and return if @link.invalid?

    @link.save

    render :json => @link.to_json(:methods => :short)
  end

  private

  def find_link
    @link = Link.find_by_key(params[:id])

    head(404) if @link.blank?
  end
end
