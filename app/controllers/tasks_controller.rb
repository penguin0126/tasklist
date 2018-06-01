class TasksController < ApplicationController
  def index
    @tasks = Task
      .by_status(params[:status])
      .paginate(page: params[:page], per_page: 5)
      .order('status desc', 'deadline asc')
    @grid_no = 1
    if params[:page].present?
      @grid_no = (params[:page].to_i - 1) * 5 + 1
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      if @task.deadline_form.present?
        @task.deadline = Date.new(
          @task.deadline_form[0..3].to_i,
          @task.deadline_form[4..5].to_i,
          @task.deadline_form[6..7].to_i)
      end
      @task.status = false

      @task.save(validate:false)
      flash[:info] = "successflully created!"
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:info] = 'successfully deleted'
    redirect_to request.referer
  end

  def completed
    @task = Task.find(params[:id])
    @task.status = true
    @task.save
    redirect_to request.referer
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :note,
      :deadline_form
    )
  end
end
