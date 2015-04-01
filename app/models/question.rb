class Question < ActiveRecord::Base
  belongs_to :survey
  validates :survey, :question_text, :presence => true
end

