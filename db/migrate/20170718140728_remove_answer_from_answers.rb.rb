class RemoveAnswerFromAnswers.rb < ActiveRecord::Migration[5.1]
  def change
    remove_column(:answers, :answer, :string)
  end
end
