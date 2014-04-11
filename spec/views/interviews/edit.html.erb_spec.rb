require 'spec_helper'

describe "interviews/edit" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview))
  end

  it "renders the edit interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interview_path(@interview), "post" do
    end
  end
end
