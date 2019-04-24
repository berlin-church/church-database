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

member_yoshi = Member.create!(
  first_name: 'Yoshi',
  last_name: 'Yoshi',
  gender: 'male',
  birthday: 20.years.ago,
  email: "yoshi@bros.com",
  phone1: "4911111113",
)

member_peach = Member.create!(
  first_name: 'Peach',
  last_name: 'Peach',
  gender: 'female',
  birthday: 20.years.ago,
  email: "peach@peach.com",
  phone1: "4911111114",
)

member_toad = Member.create!(
  first_name: 'Toad',
  last_name: 'Peach',
  gender: 'male',
  birthday: 20.years.ago,
  email: "toad@peach.com",
  phone1: "4911111114",
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
  street_number: "54",
  zip_code: "11557",
  city: "berlin",
  country: "germany",
  member_id: member_luigi.id
)

address_yoshi = Address.create!(
  street: "Schutz",
  street_number: "55",
  zip_code: "11557",
  city: "berlin",
  country: "germany",
  member_id: member_yoshi.id
)

address_peach = Address.create!(
  street: "Schutz",
  street_number: "56",
  zip_code: "11557",
  city: "berlin",
  country: "germany",
  member_id: member_peach.id
)

address_toad = Address.create!(
  street: "Schutz",
  street_number: "57",
  zip_code: "11557",
  city: "berlin",
  country: "germany",
  member_id: member_toad.id
)

event_mario = Event.create!(
  name: "Mario's Group",
  description: "Mario's awesome group"
)

event_yoshi = Event.create!(
  name: "Yoshi's Group",
  description: "Yoshi's awesome group"
)

event_mario_instance = EventInstance.create!(
  event_id: event_mario.id,
  start_time: DateTime.now + 1.month,
  end_time: DateTime.now + 2.months,
  address_id: address_mario.id,
  details: "Right there after left and right",
  cost: 5,
)

event_yoshi_instance = EventInstance.create!(
  event_id: event_yoshi.id,
  start_time: DateTime.now + 1.month,
  end_time: DateTime.now + 2.months,
  address_id: address_yoshi.id,
  details: "Right there after left and right",
  cost: 5,
)

leader_mario = Leader.create!(
  member_id: member_mario.id,
  event_instance_id: event_mario_instance.id,
)

leader_yoshi = Leader.create!(
  member_id: member_yoshi.id,
  event_instance_id: event_yoshi_instance.id,
)

attendee_luigi = Attendee.create!(
  member_id: member_luigi.id,
  event_instance_id: event_mario_instance.id,
)

attendee_peach = Attendee.create!(
  member_id: member_peach.id,
  event_instance_id: event_peach_instance.id,
)

attendee_toad = Attendee.create!(
  member_id: member_toad.id,
  event_instance_id: event_toad_instance.id,
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
