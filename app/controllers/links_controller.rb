class LinksController < ApplicationController
  before_filter :find_link

  def show
    redirect_to @link.url
  end

  private

  def find_link
    @link = Link.find_by_key(params[:id])

    head(404) if @link.blank?
  end
end
