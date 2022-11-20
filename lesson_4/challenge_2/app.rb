require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file("users.yaml")
end

helpers do
  def count_interests
    interests = 0
      @users.each do |user, info|
      interests += info[:interests].size
    end
    interests
  end
end

# access root page
# view template : users
# responsibility: list user names

get "/" do 
  redirect "/users"
end


get "/users" do
  title = "Users"
  erb :users
end
# access specific user page
# view template: user_info
# responsibility: list specific user information based on YAML file



# define the acceptable route first. When using parameters, any value could take the place of the parameter `:name` (the colon tells the program this is a parameter - i.e. a variable placeholder - and not a directory path). Do not confuse Sinatra parameters and query parameters (check ?)
# /users/:name means that any value could replace ":name" in the path and be valid.

get "/users/:name" do
  @name = params[:name]
  @title = "#{@name.capitalize}'s info"
  @user_name = @users[@name.to_sym]

  redirect "/" unless @users.include?(@name.to_sym)
 
  erb :user_info
end