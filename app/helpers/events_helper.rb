module EventsHelper
  def attend_unattend(event)
    return attend_path(event) unless check

    if logged_user.attending?(event)
      unattend_path(event)
    else
      attend_path(event)
    end
  end

  def switch_status(event)
    return 'Attend' unless check

    if logged_user.attending?(event)
      'Unattend'
    else
      'Attend'
    end
  end
end
