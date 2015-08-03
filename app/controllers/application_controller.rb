class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_account, :logged_in?
  before_action :require_login
  ### Filters ###
  # This method is called before each controller action is
  # executed in order to ensure that the user is logged in
  def require_login
    redirect_to connect_to_your_store_path unless current_account.present?
  end
  def login(account_id)
    session[:current_account_id] = account_id
  end
  def logged_in?
    current_account.present?
  end
  # Finds the Account with the ID stored in the session with the
  # key :current_account_id. This is a common way to handle user
  # login in a Rails application; logging in sets the session
  # value and logging out removes it.
  def current_account
    @_current_account ||= session[:current_account_id] &&
      Account.find_by(id: session[:current_account_id])
  end

 def show_under_construction_page
  return render "shared/under_construction"   
 end

 def show_coming_soon_page
  if request.xhr?
    respond_to do |format|
      format.js { render "shared/coming_soon"}
      flash.now[:error] = "This page is under construction" 
    end    
  else
    return render "shared/coming_soon"
  end  
   
 end


end
