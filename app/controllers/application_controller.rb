class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "It's the ship that made the Kessel Run in less than twelve parsecs. I've outrun Imperial starships. Not the local bulk cruisers mind you, I'm talking about the big Corellian ships now. She's fast enough for you old man. What's the cargo?"
  end
end
