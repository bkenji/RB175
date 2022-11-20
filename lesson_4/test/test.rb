require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  "Hello"
end

get "/show/:name" do 
   params[:aa]
end

get "/test" do
  "You got the secret query" if params[:query] == "SECRET"
end

not_found do
  redirect "/"
end