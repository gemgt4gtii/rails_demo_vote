
class CandidatesController < ApplicationController
  #主頁
  def index
    # 撈出所有model的資料
    @candidate = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  #創建候選人
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
  #調取候選人資料
  def show
    @candidate = Candidate.find_by(params[:id])

  end
  #編輯資料
  def edit
    @candidate = Candidate.find_by(params[:id])
  end

  #更新資料
  def update
    @candidate = Candidate.find_by(params[:id])

    if @candidate.update(candidates_params)
      #  success
      flash[:SuccessMeg] = "Success"
      redirect_to '/candidates'
    else
      flash[:ErrorMeg] = "Error"
      render :edit # redirect_to '/candidates/edit'
    end
  end
  # 刪除資料
  def destroy
    @candidate = Candidate.find_by(params[:id])
    @candidate.destroy

    flash[:SuccessMeg] = "Candidate deleted"
    redirect_to '/candidates'
  end

    private
    # 清洗數據
    def candidates_params
      params.require(:candidate).permit(:name, :party, :age, :politics)
    end
end