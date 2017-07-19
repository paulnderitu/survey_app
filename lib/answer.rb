class Answer < ActiveRecord::Base
  belongs_to(:question)

  validates(:answer, {:presence => true, :length => {:maximum => 20}})

  before_save(:upcase_firstletteranswer)

  # scope(:not_done, -> do
  #     where({:done => false})
  #   end)

private
    define_method(:upcase_firstletteranswer) do
      self.answer=answer.capitalize
    end

end
