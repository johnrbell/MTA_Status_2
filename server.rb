require 'pry'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'sinatra/reloader'



class Application<Sinatra::Base
	get '/' do 
		group_count = 10 #this is how many train groups the xml file has. i.e. ABC is one group.
		@final_hash = {} #blank hash for final ouput

		data = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt')) #opens xml file.
		trains = data.xpath('//subway').xpath('//name').first(group_count) #gets X train names from xml
		status = data.xpath('//subway').xpath('//status').first(group_count) #get X status for trains from xml

		trains.map! do |train| train = train.text.to_s end #reduces to simple array. 
		status.map! do |train| train = train.text.to_s end #reduces to simple array. 
		work_hash = Hash[trains.zip status] #merges two arrays to one hash.

		work_hash = work_hash.to_a #turns hash into an array
		work_hash.insert(8, work_hash.delete_at(5)) #moves the g train to the end of the list, but before s.

		# binding.pry
		work_hash.each do |train,status| #split multiple trains to individual 
			train.length.times do |i| 
				@final_hash[train[i]] = status #new hash, each train alone
			end
		end

		erb :index
	end
end