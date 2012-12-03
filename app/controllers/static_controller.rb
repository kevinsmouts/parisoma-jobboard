class StaticController < ApplicationController
  def about
  end

  def contact
  end
  
  def send_contact
    ContactMailer.contact(params).deliver
    redirect_to contact_path, :notice => "Email sent, we will get back to you soon."
  end

  def faq
  end
end
