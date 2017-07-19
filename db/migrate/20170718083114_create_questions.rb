class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |t|
      t.column(:question, :string)
      t.column(:done, :boolean)

      t.timestamps()
    end
  end
end
