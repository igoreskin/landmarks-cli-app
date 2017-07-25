require 'pry'
require 'nokogiri'
require 'open-uri'

class Landmarks::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.saint-petersburg.com/top-20-attractions/"))
  end

  def scrape_landmarks_index
    # landmarks_index = []
    self.get_page.css("h2").each { |el| Landmarks::Landmark.new(el.text, el.css("a").attr("href").text) }
    # landmarks_index
  end

# el.css.attr("href").text

  def print_the_title
    puts self.get_page.css("h1").text
  end

  def print_landmarks_index
    puts Landmarks::Landmark.all.each.with_index { |el, index| puts "#{index+1}.\t #{el}" }
    #scrape_landmarks_index.each.with_index { |el, index| puts "#{index+1}.\t #{el}" }
    #nil
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
