require 'httparty'
require_relative 'db'

class StudioGhibliAPI
  include HTTParty
  base_uri "https://ghibliapi.vercel.app"

  def get_films
    self.class.get("/films")
  end
end

class MeuApp
  def initialize
    @db = Database.new
    @api = StudioGhibliAPI.new
  end

  def consumir_e_salvar
    response = @api.get_films
    films = response.parsed_response

    films.each do |film|
      @db.insert_film(film["title"], film["director"], film["release_date"])
    end
    puts "✅ Filmes do Studio Ghibli salvos no banco!"
  end

  def listar_registros
    @db.all_films
  end
end

app = MeuApp.new
app.consumir_e_salvar
app.listar_registros
