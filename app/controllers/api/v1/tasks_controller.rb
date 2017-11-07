class Api::V1::TasksController < Api::V1::BaseApiController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  #########################################
  ## url: /api/v1/tasks
  ## method: GET
  ## Headers: [Authorization: token]
  ## returns array of tasks in json format
  ##########################################
  def index
    @tasks = Task.all
  end

  ###########################################
  ## url: /api/v1/tasks/1
  ## method: PATCH
  ## Headers: [Authorization: token]
  ## returns task object if saved.
  ## Otherwise, returns errors in json format
  ############################################
  def update
    if @task.update(task_params)
      render :show, status: :ok, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:is_executed)
    end

end