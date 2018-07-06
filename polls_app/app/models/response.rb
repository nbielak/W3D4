# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response, :author_cannot_respond

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  has_many(
    :sibling_responses,
    through: :question,
    source: :responses)
    # .where.not('response.id = self.id')

  has_one :poll,
    through: :question,
    source: :poll

  #private

  def respondent_already_answered?
    responses = question.responses
    p responses
    responses.any? { |response| response.user_id == self.user_id }
  end

  def respondent_owns_poll?
    question.poll.author_id == self.user_id
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:base] << 'You have already answered this question'
    end
  end

  def author_cannot_respond
    if respondent_owns_poll?
      errors[:base] << 'You cannot respond to your own poll'
    end
  end
end
