class ReleaseHelper
	
	def initialize(client_names, ticket_names)
		@clientList = client_names
		@ticketList = ticket_names
	end
	

	def clients_involved
		if @clientList.nil? 
			puts "This release doesn't affect any client sites."
		elsif @clientList.respond_to?("join")
			puts "The sites affected by this release are #{@clientList.map(&:capitalize)[0...-1].join(", ")}, and #{@clientList.map(&:capitalize).last}!"
		else puts "Today's release affects #{@clientList.capitalize}"
		end
	end

	def tickets_involved
		if @ticketList.nil?
			puts "This release includes no tickets."
		elsif @ticketList.respond_to?("join")
			puts "The code branches included in this release can be found on #{@ticketList[0...-1].join(", ")}, and #{@ticketList.last}."
		else puts "The only code in this release is found on #{@ticketList}."
		end
	end
	
end

ticket_review = ReleaseHelper.new(
	client_names = nil,
	ticket_names = ["CLAIMS-123", "GLOBAL-2", "ADMIN-321"])
ticket_review.tickets_involved

testing_summary = ReleaseHelper.new(
	client_names = ["citizens", "corizon", "calpers"], 
	ticket_names = nil)
testing_summary.clients_involved
