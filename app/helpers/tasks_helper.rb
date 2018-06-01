module TasksHelper
  def status_tag(task)
    result = ""
    if task.status == true
      result = 'Done'
    else
      result = '<a class="btn btn-sm btn-primary" href="' + completed_task_path(task) + '">complete</a>'
    end
    result.html_safe
  end

  def deadline_format(deadline)
    result = ""
    if deadline.present?
      result = deadline.strftime("%Y/%m/%d")
    end
    result
  end
end
