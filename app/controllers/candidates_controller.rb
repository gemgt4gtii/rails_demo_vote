
class CandidatesController < ApplicationController

  def index
    # 撈出所有model的資料
    @candidate = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidates_params)

    if @candidate.save
    #  success
      flash[:SuccessMeg] = "Success"
      redirect_to '/candidates'
    else
      flash[:ErrorMeg] = "Error"
      render :new # redirect_to '/candidates/new'
    end
  end

  def show

  end
    private
    def candidates_params
      params.require(:candidate).permit(:name, :party, :age, :politics)
    end




end