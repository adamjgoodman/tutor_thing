class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end

  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end

  def self.search(query)
    @movies = Movie.all
    @movies = @movies.where(title: query[:title]) unless query[:title].blank?
    @movies = @movies.where(release_date: DateTime.new(query[:release_year].to_i)..DateTime.new(query[:release_year].to_i).end_of_year) unless query[:release_year].blank?
    @movies
  end

  def self.search_me(query)
    query
  end
end
