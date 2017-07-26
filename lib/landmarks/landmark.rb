class Landmarks::Landmark

  attr_accessor :name, :description, :directions, :url

  @@all = []

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(number)
    self.all[number - 1]
  end

  @@scraper = Landmarks::Scraper.new

  def self.scraper
    @@scraper
  end

  def name
    @@scraper.scrape_landmark_name(@url)
  end

  def description
    @@scraper.scrape_landmark_description(@url)
  end

  def directions
    @@scraper.scrape_landmark_directions(@url)
  end

end
