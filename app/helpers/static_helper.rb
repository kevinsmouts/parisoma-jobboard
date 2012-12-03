module StaticHelper
  
  def email
    if current_user
    	@email = current_user.email
    else
    	@email = ''
  	end
  end
  
end
