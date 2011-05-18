module DLLT
  require 'sinatra'
  require 'haml'

  class WebClient < Sinatra::Base
    get '/' do
      words = DLLT.get_words
      @word = words[0]
      @meaning = words[1]
      haml :index
    end
  end
end
