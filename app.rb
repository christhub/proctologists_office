require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/to_do')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  @tasks = Task.view()
  erb(:index)
end

post('/to_do') do
  description = params.fetch('description')
  task = Task.new(description)
  task.save()
  erb(:to_do)
end
