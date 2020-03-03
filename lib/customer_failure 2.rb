class CustomFailure < Devise::FailureApp
  def redirect_url
    if warden_message == :unconfirmed
      # Remove the `redirect_to` call
      new_user_session_path(q: "unconfirmed")
    else
      super
    end
  end
end
