class PaginationHeaderParser < Her::Middleware::DefaultParseJSON
  def parse(env)
    # byebug
    if env[:response_headers][:content_type] == 'application/pdf'
      json = { data: env[:body] }
      pagination = {}
      errors = {}
      metadata = {}
    else
      json = parse_json(env[:body])
      pagination = parse_json(env[:response_headers]['X-Pagination']) || {}
      errors = json.delete(:errors) || {}
      metadata = json.delete(:metadata) || {}
    end

    {
      data: json[:data], # o meu objeto não está vindo com chave data
      errors: errors,
      metadata: {
        pagination: pagination,
        additional_metadata: metadata
      }
    }
  end

  def on_complete(env)
    # byebug
    env[:body] = case env[:status]
                 when 204
                   { data: [] }
                 else
                   parse(env)
                 end
  end
end
