require_relative "../lit_electric/scraper.rb"
class Cli

  def call
    Book.create_from_scraper
    # Book.url
    lines
    puts "  Welcome to the 2019 list of #{Book.all.length.to_i} books by women and nonbinary people of color you've gotta read"
    lines
    list_books
    more_info
    good_bye
  end

  def lines
    puts "------------------------------------------------------------------------------------"
  end

  def list_books
    puts "**  Books in order of their release date  **"
    lines
    Book.books
    lines
  end

  def more_info
    input = nil
    until input == "bye"
      puts "Enter the number of the book you would like more information on (1-#{Book.all.length.to_i})"
      puts "OR type 'list' to review the list OR type 'bye' to exit!"
      input = gets.strip.downcase
      if (1..Book.all.length.to_i) === input.to_i
        lines
        puts "BOOK ##{input} GREAT CHOICE! Here's more information on that book:"
        puts "AUTHOR, BOOK TITLE: #{Book.all[input.to_i-1].title}."
        puts " "
        puts "BOOK DESCRIPTION: #{Book.all[input.to_i-1].description}"
        puts " "
        if !!Book.all[input.to_i-1].url
          puts "BUY IT HERE: #{Book.all[input.to_i-1].url}"
        else
          puts "BUY IT HERE: Link not available"
        end
        lines
      elsif input == "list"
        list_books
      elsif input == "bye"
        " "
      else
        puts  "HMMMM... Please type 'list' for the list or 'bye' to exit"
      end
    end
  end

  def good_bye
      puts "See you for your next book!"
  end

end
