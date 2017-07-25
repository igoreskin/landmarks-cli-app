class Landmarks::Landmark

  attr_accessor :name, :description, :directions, :url

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  @@scraper = Landmarks::Scraper.new

  def name(url)
    @@scraper.scrape_landmark_name(@url)
  end

  def description(url)
    @@scraper.scrape_landmark_description(@url)
  end

  def directions(url)
    @@scraper.scrape_landmark_directions(@url)
  end

end
