class WorkLogsController < ApplicationController
  before_action :prefill_template_variables

  def prefill_template_variables
    @day = selected_day
    @other_work_logs = WorkLog.where(day: @day)
  end

  def new
    @work_log = WorkLog.new(
      day: @day,
      project: latest_project,
    )
    render 'edit'
  end

  def create
    @work_log = WorkLog.new(work_log_params)
    save_work_log
  end

  def edit
    @work_log = WorkLog.find(params[:id])
    render 'edit'
  end

  def update
    @work_log = WorkLog.find(params[:id])
    @work_log.assign_attributes(work_log_params)
    save_work_log
  end

  def destroy
    WorkLog.destroy(params[:id])
    redirect_to new_work_log_path
  end

  private

  def selected_day
    if params[:day].present?
      selected_day = Date.civil(
        params[:day][:year].to_i,
        params[:day][:month].to_i,
        params[:day][:day].to_i,
      )
      session[:selected_work_log_day] = selected_day
    elsif session[:selected_work_log_day].nil?
      session[:selected_work_log_day] = Date.current
    end

    session[:selected_work_log_day]
  end

  def work_log_params
    params
      .require(:work_log)
      .permit(:day, :project_id, :hours, :comment)
  end

  def save_work_log
    if @work_log.save
      self.latest_project = @work_log.project
      redirect_to new_work_log_path
    else
      render 'edit'
    end
  end

  def latest_project
    session[:latest_work_log_project]
  end

  def latest_project=(project)
    session[:latest_work_log_project] = project
  end
end
