require 'json'

class LookupController < ApplicationController

	def index
		 query = params[:query]
		 url = 'http://api.crunchbase.com/v/1/search.js?query=' + query
		 @results = json_parse(url)
		 render :json => @results, :callback => params[:callback] 
	end

	def show
	end

	def json_parse(url) 
		uri = URI.parse(url)
		result = Net::HTTP.get_response(uri)
		data = result.body
		result = JSON.parse(data)
		if result.has_key? "error"
			raise "error:" + result["error"]
		end
		return data 
	end
end
