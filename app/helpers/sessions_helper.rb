module SessionsHelper
 
  def deny_access
    store_location
    redirect_to new_user_session_path
  end
 
  # add back anyone_signed_in? method after Oliver's comment @ 2011-03-12
  def anyone_signed_in?
    !current_user.nil?
  end
 
  private
 
    def store_location
      session[:return_to] = params[:back_url] ? params[:back_url] : request.env["HTTP_REFERER"]
    end
 
    def clear_stored_location
      session[:return_to] = nil
    end
 
end