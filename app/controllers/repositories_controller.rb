class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params["client_id"] = 'e1f7884da3bb28a5f415'
      req.params["client_secret"] = '31d45cc6e0142222e576f0176b4c345bcd304672'
      req.params["q"] = params[:query]
    end
    @body = JSON.parse(@resp.body)
    @results = @body["items"]
    render "search"
  end
end
