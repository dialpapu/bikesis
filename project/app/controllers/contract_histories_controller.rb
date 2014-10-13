class ContractHistoriesController < ApplicationController
  before_action :set_contract_history, only: [:show, :edit, :update, :destroy]

  def index
    @contract_histories = ContractHistory.all
    respond_with(@contract_histories)
  end

  def show
    respond_with(@contract_history)
  end

  def new
    @contract_history = ContractHistory.new
    respond_with(@contract_history)
  end

  def edit
  end

  def create
    @contract_history = ContractHistory.new(contract_history_params)
    @contract_history.save
    respond_with(@contract_history)
  end

  def update
    @contract_history.update(contract_history_params)
    respond_with(@contract_history)
  end

  def destroy
    @contract_history.destroy
    respond_with(@contract_history)
  end

  private
    def set_contract_history
      @contract_history = ContractHistory.find(params[:id])
    end

    def contract_history_params
      params.require(:contract_history).permit(:personId, :contractDate, :finalContractDate)
    end
end
