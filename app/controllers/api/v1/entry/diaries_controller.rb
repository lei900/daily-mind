module Api
  module V1
    class Entry::DiariesController < BaseController
      before_action :set_entry, only: %i[update destroy]

      def create
        entry = current_user.entries.new(entry_params)

        if entry.save
          diary = entry.entryable
          json_string = DiarySerializer.new(diary).serializable_hash.to_json
          render json: json_string
        else
          render_400(nil, entry.errors.full_messages)
        end
      end

      def update
        if @entry.update(entry_params)
          diary = @entry.entryable
          json_string = DiarySerializer.new(diary).serializable_hash.to_json
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
        @entry = current_user.entries.find(params[:entry_id])
      end

      def entry_params
        params
          .require(:entry)
          .permit(
            :entryable_type,
            :status,
            entryable_attributes: %i[title body mood],
          )
          .merge(user_uid: current_user.uid)
      end
    end
  end
end
