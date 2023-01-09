class Api::V1::CommentsController < Api::V1::BaseController
  def create
    comment = current_user.comments.new(comment_params)
    if comment.save
      json_string = CommentSerializer.new(comment).serializable_hash.to_json
      render json: json_string
    else
      render_400(nil, comment.errors.full_messages)
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    head :ok
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:body)
      .merge(entry_id: params[:entry_id], parent_id: params[:parent_id])
  end
end
