# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
users = User.create([{username: 'User1'}, {username: 'User2'}, {username: 'User3'}, {username: 'User4'}])
Poll.destroy_all
polls = Poll.create([{title: 'Poll1', author_id: User.first.id}, {title: 'Poll2', author_id: User.first.id}])

Question.destroy_all
questions = Question.create([
    { poll_id: Poll.first.id, text: 'Question1?' },
    { poll_id: Poll.first.id, text: 'Question2?' },
    { poll_id: Poll.second.id, text: 'Question1?' },
    { poll_id: Poll.second.id, text: 'Question2?' }
  ])

AnswerChoice.destroy_all
answer_choices = AnswerChoice.create([
    { question_id: Question.first.id, text: 'Answer1' },
    { question_id: Question.first.id, text: 'Answer2' },
    { question_id: Question.second.id, text: 'Answer1' },
    { question_id: Question.second.id, text: 'Answer2' },
    { question_id: Question.third.id, text: 'Answer1' },
    { question_id: Question.third.id, text: 'Answer2' },
    { question_id: Question.fourth.id, text: 'Answer1' },
    { question_id: Question.fourth.id, text: 'Answer2' }
  ])

Response.destroy_all
responses = Response.create([
    { user_id: User.second.id, answer_choice_id: AnswerChoice.first.id },
    { user_id: User.second.id, answer_choice_id: AnswerChoice.second.id },
    { user_id: User.third.id, answer_choice_id: AnswerChoice.fifth.id },
    { user_id: User.third.id, answer_choice_id: AnswerChoice.last.id }
  ])
