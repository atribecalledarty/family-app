class SessionsController < ApplicationController
    def new 

    end

    def create
        binding.pry
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:notice] = "Invalid email and password combination"
            render 'sessions/new'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end


end