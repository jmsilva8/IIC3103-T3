class ApplicationController < ActionController::Base

  def get_id(url)
    @id = url.split('/')[-1]
  end
  helper_method :get_id

  def search
    text = params["search"]["name"]
    url = 'https://swapi.co/api/films'
    films = HTTParty.get(url)
    films.parsed_response
    url = 'https://swapi.co/api/people'
    people = HTTParty.get(url)
    people.parsed_response
    url = 'https://swapi.co/api/planets'
    planets = HTTParty.get(url)
    planets.parsed_response
    url = 'https://swapi.co/api/starships'
    starships = HTTParty.get(url)
    starships.parsed_response
    @film_res = Array.new
    @people_res = Array.new
    @planets_res = Array.new
    @ships_res = Array.new
    films['results'].each do |film|
      if film['title'].include? text
        url = "../films/#{get_id(film['url'])}"
        name = film['title']
        tupla = Array[name, url]
        @film_res << tupla
      end
    end
    while true
      people['results'].each do |person|
        if person['name'].include? text
          url = "../characters/#{get_id(person['url'])}"
          name = person['name']
          tupla = Array[name, url]
          @people_res << tupla
        end
      end
      if !people['next']
        break
      else
        people = HTTParty.get(people['next'])
        people.parsed_response
      end
    end
    while true
      planets['results'].each do |planet|
        if planet['name'].include? text
          url = "../planets/#{get_id(planet['url'])}"
          name = planet['name']
          tupla = Array[name, url]
          @planets_res << tupla
        end
      end
      if planets['next']
        planets = HTTParty.get(planets['next'])
        planets.parsed_response
      else
        break
      end
    end
    while true
      starships['results'].each do |starship|
        if starship['name'].include? text
          url = "../ships/#{get_id(starship['url'])}"
          name = starship['name']
          tupla = Array[name, url]
          @ships_res << tupla
        end
      end
      if starships['next']
        starships = HTTParty.get(starships['next'])
        starships.parsed_response
      else
        break
      end
    end
  end
end
