class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def current_user
    @current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id])
  end

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Publicação criada." }
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
            format.html { redirect_to post_url(@post), notice: "Publicação atualizada." }
            format.json { render :show, status: :ok, location: @post }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
          end

    end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Publicação apagada." }
          format.json { head :no_content }
         end
    else
        message = "Você não pode deletar esta publicação sem estar logado!"
        redirect_to root_path, notice: message
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description)
    end
end
