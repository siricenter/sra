require 'spec_helper'
describe EventsController do
	login_user

	before :each do
		DatabaseCleaner.start
	end

	after :each do
		DatabaseCleaner.clean
	end

	let(:valid_attributes) {{
		title: 'My big party',
		start: Time.now
	}}

	let(:valid_session) {{}}

	describe "GET index" do
		it "assigns all events as @events" do
			event = FactoryGirl.create :event
			get :index, valid_attributes
			assigns(:events).to_a.should eq([event])
		end
	end

	describe "GET show" do
		it "assigns the requested event as @event" do
			event = FactoryGirl.create :event
			get :show, { id:  event.to_param}
			assigns(:event).should eq(event)
		end
	end

	describe "GET new" do
		it "assigns the new event as @event" do
			get :new, {}
			assigns(:event).should be_a_new(Event)
		end
	end

	describe "GET edit" do
		it "assigns the requested event as @event" do
			event = FactoryGirl.create :event
			get :edit, { id: event.to_param }
			assigns(:event).should eq(event)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			before :each do
				DatabaseCleaner.start
			end

			after :each do
				DatabaseCleaner.clean
			end

			it "creates a new Event" do
				expect {
					post :create,
					{event: valid_attributes}
				}.to change(Event, :count).by(1)
			end

			it "assigns a newly created event as @event" do
				post :create, {
					event: valid_attributes
				}
				assigns(:event).should be_a(Event)
				assigns(:event).should be_persisted
			end

			it "redirects to the dashboard" do
				post :create, {
					event: valid_attributes	
				}
				response.should redirect_to(dashboard_path)
			end
		end

		describe "with invalid params" do
			before :each do
				DatabaseCleaner.start
			end

			after :each do
				DatabaseCleaner.clean
			end

			it "assigns a newly created but unsaved event as @event" do
				Event.any_instance.stub(:save).and_return(false)
				post :create, {event: {}}
				assigns(:event).should be_a_new(Event)
			end

			it "re-renders the 'new' template" do
				Event.any_instance.stub(:save).and_return(false)
				post :create, {event: {}}
				response.should_not redirect_to(dashboard_path)
				response.should render_template("new")
			end
		end
	end

	describe "PUT update" do
		before :each do
			DatabaseCleaner.start
		end

		after :each do
			DatabaseCleaner.clean
		end

		describe "with valid params" do
			it "updates the requested event" do
				event = FactoryGirl.create :event
				Event.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
				put :update, {:id => event.to_param, :event => { "these" => "params" }}
			end

			it "assigns the requested event as @event" do
				event = FactoryGirl.create :event
				put :update, {id: event.to_param, event: valid_attributes}
				assigns(:event).should eq(event)
			end

			it "redirects to the event" do
				event = FactoryGirl.create :event
				put :update, {id: event.to_param, interview: valid_attributes}
				response.should redirect_to(event)
			end
		end

		describe "with invalid params" do
			it "assigns the event as @event" do
				event = FactoryGirl.create :event
				Event.any_instance.stub(:save).and_return(false)
				put :update, {id: event.to_param, interview: {}}
				assigns(:event).should eq(event)
			end

			it "re-renders the 'edit' template" do
				event = FactoryGirl.create :event
				Event.any_instance.stub(:save).and_return(false)
				put :update, {id: event.to_param, interview: {}}
				response.should render_template("edit")
			end
		end
	end

	describe "DELETE destroy" do
		before :each do
			DatabaseCleaner.start
			@event = FactoryGirl.create :event
		end

		after :each do
			DatabaseCleaner.clean
		end

		it "destroys the requested event" do
			expect {
				delete :destroy, {id: @event.to_param}
			}.to change(Event, :count).by(-1)
		end

		it "redirects to the events list" do
			delete :destroy, {id: @event.to_param}
			response.should redirect_to(events_url)
		end
	end
end
