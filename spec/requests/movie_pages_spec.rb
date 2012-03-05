require 'spec_helper'

describe "MoviePages" do

  subject { page }

  before(:all) do
    load "#{Rails.root}/db/seeds.rb"
  end

  describe "GET /movie_path" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get movies_path
      response.status.should be(200)
    end
  end

  describe "index" do

    before(:each) do
      visit movies_path
    end

    it { should have_selector('table#movies') }

    it { should have_selector('th', text: 'Movie Title') }
    it { should have_selector('td', text: 'Aladdin') }
    it { should have_selector('td a', text: 'More about Aladdin') }

    # it { puts page.body }

  end

end

