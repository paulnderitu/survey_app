ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(_FILE_) + '/../lib/*.rb'].each { |file| require file}


  RSpec.configure do |config|
    config.after(:each) do
      Answer.all().each() do |answer|
        answer.destroy()
      Question.all().each() do |question|
        question.destroy()
      end
    end
  end
end
