class ItemsController < ApplicationController

  def index
    
  end

  # def destroy
  # end


  private

  def iteme_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
