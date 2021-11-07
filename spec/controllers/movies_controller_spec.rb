require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

RSpec.describe MoviesController do
  before :each do
    @fake_results = [double('movie1'), double('movie2')]
  end
  describe 'searching index' do
    it 'calls the model method that performs the search' do
      expect(Movie).to receive(:search_me).with('hardware').and_return(@fake_results)
      post :search_db, { title: 'hardware' }
    end
    it 'selects the search results template for rendering' do

    end
    it 'makes the TDMb search results available for that template' do

    end
  end
end
