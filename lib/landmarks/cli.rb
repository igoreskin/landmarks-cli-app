class Landmarks::CLI

  def call
    puts "Welcome to Top 20 St. Petersburg Architectural Landmarks!"
    scraper = Landmarks::Scraper.new
    scraper.print_the_title
    scraper.scrape_landmarks_index
    puts ""
    scraper.print_landmarks_index
    puts ""
    start
  end

  def start
    puts "Please enter the number of the landmark you would like more information on:"
    input = gets.chomp.to_i
    landmark = Landmarks::Landmark.find(input)
    puts "\t\n"
    puts landmark.name.strip.upcase
    puts "\t\n"
    puts "\t\t\t\t\t\t================== Description of the Landmark =================="
    puts "\t\n"
    puts landmark.description
    puts "\t\n"
    puts "\t\t\t\t\t\t================================================================="
    puts "\t\n"
    puts "Would you like to take a look at directions, contact information and business hours? y/n"
    answer = gets.chomp

    if answer == "y"
      puts "\t\n"
      puts "\t\t\t\t\t\t====== Directions, contact information and business hours ======"
      puts "\t\n"
      puts landmark.directions
      puts "\t\n"
      puts "\t\t\t\t\t\t================================================================="
      puts "\t\n"
      puts "Would you like to find out more about another landmark? y/n"
      response = gets.chomp

      if response == "y"
        start
      else
        puts "\t\n"
        puts "Thank you for you interest! Have a great day, and welcome again in the future!"
        puts "\t\n"
        puts "\t\t\t**************************"
        puts "\t\n"
      end

    else
      puts "\t\n"
      puts "Would you like to find out more about another landmark? y/n"
      response = gets.chomp
      if response == "y"
        start
      else
        puts "Thank you for you interest! Have a great day, and welcome again in the future!"
        puts "\t\n"
        puts "\t\t\t**************************"
        puts "\t\n"
      end
    end
  end


end
