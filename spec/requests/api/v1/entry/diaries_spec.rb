require "rails_helper"

RSpec.describe "Api::V1::Entry::Diaries", type: :request do
  let!(:current_user) { create(:user) }
  let!(:community) { create(:community) }
  let(:headers) do
    {
      CONTENT_TYPE: "application/json",
      ACCEPT: "application/json",
      Authorization: "Bearer firebase_test_id_token",
    }
  end
  before { pass_authentication }

  describe "POST api/v1/diaries" do
    let(:diary_attributes) { attributes_for(:diary) }
    let(:params) do
      {
        entry: {
          entryable_type: "Diary",
          community_id: community.id,
          status: 0,
          entryable_attributes: diary_attributes,
        },
      }.to_json
    end

    it "returns diary in json format" do
      expect {
        post api_v1_diaries_path, headers: headers, params: params
      }.to change { current_user.entries.count }.by(1)

      expect(body["data"]["type"]).to eq("diary")
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH api/v1/diaries/:id" do
    let(:diary) { create(:diary) }
    let(:entry) do
      create(:entry, user: current_user, community: community, entryable: diary)
    end
    let(:changed_body) { "changed_body" }
    let(:params) do
      {
        entry: {
          entryable_type: "Diary",
          community_id: community.id,
          entryable_attributes: {
            body: changed_body,
            mood: diary.mood,
          },
        },
      }.to_json
    end

    it "returns diary in json format" do
      patch api_v1_diary_path(diary, entry_id: entry.id),
            headers: headers,
            params: params

      expect(body["data"]["attributes"]["body"]).to eq(changed_body)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE api/v1/diaries/:id" do
    let(:diary) { create(:diary) }
    let!(:entry) do
      create(:entry, user: current_user, community: community, entryable: diary)
    end

    it "delete diary successfully" do
      expect {
        delete api_v1_diary_path(diary, entry_id: entry.id), headers: headers
      }.to change(Diary, :count).by(-1)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
