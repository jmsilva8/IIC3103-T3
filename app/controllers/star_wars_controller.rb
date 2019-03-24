require 'httparty'

class StarWarsController < ApplicationController

  def home
    url = 'https://swapi.co/api/films'
    response = HTTParty.get(url)
    response.parsed_response
    @films = response['results']
  end

  def films
    @id = params[:id]
    url = 'https://swapi.co/api/films/%d' % [@id]
    response = HTTParty.get(url)
    response.parsed_response
    @details = response
  end

  def ships
    @id = params[:id]
    url = 'https://swapi.co/api/starships/%d' % [@id]
    response = HTTParty.get(url)
    response.parsed_response
    @details = response
  end

  def planets
    @id = params[:id]
    url = 'https://swapi.co/api/planets/%d' % [@id]
    response = HTTParty.get(url)
    response.parsed_response
    @details = response
  end

  def characters
    @id = params[:id]
    url = 'https://swapi.co/api/people/%d' % [@id]
    response = HTTParty.get(url)
    response.parsed_response
    @details = response
  end

  def api_call(url, name)
    response = HTTParty.get(url)
    response.parsed_response
    if name
      @name = response['name']
    else
      @name = response['title']
    end
  end

  def get_id(url)
    @id = url.split('/')[-1]
  end

  helper_method :api_call
  helper_method :get_id
end
