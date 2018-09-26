require 'sinatra/base'
require './lib/questions'

class BrowserQuiz < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/questions' do
    session[:name] = params[:name]
    questions = Questions.new
    session[:question] = questions.random_question
    @question = session[:question]
    erb :questions
  end

  post '/answer' do
    @question = session[:question]
    session[:answer] = params[:answer]
    @answer = session[:answer]
    erb :answer
  end


  run! if app_file == $0
end
