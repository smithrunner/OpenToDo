class Api::ItemsController < ApiController
  before_action :authenticated?
  
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
