require "rails_helper"

RSpec.describe "Api::V1::Entries", type: :request do
  let!(:current_user) { create(:user) }
  let(:community) { create(:community) }
  let(:headers) do
    {
      CONTENT_TYPE: "application/json",
      ACCEPT: "application/json",
      Authorization: "Bearer firebase_test_id_token",
    }
  end
  before { pass_authentication }

  describe "GET api/v1/entries" do
    let(:published_entry_num) { 5 }
    let(:private_entry_num) { 4 }
    before do
      create_list(:diary, published_entry_num, :published)
      create_list(:diary, private_entry_num, :private)
    end

    it "returns published entries in json format" do
      get api_v1_entries_path, headers: headers

      expect(body["data"].count).to eq(published_entry_num)
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET api/v1/entries/:id" do
    let(:diary) { create(:diary, :published) }

    it "returns published entry in json format" do
      get api_v1_entry_path(diary.entry.id), headers: headers

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST api/v1/entries" do
    let(:diary_attributes) { attributes_for(:diary) }

    context "without selected community" do
      let(:params) do
        {
          entry: {
            entryable_type: "Diary",
            status: :published,
            community_id: nil,
            entryable_attributes: diary_attributes,
          },
        }.to_json
      end

      it "returns entry without community in json format" do
        expect {
          post api_v1_entries_path, headers: headers, params: params
        }.to change { current_user.entries.count }.by(1)

        expect(body["data"]["attributes"]["community"]).to be_nil
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end

    context "with selected community" do
      let(:params) do
        {
          entry: {
            entryable_type: "Diary",
            status: :published,
            community_id: community.id,
            entryable_attributes: diary_attributes,
          },
        }.to_json
      end

      it "returns entry with community in json format" do
        expect {
          post api_v1_entries_path, headers: headers, params: params
        }.to change { current_user.entries.count }.by(1)

        expect(body["data"]["attributes"]["community"]["id"]).to eq(
          community.id,
        )

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "PATCH api/v1/entries/:id" do
    let(:diary) { create(:diary) }
    let!(:entry) { create(:entry, user: current_user, entryable: diary) }
    let(:changed_body) { "changed_body" }
    let(:params) do
      {
        entry: {
          entryable_type: "Diary",
          status: :published,
          community_id: community.id,
          entryable_attributes: {
            body: changed_body,
            mood: diary.mood,
          },
        },
      }.to_json
    end

    it "returns entry with modified content in json format" do
      patch api_v1_entry_path(entry), headers: headers, params: params

      expect(body["data"]["attributes"]["diary"]["body"]).to eq(changed_body)
      expect(body["data"]["attributes"]["community"]["id"]).to eq(community.id)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE api/v1/entries/:id" do
    let(:diary) { create(:diary) }
    let!(:entry) { create(:entry, user: current_user, entryable: diary) }

    it "delete entry successfully" do
      expect { delete api_v1_entry_path(entry), headers: headers }.to change(
        Diary,
        :count,
      ).by(-1)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
