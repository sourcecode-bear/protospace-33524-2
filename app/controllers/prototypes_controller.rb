class PrototypesController < ApplicationController
  #ログインしていないと遷移できないようにページ制限をする
  before_action :authenticate_user!, only:[:new, :create, :update, :destroy]
  #他のログインユーザーがURLを使って遷移しない仕様にする
  #編集ページに遷移したらトップページに戻る仕様にする
  before_action :move_to_edit, except:[:index, :show]
  
  
  def index
    @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
     @prototype = Prototype.find(params[:id])
     unless user_signed_in?
      redirect_to action: :index 
    end
  end

  
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path
  else
    render :edit
  end
 end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

 private

 def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
 end

    #条件：プロトタイプを投稿したユーザーが本来のログインしたユーザーかどうか？
  def move_to_edit
    unless user_signed_in?
      prototype.user == current_user
    else
      redirect_to action: :index
    end
  end
end




