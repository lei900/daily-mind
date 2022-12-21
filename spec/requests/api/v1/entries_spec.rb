require "rails_helper"

RSpec.describe "Api::V1::Entries", type: :request do
  let!(:current_user) { create(:user) }
  let(:community) { create(:community) }
  let(:distortion_1) { create(:distortion) }
  let(:distortion_2) { create(:distortion) }
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
      create_list(:thought_analysis, published_entry_num, :published)
      create_list(:diary, private_entry_num, :private)
      create_list(:thought_analysis, published_entry_num, :draft)
    end

    it "returns published entries in json format" do
      get api_v1_entries_path, headers: headers

      expect(body["data"].count).to eq(published_entry_num * 2)
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET api/v1/entries/:id" do
    let(:diary) { create(:diary, :published) }
    let(:thought_analysis) { create(:thought_analysis, :published) }

    it "returns published diary entry in json format" do
      get api_v1_entry_path(diary.entry.id), headers: headers

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end

    it "returns published though_analysis entry in json format" do
      get api_v1_entry_path(thought_analysis.entry.id), headers: headers

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST api/v1/entries" do
    let(:diary_attributes) { attributes_for(:diary) }
    let(:analysis_attributes) { attributes_for(:thought_analysis) }

    context "without selected community" do
      let(:diary_params) do
        {
          entry: {
            entryable_type: "Diary",
            status: :published,
            community_id: nil,
            entryable_attributes: diary_attributes,
          },
        }.to_json
      end
      let(:thought_analysis_params) do
        {
          entry: {
            entryable_type: "ThoughtAnalysis",
            status: :published,
            community_id: nil,
            distortion_ids: [distortion_1.id, distortion_2.id],
            entryable_attributes: analysis_attributes,
          },
        }.to_json
      end

      it "returns diary entry without community in json format" do
        expect {
          post api_v1_entries_path, headers: headers, params: diary_params
        }.to change { current_user.entries.count }.by(1)

        expect(body["data"]["attributes"]["community"]).to be_nil
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end

      it "returns analysis entry without community in json format" do
        expect {
          post api_v1_entries_path,
               headers: headers,
               params: thought_analysis_params
        }.to change { current_user.entries.count }.by(1)

        expect(body["data"]["attributes"]["community"]).to be_nil
        expect(body["data"]["attributes"]["distortions"].count).to eq(2)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end

    context "with selected community" do
      let(:diary_params) do
        {
          entry: {
            entryable_type: "Diary",
            status: :published,
            community_id: community.id,
            entryable_attributes: diary_attributes,
          },
        }.to_json
      end
      let(:thought_analysis_params) do
        {
          entry: {
            entryable_type: "ThoughtAnalysis",
            status: :published,
            community_id: community.id,
            distortion_ids: [distortion_1.id, distortion_2.id],
            entryable_attributes: analysis_attributes,
          },
        }.to_json
      end

      it "returns diary entry with community in json format" do
        expect {
          post api_v1_entries_path, headers: headers, params: diary_params
        }.to change { current_user.entries.count }.by(1)

        expect(body["data"]["attributes"]["community"]["id"]).to eq(
          community.id,
        )

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end

      it "returns analysis entry with community in json format" do
        expect {
          post api_v1_entries_path,
               headers: headers,
               params: thought_analysis_params
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
    let(:thought_analysis) { create(:thought_analysis) }
    let!(:diary_entry) { create(:entry, user: current_user, entryable: diary) }
    let!(:analysis_entry) do
      create(:entry, user: current_user, entryable: thought_analysis)
    end
    let(:changed_content) { "changed_content" }
    let(:diary_params) do
      {
        entry: {
          entryable_type: "Diary",
          status: :published,
          community_id: community.id,
          entryable_attributes: {
            body: changed_content,
            mood: diary.mood,
          },
        },
      }.to_json
    end
    let(:thought_analysis_params) do
      {
        entry: {
          entryable_type: "ThoughtAnalysis",
          status: :published,
          community_id: community.id,
          distortion_ids: [distortion_1.id, distortion_2.id],
          entryable_attributes: {
            negative_thought: changed_content,
            new_thought: thought_analysis.new_thought,
          },
        },
      }.to_json
    end

    it "returns diary entry with modified content in json format" do
      patch api_v1_entry_path(diary_entry),
            headers: headers,
            params: diary_params

      expect(body["data"]["attributes"]["diary"]["body"]).to eq(changed_content)
      expect(body["data"]["attributes"]["community"]["id"]).to eq(community.id)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end

    it "returns analysis entry with modified content in json format" do
      patch api_v1_entry_path(analysis_entry),
            headers: headers,
            params: thought_analysis_params

      expect(
        body["data"]["attributes"]["thoughtAnalysis"]["negative_thought"],
      ).to eq(changed_content)
      expect(body["data"]["attributes"]["community"]["id"]).to eq(community.id)
      expect(body["data"]["attributes"]["distortions"].count).to eq(2)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE api/v1/entries/:id" do
    let(:diary) { create(:diary) }
    let(:thought_analysis) { create(:thought_analysis) }
    let!(:diary_entry) { create(:entry, user: current_user, entryable: diary) }
    let!(:analysis_entry) do
      create(:entry, user: current_user, entryable: thought_analysis)
    end

    it "delete diary entry successfully" do
      expect {
        delete api_v1_entry_path(diary_entry), headers: headers
      }.to change(Diary, :count).by(-1)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end

    it "delete analysis entry successfully" do
      expect {
        delete api_v1_entry_path(analysis_entry), headers: headers
      }.to change(ThoughtAnalysis, :count).by(-1)

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
