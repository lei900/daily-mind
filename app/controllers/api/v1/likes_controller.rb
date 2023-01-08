class Api::V1::LikesController < Api::V1::BaseController
  def create
    like = current_user.likes.new(like_params)
    if like.save
      head :ok
    else
      render_400(nil, like.errors.full_messages)
    end
  end

  def destroy
    like =
      current_user.likes.find_by(
        likeable_id: params[:likeable_id],
        likeable_type: params[:likeable_type],
      )
    like.destroy!
    head :ok
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
