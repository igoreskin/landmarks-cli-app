class Landmarks::Landmark

  attr_accessor :name, :description, :directions

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  @@scraper = Landmarks::Scraper.new

  def name(url)
    @@scraper.scrape_landmark_name(url)
  end

  def description(url)
    @@scraperr.scrape_landmark_description(url)
  end

  def directions(url)
    @@scraper.scrape_landmark_directions(url)
  end

end
