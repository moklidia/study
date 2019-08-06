module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_with_mult_countries = array.select { |film| !film['country'].nil? && film['country'].split(',').count > 1 }
        films_with_rating = films_with_mult_countries.select { |film| !film['rating_kinopoisk'].nil? && film['rating_kinopoisk'] != '0' }
        kinopoisk_rating_sum = films_with_rating.map { |film| film['rating_kinopoisk'].to_f }.reduce(0) { |a, e| a + e }
        kinopoisk_rating_sum / films_with_rating.count
      end

      def chars_count(films, threshold)
        filtered = films.select { |film| film['rating_kinopoisk'].to_f >= threshold.to_f }
        film_titles = filtered.map { |film| film['name'] }
        film_titles.reduce(0) { |a, e| a + e.count('и') }
      end
    end
  end
end
