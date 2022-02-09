class TicketMailer < ApplicationMailer

  def new_ticket
    @ticket = params[:ticket]
    mail(to: 'vladimir@recruiterswebsites.com', subject: @ticket.title)
  end

  def new_response
    @response = params[:response]
    mail(to: 'vladimir@recruiterswebsites.com', subject: 'Re:'+@response.title)
  end
end
