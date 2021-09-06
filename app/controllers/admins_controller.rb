class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ :show, :edit, :update, :destroy ]

  # GET /admins or /admins.json
  def index
    @admins = Admin.includes(:company, :staff).all
  end

  # GET /admins/1 or /admins/1.json
  def show
    @admin = Admin.find(params[:id])
    # @company = Company.find(params[:id])
  end

  # GET /admins/new
  def new
    @admin = CompanyAdmins.new
    @companies = Company.all
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
    @companies = Company.all
  end

  # POST /admins or /admins.json
  def create
    @admin = CompanyAdmins.new(admin_params)
    if @admin.save
      redirect_to root_path, notice: "投稿が完了しました"
    else
      flash.now[:aleart] = "投稿が失敗しました"
      render 'new'
    end
  end

  # PATCH/PUT /admins/1 or /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: "Admin was successfully updated." }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1 or /admins/1.json
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    redirect_to root_path
    flash[:danger] = "削除されました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:company_admins).permit(:name, :name_kana, :place, :place_remark, :start, :finish, :time, :salary, :company)
    end
end
