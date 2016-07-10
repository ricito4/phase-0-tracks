# require gems
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  #db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

get '/students/change_student' do
	erb :change_student
end

# edit a student using information from the change_student page
post '/students/change' do
  students = db.execute("SELECT * FROM students")
  p name=params['name']
  p campus=params['campus']
  p age=params['age']
  students.each do |student|
  	if student['name']== name
  		db.execute("UPDATE students SET campus=? WHERE name=?", [campus,name])
  		db.execute("UPDATE students SET age=? WHERE name=?", [age,name])
  	end
  end


  redirect '/'
end


# add static resources