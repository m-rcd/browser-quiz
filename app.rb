require 'sinatra/base'
require './lib/questions'

class BrowserQuiz < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get '/questions' do
  questions = Questions.all
  @question = questions.sample
  erb :questions
end

  post '/questions' do
    redirect '/questions'
  end

  post '/answer' do
    @question = session[:question]
    session[:answer] = params[:answer]
    @answer = session[:answer]
    erb :answer
  end

  run! if app_file == $0
end
