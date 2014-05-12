class DashboardController < ApplicationController
  def show
	  @households = Household.all
  end
end
