class TodosController < ApplicationController
    #index
    get '/todos' do
        if logged_in?
            @todos = Todo.where(user_id:session[:user_id])
            current_user
            erb :"todos/index"
        else
            redirect "/login"
        end
    end

     #new
     get '/todos/new' do
        erb :'todos/new'
    end

    #edit
    get '/todos/:id/edit' do
        @todo = Todo.find_by_id(params[:id])
        erb :'todos/edit'
    end
 

    #show
    get '/todos/:id' do
        @id = params[:id]

        @todo = Todo.find_by_id(@id)
        
        if @todo
            erb :"todos/show"
        else
            redirect '/todos'
        end
    end

    post "/todos" do
        @todo = Todo.new(params)
        if @todo.save
            redirect "/todos/#{@todo.id}"
        else
            redirect '/todos'
        end
    end

    #update
    patch '/todos/:id' do
        @todo = Todo.find_by_id(params[:id])
        if @todo.update(params[:todo])
            redirect "/todos/#{@todo.id}"
        else
            redirect "/todos/#{@todo.id}/edit"
        end
    end


    #delete
    delete '/todos/:id' do
        binding.pry
        @todo = Todo.find_by_id(params[:id])

        if @todo.destroy
            redirect "/todos"
        else
            redirect "/todos/#{@todo.id}"
        end

    end

end