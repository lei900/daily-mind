RSpec.describe "Api::V1::Exercises", type: :request do
  let(:headers) do
    { CONTENT_TYPE: "application/json", ACCEPT: "application/json" }
  end

  describe "GET /exercises" do
    let(:exercise_num) { 10 }

    before { create_list(:exercise, exercise_num) }

    it "returns exercises in json format" do
      get api_v1_exercises_path, headers: headers

      expect(body["data"].count).to eq(exercise_num)
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /exercises/:id" do
    let!(:exercise) { create(:exercise) }

    it "returns exercise in json format" do
      get api_v1_exercise_path(exercise), headers: headers

      expect(body["data"]["id"].to_i).to eq(exercise.id)
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
