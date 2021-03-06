require 'spec_helper'

describe LinksController do
  let!(:link) { create(:link) }

  describe 'get list of links' do
    let!(:google) { create(:link) }

    before { get 'index' }

    it { should respond_with(:success) }
    it { response.body.should == [link, google].to_json }
  end

  describe "get link" do
    before { get 'show', :id => link.to_param }

    it { should respond_with(:success) }
    it { response.body.should == link.to_json(:methods => :short) }
  end

  describe "page not found on requested invalid id" do
    before { get 'show', :id => "invalid id" }

    it { should respond_with(404) }
  end

  describe "create a new link" do
    before { xhr :post, :create, :link => attributes }

    it { should respond_with(:success) }
    it { assigns(:link).user.should_not be }
    it { response.body.should == Link.last.to_json(:methods => :short) }
  end

  describe "try to create a new link with invalid attributes" do
    before { xhr :post, :create, :link => attributes.merge(:url => nil) }

    it { should respond_with(400) }
  end

  describe "update link" do
    let!(:link) { create(:link) }

    before { xhr :put, :update, :id => link.id, :link => { :key => "new_key" } }

    it { should respond_with(:success) }
    it { response.body.should == link.reload.to_json(:methods => :short) }
    it { link.reload.key.should == "new_key" }
  end

  describe "try to update link with invalid attributes" do
    let!(:link) { create(:link) }

    before { xhr :put, :update, :id => link.id, :link => { :key => "" } }

    it { should respond_with(400) }
    it { assigns(:link).key.should be_empty }
  end

  describe "try to update link using invalid id" do
    before { xhr :put, :update, :id => "invalid id" }

    it { should respond_with(404) }
  end

  def attributes
    @attributes ||= attributes_for(:link)
  end
end

describe LinksController do
  context "when logged in" do
    before { logged_in }

    context "create a new link" do
      before { post :create, :link => attributes_for(:link) }

      it { should respond_with(:success) }
      it { assigns(:link).user.should == current_user }
    end

    context "try to update not owned link" do
      let(:not_me) { create(:user) }
      let!(:not_mine) { create(:link, :user => not_me) }

      before { put :update, :id => not_mine.id, :link => { :url => "not mine link" } }

      it { should respond_with(403) }
      it { assigns(:link).reload.url.should_not == 'not mine link'}
    end
  end
end

