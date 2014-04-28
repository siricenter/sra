require 'spec_helper'

describe "interviews/edit" do
  before(:each) do
	assign(:household, stub_model(Household))
    @interview = assign(:interview, stub_model(Interview))
	@interview.health = stub_model(Health)
	@interview.expense = stub_model(Expense)
	@interview.morbidity = stub_model(Morbidity)
	assign(:path, @interview)
  end

  it "renders the edit interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interview_path(@interview), "post" do
    end
  end
end
