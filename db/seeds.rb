# frozen_string_literal: true
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

member = Member.create(
  first_name: 'Mario',
  last_name: 'Bros',
  gender: 'male',
  birthday: 35.years.ago,
  email: "mario@bros.com",
  phone1: "4911111111",
  password: "123456",
  password_confirmation: "123456"
)

address = Address.create(
  street: "Schutz",
  street_number: "53",
  zip_code: "11557",
  city: "berlin",
  country: "germany",
  member_id: member.id
)

event = Event.create(
  name: "Group",
  description: "Awesome group"
)

event_instance = EventInstance.create(
  start_time: DateTime.now + 1.month,
  end_time: DateTime.now + 2.months,
  address_id: address.id,
  details: "Right there after left and right",
  cost: 5,
)

questionnaire = Questionnaire.create(
  event_instance_id: event_instance.id,
  name: "Get to know",
  position: 0
)

question_group = QuestionGroup.create(
  questionnaire_id: questionnaire.id,
  title: "General",
  subtitle: "General question about you",
  position: 0
)

question = Question.create(
  question_group_id: question_group.id,
  title: "Are you insane?",
  position: 0,
  answer_type: Question.answer_types[:single]
)

QuestionOption.create(
  question_id: question.id,
  title: "Yes",
  position: 0
)

QuestionOption.create(
  question_id: question.id,
  title: "No",
  position: 1
)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?