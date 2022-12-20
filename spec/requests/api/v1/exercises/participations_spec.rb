require "rails_helper"

RSpec.describe "Api::V1::Exercises::Participations", type: :request do
  let(:headers) do
    { CONTENT_TYPE: "application/json", ACCEPT: "application/json" }
  end

  describe "PATCH /exercises/:exercise_id/paticipations" do
    let(:exercise) { create(:exercise) }

    it "should increament participants_number by 1" do
      previous_number = exercise.participants_number
      patch api_v1_exercise_participations_path(exercise), headers: headers
      exercise.reload

      expect(exercise.participants_number).to eq(previous_number + 1)
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
