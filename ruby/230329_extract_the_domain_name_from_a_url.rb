# Extract the domain name from a URL
# https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby

# Write a function that when given a URL as a string, parses out just the domain name and returns it as a string.

# Examples URL:
# http://github.com/carbonfive/raygun  -> domain name = github
# http://www.zombie-bites.com          -> domain name = zombie-bites
# https://www.cnet.com                 -> domain name = cnet
# http://google.com                    -> domain name = google
# http://google.co.jp                  -> domain name = google
# www.xakep.ru                         -> domain name = xakep
# https://youtube.com                  -> domain name = youtube
# icann.org                            -> domain name = icann
# http://www.codewars.com/kata/        -> domain name = codewars

def domain_name(url)
  url.match(/^(.*\/\/|www.)*(?<domain>[\w-]+)/)[:domain]
end
