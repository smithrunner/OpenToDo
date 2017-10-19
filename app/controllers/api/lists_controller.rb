class Api::ListsController < ApiController
  before_action :authenticated?
  
  def index
    lists = List.all
    render json: lists, each_serializer: ListSerializer
  end
  
  def create
    @list = List.new(list_params)
    @list.user_id = User.find(params[:id])

    if @list.save
      redirect_to user_list_path(@user, @list), notice: 'List was successfully created.'
    else
      render action: 'new'
    end
  end
  
  private
  def list_params
    params.require(:user).permit(:private)
  end
  
end
