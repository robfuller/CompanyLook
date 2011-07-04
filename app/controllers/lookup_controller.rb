class LookupController < ApplicationController

	def index
	end

	def create
		 query = params[:search]
		 url = 'http://api.crunchbase.com/v/1/search.js?query=' + query
		 @results = json_parse(url)
	end

	def show
	end

end
