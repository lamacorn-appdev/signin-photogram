class GameController < ApplicationController
  def puzzle
  end

  def store_cookies
    #Parameters: {"first"=>"2", "second"=>"1", "third"=>"1"}
    
    #method to put something into a hash is "store" while putting something into an array is "push"
  #note, these are plain text and stored on user's device. So never put private info here. 
    
    #cookies.store(:num_1, params.fetch("first"))
    cookies[:num_1] = params.fetch("first")
    cookies[:num_2] = params.fetch("second")
    cookies[:num_3] = params.fetch("third")
    
    #session.store(:num_1, params.fetch("first"))

    
    redirect_to("/game/puzzle")
  end
end
