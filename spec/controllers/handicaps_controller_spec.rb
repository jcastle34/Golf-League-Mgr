require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe HandicapsController do

  # This should return the minimal set of attributes required to create a valid
  # Handicap. As you add validations to Handicap, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "score" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HandicapsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all handicaps as @handicaps" do
      handicap = Handicap.create! valid_attributes
      get :index, {}, valid_session
      assigns(:handicaps).should eq([handicap])
    end
  end

  describe "GET show" do
    it "assigns the requested handicap as @handicap" do
      handicap = Handicap.create! valid_attributes
      get :show, {:id => handicap.to_param}, valid_session
      assigns(:handicap).should eq(handicap)
    end
  end

  describe "GET new" do
    it "assigns a new handicap as @handicap" do
      get :new, {}, valid_session
      assigns(:handicap).should be_a_new(Handicap)
    end
  end

  describe "GET edit" do
    it "assigns the requested handicap as @handicap" do
      handicap = Handicap.create! valid_attributes
      get :edit, {:id => handicap.to_param}, valid_session
      assigns(:handicap).should eq(handicap)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Handicap" do
        expect {
          post :create, {:handicap => valid_attributes}, valid_session
        }.to change(Handicap, :count).by(1)
      end

      it "assigns a newly created handicap as @handicap" do
        post :create, {:handicap => valid_attributes}, valid_session
        assigns(:handicap).should be_a(Handicap)
        assigns(:handicap).should be_persisted
      end

      it "redirects to the created handicap" do
        post :create, {:handicap => valid_attributes}, valid_session
        response.should redirect_to(Handicap.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved handicap as @handicap" do
        # Trigger the behavior that occurs when invalid params are submitted
        Handicap.any_instance.stub(:save).and_return(false)
        post :create, {:handicap => { "score" => "invalid value" }}, valid_session
        assigns(:handicap).should be_a_new(Handicap)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Handicap.any_instance.stub(:save).and_return(false)
        post :create, {:handicap => { "score" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested handicap" do
        handicap = Handicap.create! valid_attributes
        # Assuming there are no other handicaps in the database, this
        # specifies that the Handicap created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Handicap.any_instance.should_receive(:update_attributes).with({ "score" => "1" })
        put :update, {:id => handicap.to_param, :handicap => { "score" => "1" }}, valid_session
      end

      it "assigns the requested handicap as @handicap" do
        handicap = Handicap.create! valid_attributes
        put :update, {:id => handicap.to_param, :handicap => valid_attributes}, valid_session
        assigns(:handicap).should eq(handicap)
      end

      it "redirects to the handicap" do
        handicap = Handicap.create! valid_attributes
        put :update, {:id => handicap.to_param, :handicap => valid_attributes}, valid_session
        response.should redirect_to(handicap)
      end
    end

    describe "with invalid params" do
      it "assigns the handicap as @handicap" do
        handicap = Handicap.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Handicap.any_instance.stub(:save).and_return(false)
        put :update, {:id => handicap.to_param, :handicap => { "score" => "invalid value" }}, valid_session
        assigns(:handicap).should eq(handicap)
      end

      it "re-renders the 'edit' template" do
        handicap = Handicap.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Handicap.any_instance.stub(:save).and_return(false)
        put :update, {:id => handicap.to_param, :handicap => { "score" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested handicap" do
      handicap = Handicap.create! valid_attributes
      expect {
        delete :destroy, {:id => handicap.to_param}, valid_session
      }.to change(Handicap, :count).by(-1)
    end

    it "redirects to the handicaps list" do
      handicap = Handicap.create! valid_attributes
      delete :destroy, {:id => handicap.to_param}, valid_session
      response.should redirect_to(handicaps_url)
    end
  end

end
