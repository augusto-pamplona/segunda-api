class TesteTokenAuthentication < Faraday::Middleware
  def call(env)
    env[:request_headers]['Authorization'] = "Token token=#{ENV['TESTE_API_TOKEN']}"
    @app.call(env)
  end
end
