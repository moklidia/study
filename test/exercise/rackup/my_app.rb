Inatra.routes do
  get '/hello' do
    # puts env
    [200, {}, ['Hello World']]
  end
end
