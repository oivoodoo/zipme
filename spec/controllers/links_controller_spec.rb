require 'spec_helper'

describe LinksController do
  let!(:link) { create(:link) }

  describe "redirect to requested page" do
    before { get 'show', :id => link.key }

    it { should redirect_to(link.url) }
  end

  describe "page not found on requested invalid id" do
    before { get 'show', :id => "invalid id" }

    it { should respond_with(404) }
  end
end

