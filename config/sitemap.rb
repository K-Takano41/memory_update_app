# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://memory-update-app.com"

SitemapGenerator::Sitemap.create do
  add privacy_policy_path
  add terms_path
end
