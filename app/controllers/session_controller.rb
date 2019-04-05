class SessionController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        #make sure email exists in db
        user = User.find_by(email:params[:email])
        #check if password is valid
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/todos"
        else
            redirect "/login"
        end
        #redirect properly
    end
end