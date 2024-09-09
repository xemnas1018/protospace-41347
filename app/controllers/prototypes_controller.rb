class PrototypesController < ApplicationController
  before_action :authenticate_user!,only: [:new,:edit,:destroy]
  before_action :redirect_index,only:[:edit]
  before_action :set_prototype,except: [:index,:new,:create]
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # データの保存に成功した場合はルートパスへリダイレクト
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to "/"
    #処理に何らかの問題があった場合は新規投稿画面を再表示
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end


  private

  def prototype_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end

  def redirect_index
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
