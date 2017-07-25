require 'pry'
require 'nokogiri'
require 'open-uri'

class Landmarks::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.saint-petersburg.com/top-20-attractions/"))
  end

  def scrape_landmarks_index
    self.get_page.css("h2").each { |el| Landmarks::Landmark.new(el.text, "http://www.saint-petersburg.com"+el.css("a").attr("href").text) }
  end


  def print_the_title
    puts self.get_page.css("h1").text
  end

  def print_landmarks_index
    puts Landmarks::Landmark.all.each.with_index { |el, index| puts "#{index+1}.", "\n\n#{el.name}".strip }
    nil
  end

  def get_landmark_page(url)
    Nokogiri::HTML(open(url))
  end

  def scrape_landmark_name(url)
  	puts self.get_landmark_page(url).css("h1").text
  end

  def scrape_landmark_description(url)
    puts self.get_landmark_page(url).css("p").text
  end

  def scrape_landmark_directions(url)
    puts self.get_landmark_page(url).css(".prop-list").text
  end


end
