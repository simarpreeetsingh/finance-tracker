class StocksController < ApplicationController

  def search
    if (params[:stock].present?)
      @stock = Stock.new_lookup(params[:stock])
      if (@stock)
        render 'users/my_portfolio'
      else
        flash[:warning] = "Please enter a valid ticker symbol!"
        redirect_to my_portfolio_path
      end
    else
      flash[:warning] = "Please enter a ticker symbol!"
      redirect_to my_portfolio_path
    end
  end

end