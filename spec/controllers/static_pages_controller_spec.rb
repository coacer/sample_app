require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "#home" do
    it "should get home" do
      get :home
      expect(response).to be_successful
      expect(response.body).to have_title(base_title)
    end

    it "should not have a base title" do
      get :home
      expect(response).to be_successful
      expect(response.body).to_not have_title("Home | #{base_title}")
    end
  end

  describe "#help" do
    it "should get help" do
      get :help
      expect(response).to be_successful
      expect(response.body).to have_title("Help | #{base_title}")
    end
  end

  describe "#about" do
    it "should get about" do
      get :about
      expect(response).to be_successful
      expect(response.body).to have_title("About | #{base_title}")
    end
  end

  describe "#contact" do
    it "should get contact" do
      get :contact
      expect(response).to be_successful
      expect(response.body).to have_title("Contact | #{base_title}")
    end
  end

end
