class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /posts
  def index
    @pagy, @posts = pagy(Post.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @posts.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @posts.load

    # Uncomment to authorize with Pundit
    # authorize @posts
    if params[:category_id]
      @posts = Post.where(category_id: params[:category_id])
    end

    @favposts = current_user.fav_posts
  end

  def fav
      current_user.fav_posts.push(params[:id])
      current_user.save(validate: false)
  end

  def fav_remove
    current_user.fav_posts.delete(params[:id])
    current_user.save(validate: false)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new

    # Uncomment to authorize with Pundit
    # authorize @post

  end

  # GET /posts/1/edit
  def edit

  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    # Uncomment to authorize with Pundit
    # authorize @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @post
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :image, :category_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:post).permit(policy(@post).permitted_attributes)
  end
end
