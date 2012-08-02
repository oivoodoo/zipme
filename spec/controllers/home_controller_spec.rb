require 'spec_helper'

describe HomeController do
  context "view home page" do
    before { get :index }

    it { should respond_with(:success) }
    it { should render_template("index") }
    it { assigns(:link).should be_kind_of(Link) }
    it { assigns(:link).should be_new_record }
  end
end

describe HomeController do
  context "with existing links" do
    let!(:google) { create(:link) }
    let!(:yandex) { create(:link) }

    context "view home page" do
      before { get :index }

      it { assigns(:links).should == [google, yandex] }
    end
  end
end

