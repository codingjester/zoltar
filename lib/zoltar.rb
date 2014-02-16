require 'sinatra'
require 'json'
require "zoltar/version"

# Read in all the fortunes that we have into a hash 
# of category => [list of fortunes]
$categories = {}

Dir.each(File.expand_path(File.dirname(__FILE__), "/fortunes")) do |file|
  puts file
end


before do
  content_type :json
end

get "/" do
  # Gets a random fortune
end

get "/categories" do
  # Gives you the list of current categories we have
end

get "/fortune/:category" do
  # Gets a fortune from a specific category
end

get "/about" do
  {"response": "A simple api to give you some fortunes you may have seen on your command line. Bugs can go to @codingjester"}.to_json
end
