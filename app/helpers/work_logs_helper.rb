module WorkLogsHelper
  def total_time_logged(work_logs)
    work_logs
      .map { |work_log| work_log.hours }
      .sum
  end
end
