desc "Fetch merchant infos"
task :fetch_infos => :environment do
  require 'open-uri'
  
  list = [ {url: "Beauty-Health/Beauty-Salons/p1/en/", name: Category.create(name: 'Beauty Salon')},
           {url: "Personal-Services/Massage/p1/en/",   name: Category.create(name: 'Massage')}]
  
  list.each do |category| 
    fetch_merchants(category[:url], category[:name]) 
  end  
end

def fetch_merchants(nextUrl, category)

  prefix = "http://www.yp.com.hk/Medical-Beauty-Health-Care-Services-b/"
  nextLinkText = "Next"

  while (!nextUrl.empty?)
    doc = Nokogiri::HTML(open(prefix+nextUrl))
    doc.css(".listing_div").each do |m|
     extract_merchant(m, category)
    end
    nextUrl = doc.xpath("//a[text()='#{nextLinkText}']/@href").first.to_s
    pause 1    
  end

end

def extract_merchant(merchant, category)
  m = Merchant.new
  m.name    = extract_css(merchant, '.cname')
  m.address = extract_css(merchant, '.addr')
  m.phone   = extract_css(merchant, '.blacklink')
  m.website = extract_css(merchant, 'div > .bluelink.overunder')
  m.category = category
  m.save

  puts "[MerchantSaved][#{}] #{m.name} - #{m.address} - #{m.phone} - #{m.website}"  
end

def extract_css(merchant, cssClass)
  return (merchant.at_css(cssClass) == nil) ? nil : merchant.at_css(cssClass).text 
end