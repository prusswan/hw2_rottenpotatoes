require 'spec_helper'

describe MoviesController do
  describe 'searching TMDb' do
    before :each do
      Movie.stub(:find_in_tmdb).and_return('matching movies')
    end      
    it 'should call the model method that performs TMDb search' do
      Movie.should_receive(:find_in_tmdb).with('hardware')
      post :search_tmdb, {:search_terms => 'hardware'}
    end
    it 'should select the Search Results template for rendering' do
      post :search_tmdb, {:search_terms => 'hardware'}
      response.should render_template('search_tmdb')
    end
    it 'should make the TMDb search results available to that template' do
      post :search_tmdb, :search_string => 'hardware'
      assigns(:movies).should == 'matching movies'
    end
  end
end
