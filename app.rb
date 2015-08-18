require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/to_do')
require('./lib/list')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  @task = Task.all()
  erb(:index)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get("/list/new/") do
  erb(:list_form)
end

post('/list') do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end
