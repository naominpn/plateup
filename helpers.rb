require 'pg'

def run_sql(sql, params = []) 
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'plateup'})
    res = db.exec_params(sql, params)
    db.close
  
    return res
end

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