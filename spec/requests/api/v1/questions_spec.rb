require "rails_helper"

RSpec.describe "Api::V1::Questions", type: :request do
  let(:headers) do
    { CONTENT_TYPE: "application/json", ACCEPT: "application/json" }
  end

  describe "GET /questions" do
    let(:exercise) { create(:exercise) }
    let(:question_num) { 5 }

    before { create_list(:question, question_num, exercise: exercise) }

    it "returns questions with choices in json format" do
      get api_v1_exercise_questions_path(exercise), headers: headers

      expect(body["data"].count).to eq(question_num)
      expect(body["data"][0]["attributes"]["choices"].count).to eq 4

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    let(:exercise) { create(:exercise) }
    let(:question) { create(:question, exercise: exercise) }

    it "returns question with choices in json format" do
      get api_v1_exercise_question_path(exercise, question), headers: headers

      expect(body["data"][0]["id"].to_i).to eq(question.id)
      expect(body["data"][0]["attributes"]["choices"].count).to eq 4

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
