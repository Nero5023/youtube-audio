require 'yt'
class SearchController < ApplicationController
  def search
    Yt.configuration.api_key = 'AIzaSyAWIKMkixMDQxZtJVkAVxddzgkIjQPvkIM'
    videos = Yt::Collections::Videos.new
    @searchResults = videos.where(q: params[:q], safe_search: 'none').take(10)
  end
end
