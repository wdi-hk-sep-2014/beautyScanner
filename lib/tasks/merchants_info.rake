desc "Fetch merchant infos"
task :fetch_infos => :environment do
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
       
  url = "http://www.yp.com.hk/Medical-Beauty-Health-Care-Services-b/Beauty-Health/Beauty-Salons/p1/en/"   
  doc = Nokogiri::HTML(open(url))
  doc.css(".listing_div").each do |merchant|
    name = merchant.at_css(".cname").text
    address = merchant.at_css(".addr").text
    phone = merchant.at_css(".blacklink").text
    if merchant.at_css("div > .bluelink.overunder") != nil
      website = merchant.at_css("div > .bluelink.overunder").text 
    else
    end 

    puts "#{name} - #{address} - #{phone} - #{website}"
  end
end