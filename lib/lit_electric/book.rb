class Book
  attr_accessor :title, :url, :description

  @@all = []

  def initialize(title = nil, url = nil, description = nil)
    @title = title
    @url = url
    @description = description
  end

  def self.books
    all.each.with_index(1) {|value, index| puts "#{index}: #{value.title}"}
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(title = nil, url = nil, description = nil)
    book = self.new(title, url, description)
    book.save
    book
  end

  def self.create_from_scraper
    Scraper.scrape_from_url
    urls = Scraper.urls
    authors = Scraper.title_and_authors
    descriptions = Scraper.description
    authors.each_with_index do |title,i|
    self.create(title = title, url = urls[i], description = descriptions[i])
    end
  end

  end
