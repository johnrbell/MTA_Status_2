require 'pry'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'sinatra/reloader'

class Application<Sinatra::Base
	get '/' do #get all trains
		@final_hash = get_train_data
		erb :index
	end

	get '/:train' do |n| #get a single train
		working_hash = get_train_data
		@final_hash = {}
		if working_hash[n.upcase]
			@final_hash[n.upcase] = working_hash[n.upcase]
			erb :index
		else
			"<center>Sorry, but this train does not exist.</center>"
		end
	end


	def get_train_data #this gets the train data and puts it into a simple, usable hash. 
		group_count = 10 #this is how many train groups the xml file has. i.e. ABC is one group.
		@final_hash = {} #blank hash for final ouput

		data = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt')) #opens xml file.
		trains = data.xpath('//subway').xpath('//name').first(group_count) #gets X train names from xml
		status = data.xpath('//subway').xpath('//status').first(group_count) #get X status for trains from xml
	
		trains.map! do |train| train = train.text.to_s end #reduces to simple array. 
		status.map! do |train| train = train.text.to_s end #reduces to simple array. 
		work_hash = Hash[trains.zip status] #merges two arrays to one hash.
		work_hash = work_hash.to_a #turns hash into an array
		
		work_hash.each do |train,status| #split multiple trains to individual 
			train.length.times do |i| 
				@final_hash[train[i]] = status #new hash, each train alone
			end
		end

		return @final_hash #returns the hash. 
	end

end