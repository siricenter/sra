require 'spec_helper'

describe FoodInterviewsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'display'" do
    it "returns http success" do
      get 'display'
      response.should be_success
    end
  end

end
