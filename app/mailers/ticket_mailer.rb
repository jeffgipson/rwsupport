class TicketMailer < ApplicationMailer

  def new_ticket
    @ticket = params[:ticket]
    mail(to: 'vladimir@recruiterswebsites.com', subject: 'New Support Ticket')
  end

end
