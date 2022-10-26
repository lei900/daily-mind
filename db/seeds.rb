# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

exercise_1 =
  Exercise.create!(
    title: "練習_1",
    short_description: "紹介_1",
    detailed_description: "詳細_1",
    image: "string",
    conclusion: "結論_1",
    slug: "exercise-emotion",
  )

exercise_2 =
  Exercise.create!(
    title: "練習_2",
    short_description: "紹介_2",
    detailed_description: "詳細_2",
    image: "string",
    conclusion: "結論_2",
    slug: "exercise-situation",
  )

question_1_1 =
  exercise_1.questions.create!(body: "質問内容_1", result_interpretation: "結論説明_1")

question_1_2 =
  exercise_1.questions.create!(body: "質問内容_2", result_interpretation: "結論説明_2")

question_2 =
  Question.create!(
    body: "質問内容_2",
    result_interpretation: "結論説明_2",
    exercise_id: exercise_2.id,
  )

4.times do
  Choice.create!(
    content: "選択肢_1",
    is_correct_choice: [true, false].sample,
    question_id: question_1_1.id,
  )
end

4.times do
  Choice.create!(
    content: "選択肢_2",
    is_correct_choice: [true, false].sample,
    question_id: question_1_2.id,
  )
end
