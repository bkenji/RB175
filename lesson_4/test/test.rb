require "sinatra"

before do
  content_type :txt
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get "/" do
  "Hello, #{params[:name]}. You asked for #{params[:name]} as well as #{params[:fle]}"
end

get "/usr/*" do
 "You passed in #{params[:splat]}"
end

get "/throw/:type" do 
  player_throw = params[:type].to_sym

  if !@throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{@throws}"
  end 
    computer_throw = @throws.sample


    if player_throw == computer_throw
      "You tied with the computer. Try again."
    elsif computer_throw == @defeat[player_throw]
      "Well done; #{player_throw} beats #{computer_throw}"
    else 
      "Oh well, #{computer_throw} beats #{player_throw}.Bummer"
    end
  end
