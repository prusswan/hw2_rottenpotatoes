require 'spec_helper'

describe Movie do
  describe 'searching Tmdb by keyword' do
    context 'with valid API key' do
      it 'should call Tmdb with title keywords' do
        TmdbMovie.should_receive(:find).with(hash_including :title => 'Inception')
        Movie.find_in_tmdb('Inception')
      end
    end
    context 'with invalid API key' do
      it 'should raise an error with a 404 in the message' do
        lambda { Movie.find_in_tmdb('Inception') }.
          should raise_error(Movie::InvalidKeyError)
      end
    end
  end
end
