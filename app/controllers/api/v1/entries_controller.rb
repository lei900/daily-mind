class Api::V1::EntriesController < Api::V1::BaseController
  before_action :set_entry, only: %i[update destroy]
  skip_before_action :authenticate, only: %i[index show]

  def index
    entries =
      Entry
        .all
        .status_published
        .includes(:distortions, :community, :user, :entryable)
        .order(created_at: :desc)

    json_string = EntrySerializer.new(entries).serializable_hash.to_json
    render json: json_string
  end

  def show
    entry = Entry.find_by!(id: params[:id])
    json_string = EntrySerializer.new(entry).serializable_hash.to_json
    render json: json_string
  end

  def create
    entry = current_user.entries.new(entry_params)
    entry.add_community_and_distortions(community_id, distortion_ids)

    if entry.save
      json_string = EntrySerializer.new(entry).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, entry.errors.full_messages)
    end
  end

  def update
    @entry.add_community_and_distortions(community_id, distortion_ids)

    if @entry.update(entry_params)
      json_string = EntrySerializer.new(@entry).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, @entry.errors.full_messages)
    end
  end

  def destroy
    @entry.entryable.destroy!
    head :ok
  end

  private

  def set_entry
    @entry = current_user.entries.find(params[:id])
  end

  def entry_params
    if params[:entry][:entryable_type] == "Diary"
      params
        .require(:entry)
        .permit(
          :entryable_type,
          :status,
          entryable_attributes: %i[title body mood],
        )
        .merge(user_uid: current_user.uid)
    else
      params
        .require(:entry)
        .permit(
          :entryable_type,
          :status,
          entryable_attributes: %i[negative_thought new_thought],
        )
        .merge(user_uid: current_user.uid)
    end
  end

  def community_id
    params[:entry][:community_id]
  end

  def distortion_ids
    params[:entry][:distortion_ids]
  end
end
