def subdomain_visits(cpdomains)
  domain_visits = {}
  cpdomains.each_with_index do |count_domain, index|
    count, domain = count_domain.split(' ')
    domain_parts = domain.split(".")
    (domain_parts.size).times do
      subdomain = domain_parts.join('.')
      domain_parts.shift
      domain_visits[subdomain] ||= 0
      domain_visits[subdomain] += count.to_i
    end
  end
  domain_visits.map do |key, value|
    "#{value} #{key}"
  end
end

# [
#   "901 mail.com",
#   "50 yahoo.com",
#   "900 google.mail.com",
#   "5 wiki.org",
#   "5 org",
#   "1 intel.mail.com",
#   "951 com"
# ]
p subdomain_visits ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
