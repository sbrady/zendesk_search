class TicketRepository

  def initialize(tickets)
    @tickets = tickets
  end


  def find_by(field, value)
    @tickets
        .select { |ticket| ticket[field].to_s == value }
        .map { |ticket_hash| Ticket.new(ticket_hash) }
  end

end
