require 'rails_helper'

describe MoviesController do
  describe 'searching TMDb' do
    it 'calls the model method that performs TMDb search' do
      allow(Movie).to receive(:search_tmdb).with('Avatar') # Aquí 'Avatar' es un ejemplo de término de búsqueda
      get :search_tmdb, { search: 'Avatar' }
    end

    it 'selects the Search Results template for rendering' do
      get :search_tmdb, { search: 'Avatar' }
      expect(response).to render_template('search_tmdb')
    end

    it 'makes the TMDb search results available to that template' do
      allow(Movie).to receive(:search_tmdb).with('Avatar') { ['result1', 'result2'] }
      get :search_tmdb, { search: 'Avatar' }
      expect(assigns(:movies)).to eq(['result1', 'result2'])
    end
  end
end

