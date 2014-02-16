require 'sinatra'
require 'json'

# Read in all the fortunes that we have into a hash 
# of category => [list of fortunes]
$categories = {}

filepath = File.join(File.expand_path(File.dirname(__FILE__)), "fortunes")
files = Dir.new(filepath)
files.each do |file|
  unless file == "." or file == ".."
    data = File.read(File.join(filepath, file))
    $categories[file] = data.strip.split("%")
  end
end

before do
  content_type :json
end

get "/" do
  # Gets a random fortune by selecting random key
  # then selecting random fortune
  {"fortune" => $categories[$categories.keys.sample].sample.strip }.to_json
end

get "/categories" do
  # Gives you the list of current categories we have
  {"categories" => $categories.keys}.to_json
end

get "/fortune/:category" do
  # Gets a fortune from a specific category
  if not $categories.include?(params[:category])
    halt(400, "doesn't exist")
  end
  {"fortune" => $categories[params[:category]].sample.strip}.to_json
end

get "/about" do
  {"response" => "A simple api to give you some fortunes you may have seen on your command line. Bugs can go to @codingjester"}.to_json
end

get "/why" do
  {"response" => "I was really really really really really really really bored on a train."}.to_json
end
