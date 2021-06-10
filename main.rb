     
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'pry' if development?
require 'bcrypt'

require_relative "helpers.rb"

enable :sessions

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

get '/profile' do
  erb :profile_view
end

get '/profile/edit' do
  erb :profile_edit_form
end

put '/profile' do 

  sql = "UPDATE users SET name = $1, email = $2, current_weight = $3, goal_weight = $4 WHERE id = $5;" 
  
  run_sql(sql, [
  params['name'],
  params['email'],
  params['current_weight'],
  params['goal_weight'],
  session[:user_id]
  ])

  trimmed_password = params['password'].strip
  if trimmed_password != "" 
    password_digest = BCrypt::Password.create(params['password'])

    sql = "UPDATE users SET password_digest = $1 WHERE id = $2;" 
    
    run_sql(sql, [
    password_digest,
    session[:user_id]
    ])
  end
  redirect '/profile'
end
############################

get '/signup' do
  erb :sign_up_form
end
#sign up form

post '/user' do
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
get '/exercises' do
  exercise_list = run_sql("SELECT * FROM exercises;")

  erb :exercises, locals: {exercise_list: exercise_list}
end

############################
get '/diary' do
  redirect '/login' unless logged_in?
  
  history = run_sql("SELECT * FROM logs WHERE user_id = #{session[:user_id]};")

  erb :diary, locals: {history: history}
end

get '/diary/new' do
  erb :log_new_entry_form
end

post '/diary' do
  redirect '/login' unless logged_in?

  sql = "INSERT INTO logs (date, exercise, weight, sets, reps, notes, user_id) VALUES ($1, $2, $3, $4, $5, $6, $7);"

  run_sql(sql, [
    params['date'],
    params['exercise'],
    params['weight'],
    params['sets'],
    params['reps'],
    params['notes'],
    current_user()['id']
  ])

  redirect '/diary'
end

delete '/diary/:id' do
  sql = "DELETE FROM logs WHERE id = $1;"

  run_sql(sql, [
    params['id']
  ])

  redirect '/diary'
end

##########################

get '/pr' do
  redirect '/login' unless logged_in?
  history = run_sql("SELECT * FROM logs WHERE user_id = #{session[:user_id]};")

  all_exercises = []
  history.each do |item|
    exercise = item['exercise']
    all_exercises.push(exercise)
  end 
  all_exercises = all_exercises.uniq.sort

  personal_records = []
  all_exercises.each do |exercise| 
    weight_record = 0
    exercise_date = ""
    reps = 0

    history.each do |item|
      if (item['exercise'] == exercise) 
        if(item['weight'].to_f > weight_record)
          weight_record = item['weight'].to_f
          exercise_date = item['date']
          reps = item['reps'].to_i
        end
      end
    end

    hash = {
      exercise_name: exercise,
      weight_record: weight_record,
      date: exercise_date,
      reps: reps
    }

    personal_records.push(hash)
  end
  erb :pr, locals: {personal_records: personal_records}
end