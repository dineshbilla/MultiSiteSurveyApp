class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :survey
      t.string :question_text
      t.string :question_type
      t.text :answer_options
      t.timestamps null: false
    end
  end
end
