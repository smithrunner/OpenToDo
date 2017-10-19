class Api::ItemsController < ApiController
  before_action :authenticated?
  
  def index
    items = Item.all
    render json: items, each_serializer: ItemSerializer
  end
  
  def create
    @item = Item.new(item_params)
    @item.list_id = List.find(params[:id])
    
    
    if @item.save
      flash[:notice] = "new item added!!"
    else
      render action: 'new'
    end
  end
  
  private
  def item_params
    params.require(:list).permit(:item)
  end
  
  
end
