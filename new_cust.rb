require 'terminal-table'
require 'json'

module New_Cust
    module_function

    customers = []

    File.open("customers.txt").each do |line|
        customers = JSON.parse(line, {symbolize_names: true})
    end

    def add_customer(customers)
        puts "What is your new customers name?"
        name = gets.chomp.capitalize!
        puts "Do they have any dietry requirements? please put a ',' between if multiple"
        diet = gets.chomp.capitalize!
        puts "What table will they be at?"
        table_no = gets.chomp.to_i
        order_cost = 0
        customers << [table_no, name, diet, order_cost]

        table = Terminal::Table.new :title => "Customers", :headings => ["Table number", "Customer", "Dietry needs", "Order cost"], :rows => customers

        table.style = {:width => 100, :padding_left => 3, :border_x => "=", :border_i => "x"}

        system "clear"

        puts table

        File.open("customers.txt", "w") do |line|
            line.puts JSON.generate(customers)
        end 

    end

 #add_customer customers    #NEED TO ADD THIS INTO MASTER TO ACTIVATE LATER

   

end