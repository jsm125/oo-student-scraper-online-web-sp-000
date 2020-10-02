require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

<<<<<<< HEAD
  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))

    students = []
    
    page.css("div.student-card").each do |student|
      student_details = {}
      student_details[:name] = student.css("h4.student-name").text
      student_details[:location] = student.css("p.student-location").text
      profile_path = student.css("a").attribute("href").value
      student_details[:profile_url] = profile_path
      students << student_details
    end
    students
  end
=======
  # def self.scrape_index_page(index_url)
  #   html = open(index_url)
  #   page = Nokogiri::HTML(html)
  #   students = []
    
  #   page.css("div.student-card").each do |student|
  #     student_details = {}
  #     student_details[:name] = student.css("h4.student-name").text
  #     student_details[:location] = student.css("p.student-location").text
  #     profile_path = student.css("a").attribute("href").value
  #     student_details[:profile_url] = 'fixtures/student-site/' + profile_path
  #     students << student_details
  #   end
  #   students 
  # end

	  def self.scrape_index_page(index_url)

    students_hash = []
    html = Nokogiri::HTML(open(index_url))
    html.css("roster-cards-container").collect do |student|
      hash = {
        name: student.css("h4.student-name").text,
        location: student.css("p.student-location").text,
        profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
      }
      students_hash << hash
    end
    students_hash
  end	 
>>>>>>> bc045cd66b1bab714b6a69baeb6b1aaec0c7e1ad

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))

    student = {}

    links = page.css("div.social-icon-container a").collect{|icon| icon.attribute("href").value}
    links.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      elsif link.include?(".com")
        student[:blog] = link
      end
    end
    student[:profile_quote] = page.css(".profile-quote").text
    student[:bio] = page.css("div.description-holder p").text
    student
  end

<<<<<<< HEAD
end
=======

# _____________________________________________________________

# require_relative './course.rb'

# class Scraper
  
#   def get_page
    
#     doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
#     # doc.css(".post").each do |post|
#     #   course = Course.new 
#     #   course.title = post.css("h2").text 
#     #   course.schedule = post.css(".date").text
#     #   course.description = post.css("p").text 
#     # end
    
#   end
  
#   def get_courses
#     self.get_page.css(".post")
#   end
  
#   def make_courses
#     self.get_courses.each do |post|
#       course = Course.new
#       course.title = post.css("h2").text
#       course.schedule = post.css(".date").text 
#       course.description = post.css("p").text 
#     end
#   end
  
#   def print_courses
#     self.make_courses
#     Course.all.each do |course|
#       if course.title && course.title != ""
#         puts "Title: #{course.title}"
#         puts "  Schedule: #{course.schedule}"
#         puts "  Description: #{course.description}"
#       end
#     end
#   end
  
# end

#     Scraper.new.print_courses

>>>>>>> bc045cd66b1bab714b6a69baeb6b1aaec0c7e1ad
