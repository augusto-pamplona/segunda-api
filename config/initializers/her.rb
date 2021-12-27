require "#{Rails.root}/lib/teste_token_authentication"
require "#{Rails.root}/lib/her_collection"
require "#{Rails.root}/lib/pagination_header_parser"

Her::API.setup url: "http://localhost:4000" do |c|
  # Request
  c.use TesteTokenAuthentication
  c.use Faraday::Request::UrlEncoded

  # Response
  # c.use Her::Middleware::DefaultParseJSON
  c.use PaginationHeaderParser

  # Adapter
  c.adapter :net_http
end
