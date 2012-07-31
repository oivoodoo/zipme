require 'spec_helper'

describe SessionsController do
  context "view login page" do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { assigns(:user).should be_new_record }
  end

  context "on login" do
    let(:user) { create(:user) }

    before { post :create, :email => user.email, :password => "123456" }

    it { should redirect_to(home_path) }
    it { assigns(:user).should == user }
  end

  context "try to login with invalid password" do
    let(:user) { create(:user) }

    before { post :create, :email => user.email, :password => 'invalid password' }

    it { should render_template(:new) }
    it { assigns(:user).should_not be }
  end

  context "when logged in" do
    let(:user) { create(:user) }

    before { controller.send(:auto_login, user) }

    context "on logout" do
      before { delete :destroy }

      it { should redirect_to(home_path) }
      it { controller.should_not be_logged_in }
    end
  end

  context "when not logged in on logout" do
    before { delete :destroy }

    it { should redirect_to(root_path) }
  end
end

