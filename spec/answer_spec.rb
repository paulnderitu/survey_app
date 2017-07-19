require('spec_helper')

describe(Answer) do

  it("ensures the length of an answer is not more than 20 characters") do
    answer = Answer.new({:answer => "a".*(21)})
    expect(answer.save()).to(eq(false))
  end
  describe("#question") do

    it("validates presence of answer") do
      answer = Answer.new({:answer => ""})
      expect(answer.save()).to(eq(false))
    end

    it("tells which question an answer belongs to") do
      test_question = Question.create({:question => "question"})
      test_answer = Answer.create({:answer => "answer", :question_id => test_question.id})
      expect(test_answer.question()).to(eq(test_question))
    end
  end

  it("converts the first character of a word to uppercase") do
     answer = Answer.create({:answer => "milk"})
     expect(answer.answer()).to(eq("Milk"))
   end

end
