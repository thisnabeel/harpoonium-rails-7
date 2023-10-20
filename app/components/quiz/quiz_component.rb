# frozen_string_literal: true

class QuizComponent < ViewComponent::Base
  def initialize(quiz:)
    @quiz = quiz
  end

end
