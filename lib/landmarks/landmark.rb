class Landmarks::Landmark

  attr_accessor :name, :description, :directions

  @@all = []

  def initialize
    @@all << self
  end

  def name
    Landmarks::Scraper.scrape_landmark_name(url)
  end

  def description
    Landmarks::Scraper.scrape_landmark_description(url)
  end

  def directions
    Landmarks::Scraper.scrape_landmark_description(url)
  end


end
