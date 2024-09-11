class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:title, :body, :published_at, :utilisateur_id)
    end

end
