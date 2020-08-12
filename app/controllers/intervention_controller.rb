class InterventionController < ApplicationController
    require 'zendesk_api'#    
#  def
#     ZendeskAPI::Ticket.create!($client, :type => "task", :subject => "#{params[:fullName]} from #{params[:comName]}", :comment => { :value => "
#       The contact #{params[:fullName]} from company #{params[:comName]} can be reached at email  #{params[:email]} and at 
#       phone number #{params[:phoneNumber]}. #{params[:fullName]} want a total of #{params[:finalNumberElevator]} #{params[:price]} elevators. 
#       The subtotal is: #{params[:finalPriceElevator]}, instalation fee is: #{params[:finalInstalationFee]} and the total quote price is: #{params[:finalTotalPrice]}" }, :priority => "urgent") 
#     redirect_to "/thankyou"
end
