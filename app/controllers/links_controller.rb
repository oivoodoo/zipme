class LinksController < ApplicationController
  before_filter :find_link, :only => [:show, :update]

  def index
    @links = Link.all

    render :json => @links
  end

  def show
    render :json => @link.to_json
  end

  def create
    @link = Link.new(params[:link])
    @link.user = current_user if logged_in?

    head(400) and return if @link.invalid?

    @link.save

    render :json => @link.to_json
  end

  def update
    @link.update_attributes(params[:link])

    head(400) and return if @link.invalid?

    render :json => @link.to_json
  end

  private

  def find_link
    @link = Link.find_by_id(params[:id])

    head(404) if @link.blank?
  end
end
