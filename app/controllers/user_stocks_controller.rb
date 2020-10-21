class UserStocksController < ApplicationController

  def create
    # byebug
    stock = Stock.where(ticker: params[:ticker]).first
    if (!stock)
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{stock.name} successfully added to your portfolio!"
    redirect_to my_portfolio_path
  end

end