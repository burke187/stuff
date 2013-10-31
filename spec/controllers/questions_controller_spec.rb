require 'spec_helper'

describe QuestionsController do
  before :each do
    user = User.create(email: Faker::Internet.email, password: "password",
                     password_confirmation: "password",
                     date_of_birth: Time.gm(rand(1950..2000),rand(1..12),rand(1..28)))
    session[:user_id] = user.id

  end

context "with render_views" do
    render_views

    describe "GET index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    describe "GET new" do
      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
      end

      it "the new template has a question form" do
        get :new
        expect(response.body).to match(/id="question_q_content"/)
      end
    end

    describe "POST create" do
      it "creates a new question" do
        expect { post :create,
                question: FactoryGirl.attributes_for(:question)
        }.to change(Question, :count).by(1)
      end
    end

  end
end


