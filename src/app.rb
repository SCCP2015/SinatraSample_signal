# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'data_mapper'
require_relative 'word'
require 'erb'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://vagrant:vagrant@localhost/myapp')

# Sinatra Main controller
class MainApp < Sinatra::Base
  # Sinatra Auto Reload
  configure :development do
    register Sinatra::Reloader
  end
  #  get '/' do
  #    words = Word.all.map do |w|
  #      w.id.to_s + ": #{w.msg}"
  #    end
  #    words.join(', ')
  #  end
  #  get '/words/:id' do
  #    id = params[:id]
  #    word = Word.get(id)
  #    if word.nil?
  #      "Record of id: #{id} is not found."
  #    else
  #      word.id.to_s + ": #{word.msg}"
  #    end
  #  end
  get '/' do
    @obj = Word.all
    erb:index
  end
  post '/' do
    Word.create(msg: params[:ex_text])
    @obj = Word.all
    @obj.class.to_s
    erb :index
  end
  # post '/words' do
  #  word = Word.create(msg: request.body.gets)
  #  word.id.to_s
  # end
  #  put '/words/:id' do
  #    id = params[:id]
  #    word = Word.get(id)
  #    if word.nil?
  #      'false'
  #    else
  #      word.update(msg: request.body.gets)
  #      'true'
  #    end
  #  end
  #  delete '/words/:id' do
  #    id = params[:id]
  #    word = Word.get(id)
  #    if word.nil?
  #      'false'
  #    else
  #      word.destroy.to_s
  #    end
  #  end
end
