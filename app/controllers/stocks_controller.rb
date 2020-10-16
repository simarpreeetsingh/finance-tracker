class StocksController < ApplicationController

  def search
    if (params[:stock].present?)
      @stock = Stock.new_lookup(params[:stock])
      if (@stock)
        respond_to do | format |
          format.js { render partial: 'users/stock' }
        end
      else
        respond_to do | format |
          flash.now[:warning] = "Please enter a valid ticker symbol!"
          format.js { render partial: 'users/stock' }
        end
      end
    else
      respond_to do | format |
        flash.now[:warning] = "Please enter a ticker symbol!"
        format.js { render partial: 'users/stock' }
      end
    end
  end

end