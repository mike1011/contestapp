# # config/initializers/pdfkit.rb
# PDFKit.configure do |config|
#   config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
#   # config.root_url = "http://staging.myapp.com" # Use only if your external hostname is unavailable on the server.
# end

# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
 config.default_options = {
    :encoding=>"UTF-8",
    :page_size=>"A4",
    :margin_top=>"0.25in",
    :margin_right=>"0.1in",
    :margin_bottom=>"0.25in",
    :margin_left=>"0.1in",
    :disable_smart_shrinking=> false
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost"
  config.verbose = false
end