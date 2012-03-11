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

    it { should have_selector('th a#title_header', text: 'Movie Title') }
    it { should have_selector('a#release_date_header') }

    it { should have_selector('td', text: 'Aladdin') }
    it { should have_selector('td a', text: 'More about Aladdin') }

    # it { puts page.body }

    describe "after clicking on 'title' column heading" do

      before(:each) do
        click_link 'title_header'
      end

      it { should have_xpath('//tr[1]/td[1]', text: '2001: A Space Odyssey') }
      it { should have_xpath('//tr[2]/td[1]', text: 'Aladdin') }
      it { should have_xpath('//tr[3]/td[1]', text: 'Amelie') }

      it { should have_xpath("//th[@class='hilite']/a[@id='title_header']") }
      it { should_not have_xpath("//th[@class='hilite']/a[@id='release_date_header']") }

    end

    describe "after clicking on 'release_date' column heading" do

      before(:each) do
        click_link 'release_date_header'
      end

      it { should have_xpath('//tr[1]/td[1]', text: '2001: A Space Odyssey') }
      it { should have_xpath('//tr[2]/td[1]', text: 'Raiders of the Lost Ark') }
      it { should have_xpath('//tr[3]/td[1]', text: 'The Terminator') }

      it { should_not have_xpath("//th[@class='hilite']/a[@id='title_header']") }
      it { should have_xpath("//th[@class='hilite']/a[@id='release_date_header']") }

    end

    describe "rating filtering" do

      it { should have_selector('input#ratings_G') }
      it { should have_selector('input#ratings_PG') }
      it { should have_selector('input#ratings_PG-13') }
      it { should have_selector('input#ratings_R') }

      it { should have_selector('input#ratings_submit') }

      describe "after filtering by rating: 'R'" do

        before(:each) do
          check 'ratings[R]'
          click_button 'Refresh'
        end

        it { should_not have_xpath("//td[text()='PG']") }
        it { should_not have_xpath("//td[text()='PG-13']") }
        it { should_not have_xpath("//td[text()='G']") }

        it { should have_selector("input#ratings_R[checked='checked']") }

        #it { puts page.body }

        describe "sorting by title" do

          before(:each) do
            click_link 'title_header'
          end

          it { should have_xpath('//tr[1]/td[1]', text: 'Amelie') }

          it { should have_selector("input#ratings_R[checked='checked']") }
          it { should have_selector("table tbody tr", count: 3) }

        end

        describe "sorting by release_date" do

          before(:each) do
            click_link 'release_date_header'
          end

          it { should have_xpath('//tr[1]/td[1]', text: 'The Terminator') }

          it { should have_selector("input#ratings_R[checked='checked']") }
          it { should have_selector("table tbody tr", count: 3) }

        end

      end

    end

  end

end

