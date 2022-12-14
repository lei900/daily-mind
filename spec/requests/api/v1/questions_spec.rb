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

  describe "GET exercises/:id/questions/:qid" do
    let(:exercise) { create(:exercise) }
    let(:question) { create(:question, exercise: exercise) }

    it "returns question with choices in json format" do
      get "/api/v1/exercises/#{exercise.id}/questions/#{question.qid}",
          headers: headers

      expect(body["data"][0]["attributes"]["qid"].to_i).to eq(question.qid)
      expect(body["data"][0]["attributes"]["choices"].count).to eq 4

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
