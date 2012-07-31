require 'spec_helper'

describe UsersController do
  context "open register user page" do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { assigns(:user).should be_new_record }
  end

  context "register a new user" do
    before { post :create, :user => attributes }

    it { should redirect_to(home_path) }
    it { assigns(:user).should be_persisted }
  end

  context "try to register a new user with empty required fields" do
    before { post :create, :user => attributes.merge(:email => nil) }

    it { should render_template(:new) }
    it { assigns(:user).errors.should have(1).item }
  end

  def attributes
    attributes_for(:user)
  end
end

