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

=begin
  def print_landmarks_index
    list = []
    Landmarks::Landmark.all.each { |el| list << "#{el.name}".gsub(/^\s*/, '') }
    list
    list.each.with_index { |el, index| puts "#{el}".strip }
    nil
  end


  def print_landmarks_index
    Landmarks::Landmark.all.each.with_index { |el, index| puts "#{index+1}.".strip, "#{el.name}".strip } #.gsub("u00A0", "\t") }
    nil
  end
=end

  def print_landmarks_index
    Landmarks::Landmark.all.each.with_index { |el, index| puts "#{index+1}. #{el.name}".gsub("\r\n", "") }
    nil
  end



  def print_landmarks_urls
    Landmarks::Landmark.all.each.with_index { |el, index| puts "#{index+1}.\t#{el.url}" }
    nil
  end


def get_landmark_page(url)
    Nokogiri::HTML(open(url))
  end

  def scrape_landmark_name(url)
  	self.get_landmark_page(url).css("h1").text
  end

  def scrape_landmark_description(url)
    self.get_landmark_page(url).css("p").text
  end

  def scrape_landmark_directions(url)
    self.get_landmark_page(url).css(".prop-list").text
  end


end
