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
<<<<<<< HEAD
    Scraper.scrape_from_url
    urls = Scraper.urls
    authors = Scraper.title_and_authors
    descriptions = Scraper.description
    authors.each_with_index do |title,i|
    self.create(title = title, url = urls[i], description = descriptions[i])
=======

    # Scraper.scrape_from_url[0].each{|b| b[:title].each_with_index{|t,i| self.create(t)}}
     Scraper.scrape_from_url[0].each do |k,v|
       self.create(v)
        # b = self.new
        # if k == :title
        #   v.each{|val| b.title = val}
        # elsif
        #   v.each{|val| b.url = val}
        # end
        # b.save
        # b

    titles = Scraper.titles
    urls = Scraper.urls
    titles.each_with_index do |title,i|
        self.create(title = title, url = urls[i])
>>>>>>> bb3f263ad7db0ecb8dbee16febbdcc8eddfe3111
    end
  end

  end
