# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://memory-update-app.com"

SitemapGenerator::Sitemap.create do
  add '/top'
  add root_path
end
