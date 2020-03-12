class ToDosController < ApplicationController
  before_action :set_to_do, only: [:show, :edit, :update, :destroy]

  # GET /to_dos
  # GET /to_dos.json
  def index
    @to_dos = ToDo.where( 'userID = ?', session[:user_id])
  end

  # GET /to_dos/1
  # GET /to_dos/1.json
  def show
  end

  # GET /to_dos/new
  def new
    @to_do = ToDo.new
  end

  # GET /to_dos/1/edit
  def edit
  end

  # POST /to_dos
  # POST /to_dos.json
  def create
    @to_do = ToDo.new(to_do_params)

    respond_to do |format|
      @to_do.userID = session[:user_id]
      @to_do.complete = 'No'
      if @to_do.save
        format.html { redirect_to dashboard_path}
        format.json { render :show, status: :created, location: @to_do }
      else
        format.html { render :new }
        format.json { render json: @to_do.errors.full_messages = "Please provide a name!", status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_dos/1 
  # PATCH/PUT /to_dos/1.json
  def update
    respond_to do |format|
      if @to_do.update(to_do_update_params)
        format.html { redirect_to dashboard_path}
        format.json { render :show, status: :ok, location: @to_do }
      else
        format.html { render :edit }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do
      @to_do = ToDo.find(params[:id])
        # @to_do = ToDo.where( 'userID == ?', current_user.user_id)
    end

    # Only allow a list of trusted parameters through.
    def to_do_params
      params.require(:to_do).permit(:toDoItem)
    end

    # Only allow a list of trusted parameters through.
    def to_do_update_params
      params.require(:to_do).permit(:toDoItem, :complete)
    end
end
