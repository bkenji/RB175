require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"


get "/" do 
  @title = "File list"
  @files = Dir.glob("*", base:"public")
  @files.reverse! if params[:sort] == "descending"
  erb :home
end

