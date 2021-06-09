     
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'pry' if development?
require 'bcrypt'

require_relative "helpers.rb"

enable :sessions

def current_user
  if session[:user_id] == nil
      return {}
  end
  
  user = run_sql("SELECT * FROM users WHERE id = #{session[:user_id]};")[0]
  return user
end

def logged_in?
  if session[:user_id] == nil
      return false
  else 
      return true
  end
end


get '/' do
  erb :index
end


##########################

get '/login' do
  erb :login_form
end 
#sign in form

post '/session' do
  records = run_sql("SELECT * FROM users WHERE email = '#{params['email']}';")

  if records.count > 0 && BCrypt::Password.new(records[0]['password_digest']) == params['password']
    logged_in_user = records[0]
    session[:user_id] = logged_in_user["id"]
    redirect '/'
  else 
    erb :login_form
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/login'
end

############################

get '/signup' do
  erb :sign_up_form
end
#sign up form

post '/user/create' do
  password_digest = BCrypt::Password.create(params["password"])

  sql = "INSERT INTO users (email, password_digest, name, current_weight, goal_weight) VALUES ($1, $2, $3, $4, $5);"
  run_sql(sql, [
  params['email'],
  password_digest,
  params['name'],
  params['current_weight'],
  params['goal_weight']
  ])

  redirect '/login'
end

############################
get '/diary' do
  erb :diary
end

get '/diary/new' do
  erb :log_new_entry_form
end

post '/diary/new' do
  redirect '/login' unless logged_in?

  sql = "INSERT INTO logs (date, exercise, weight, sets, reps, user_id) VALUES ($1, $2, $3, $4, $5, $6);"


  run_sql(sql, [
  params['date'],
  params['exercise'],
  params['weight'],
  params['sets'],
  params['reps'],
  current_user()['id']
  ])

  redirect '/diary'
end



get '/pr' do

  erb :pr
end