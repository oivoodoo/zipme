require 'spec_helper'

describe RedirectController do
  let!(:link) { create(:link) }

  describe "redirect to requested page" do
    before { get 'navigate', :key => link.key }

    it { should redirect_to(link.url) }
  end

  describe "try to redirect if we passed invalid id" do
    before { get 'navigate', :key => 'invalid key' }

    it { should respond_with(404) }
  end
end

