get '/' do
  erb :welcome
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  @user = User.find_by_name(params[:user][:name])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    puts "Login error"
    redirect "/login"
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  new_user = User.create(params[:user])

  if new_user.save
    session[:user_id] = new_user.id
    redirect "/user/#{new_user.id}"
  else
    puts "Signup error"
    redirect '/signup'
  end
end

get "/logout" do
  session.clear
  redirect "/"
end
