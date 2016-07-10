# require gems
require 'sinatra'
require "sinatra/reloader" if development?
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# use localhost:4567/contact/1
get '/contact/:id' do
  this_student= db.execute("SELECT * FROM students WHERE id=?",[params[:id]])[0]
  print= "Address: #{this_student['colnew']}<br>"
  print
end

# use localhost:4567/great_job?name=Joe to test
get '/great_job' do
  given_name= params[:name]
  if given_name
    "Good Job, #{given_name}!"
  else
    'Good Job!'
  end
end

# use localhost:4567/1/plus/2 to test
get '/:num_1/plus/:num_2' do
  number_1= params[:num_1].to_i
  number_2= params[:num_2].to_i
  sum= number_1 + number_2
  "#{number_1} + #{number_2} = #{sum}"
end