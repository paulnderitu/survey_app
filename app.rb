require("bundler/setup")
Bundler.require(:default)
also_reload("lib/**/*.rb")

Dir[File.dirname(_FILE_) + '/lib*.rb'].each { |file| require file }


  get("/") do
    @questions = Question.all()
    @answers = Answer.all()
    erb(:index)
  end

  post("/questions") do
    question = params.fetch("question")
    question = Question.new({:question => question, :id => nil})
    question.save()
    @questions = Question.all()
    @answers = Answer.all()
    erb(:index)
  end

get("/questions/:id")do
  @questions = Question.find(params.fetch("id").to_i())
  erb(:question)
end

post("/answers") do
    answer = params.fetch("answer")
    question_id = params.fetch("question_id").to_i()
    @question = Question.find(question_id)
    @answer = Answer.new({:answer => answer, :done => false})
    if @answer.save()
      erb(:success)
    else
    erb(:errors)
    end
  end

  get('/answers/:id/edit') do
      @answer = Answer.find(params.fetch("id").to_i())
      erb(:answer_edit)
    end

    patch("/answers/:id") do
      answer = params.fetch("answer")
      @answer = Answer.find(params.fetch("id").to_i())
      @answer.update({:answer => answer})
      @answers = Answer.all()
      @question = Question.find(params.fetch("id").to_i())
      erb(:index)
    end

  get("/questions/:id/edit")do
    @question = Question.find(params.fetch("id").to_i())
    erb(:question_edit)
  end

  patch("/questions/:id")do
    question = params.fetch("question")
    @question = Question.find(params.fetch("id").to_i())
    @question.update({:question => question})
    erb(:question)
  end

  delete("/questions/:id") do
      @question = Question.find(params.fetch("id").to_i())
      @question.delete()
      @questions = Question.all()
      erb(:index)
    end
