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

  describe "create a new link" do
    before { xhr :post, :create, :link => attributes }

    it { should respond_with(:success) }
    it { response.body.should == Link.last.to_json(:methods => :short) }
  end

  describe "try to create a new link with invalid attributes" do
    before { xhr :post, :create, :link => attributes.merge(:url => nil) }

    it { should respond_with(400) }
  end

  def attributes
    @attributes ||= attributes_for(:link)
  end
end

