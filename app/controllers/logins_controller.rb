class LoginsController < ApplicationController

  def welcome
    @client_id = ENV['CLIENT_ID']
  end

  def callback
    puts params
    client = Octokit::Client.new :client_id => ENV['CLIENT_ID'], :client_secret => ENV['CLIENT_SECRET']
    access_code = client.exchange_code_for_token(params[:code])
    session['token'] = access_code
    redirect_to repos_path
  end

  def repos
    access_code = session['token']
    puts "------------------"
    puts access_code[0][1]
    client = Octokit::Client.new :access_token => access_code[0][1]
    puts "################################"
    @user = client.user
    puts @user.name
    @repos = client.repos
    puts @repos
  end
end
