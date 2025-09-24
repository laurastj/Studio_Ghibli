require 'pg'

class Database
  def initialize
    @conn = PG.connect(
      dbname: 'api_sg_ruby',
      user: 'postgres',
      password: 'senha',
      host: 'localhost'
    )
  end

  def insert_film(title, director, release_date)
    @conn.exec_params(
      "INSERT INTO studio_ghibli (title, director, release_date) VALUES ($1, $2, $3)",
      [title, director, release_date]
    )
  end

  def all_films
    result = @conn.exec("SELECT * FROM studio_ghibli")
    result.each do |row|
      puts "🎬 #{row['title']} (#{row['release_date']}) | Dir: #{row['director']}"
    end
  end
end
