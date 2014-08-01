require 'spec_helper'

describe DashboardController do

  describe "GET 'field_worker'" do
    it "returns http success" do
      get 'field_worker'
      response.should be_success
    end
  end

  describe "GET 'admin'" do
    it "returns http success" do
      get 'admin'
      response.should be_success
    end
  end

  describe "GET 'manager'" do
    it "returns http success" do
      get 'manager'
      response.should be_success
    end
  end

end
