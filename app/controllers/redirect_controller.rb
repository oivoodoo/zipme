class RedirectController < ApplicationController
  before_filter :find_link

  def navigate
    @link.click!

    redirect_to @link.url
  end

  private

  def find_link
    @link = Link.find_by_key(params[:key])

    head(404) if @link.blank?
  end
end

