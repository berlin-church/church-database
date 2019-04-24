# frozen_string_literal: true

AdminUser.create!(email: 'admin1@example.com', password: 'password', password_confirmation: 'password', role:"admin") if Rails.env.development?
AdminUser.create!(email: 'a@a.com', password: 'aaaaaa', password_confirmation: 'aaaaaa', role:"admin") if Rails.env.development?

mario_admin = AdminUser.create!(email: 'm@b.com', password: 'mmmmmm', password_confirmation: 'mmmmmm', role:"leader") if Rails.env.development?

member_mario = Member.create!(
  first_name: 'Mario',
  last_name: 'Bros',
  gender: 'male',
  birthday: 35.years.ago,
  email: "mario@bros.com",
  phone1: "4911111111",
  admin_user: mario_admin,
)

member_luigi = Member.create!(
  first_name: 'Luigi',
  last_name: 'Bros',
  gender: 'male',
  birthday: 35.years.ago,
  email: "luigi@bros.com",
  phone1: "4911111112",
)

address_mario = Address.create!(
  street: "Schutz",
  street_number: "53",
  zip_code: "11557",
  city: "berlin",
  country: "germany",
  member_id: member_mario.id
)

address_luigi = Address.create!(
  street: "Schutz",
  street_number: "53",
  zip_code: "11557",
  city: "berlin",
  country: "germany",
  member_id: member_luigi.id
)

event = Event.create!(
  name: "Group",
  description: "Awesome group"
)

event_instance = EventInstance.create!(
  event_id: event.id,
  start_time: DateTime.now + 1.month,
  end_time: DateTime.now + 2.months,
  address_id: address_mario.id,
  details: "Right there after left and right",
  cost: 5,
)

leader = Leader.create!(
  member_id: member_mario.id,
  event_instance_id: event_instance.id,
)

attendee = Attendee.create!(
  member_id: member_luigi.id,
  event_instance_id: event_instance.id,
)

questionnaire = Questionnaire.create!(
  name: "Get to know",
  position: 0
)

question_group = QuestionGroup.create!(
  questionnaire_id: questionnaire.id,
  title: "General",
  subtitle: "General question about you",
  position: 0
)

question = Question.create!(
  question_group_id: question_group.id,
  title: "Are you insane?",
  position: 0,
  answer_type: Question.answer_types[:single]
)

QuestionOption.create!(
  question_id: question.id,
  title: "Yes",
  position: 0
)

QuestionOption.create!(
  question_id: question.id,
  title: "No",
  position: 1
)
