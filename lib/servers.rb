require 'server'
require 'helpers/file_actions'

class Servers
    @@texts_new_server = ["Group name: ", "IP Address or hostname: ", "Alias name (Optional): "]
    @@servers_array = []

    def add(file_name)
        args = {}

        # TODO: Validate user input
        args['id']      = @@servers_array.count
        args['group']   = request_data(0, false)
        args['address'] = request_data(1, false)
        args['alias']   = request_data(2, true)

        @@servers_array << Server.new(args) if save(file_name, args)
    end

    def load_servers(file_name)
        if FileActions.file_usable(file_name)
            @@servers_array.clear

            file = File.new(file_name, 'r')

            file.each_line do |line|
                line_array = line.strip.split("\t")
                args = {}
                args['id']      = @@servers_array.count
                args['group']   = line_array[0]
                args['address'] = line_array[1]
                args['alias']   = line_array[2]

                @@servers_array << Server.new(args)
            end

            file.close
        end

        return @@servers_array.count
    end

    def list_servers(args=[])
        sort_order = args.shift
        sort_order = args.shift if sort_order == 'by'
        sort_order = "id" unless ['id', 'status', 'group', 'alias'].include?(sort_order)

        @@servers_array.sort! do |r1, r2|
            case sort_order
            when 'id'
                r1.id <=> r2.id
            when 'status'
                r1.status <=> r2.status
            when 'group'
                r1.group <=> r2.group
            when 'alias'
                r1.alias <=> r2.alias
            end
        end

        columns =  " ID".ljust(Config.line_tabs[:id])
        columns << " Status".center(Config.line_tabs[:status])
        columns << " Group".ljust(Config.line_tabs[:group])
        columns << " Alias".ljust(Config.line_tabs[:alias])
        columns << " Address".ljust(Config.line_tabs[:address])
        puts columns.yellow

        @@servers_array.each do |server|
            server.show_info_line
        end
    end

    private

    def request_data(id, can_be_null)
        user_response = ''

        while user_response == ''
            print " #{@@texts_new_server[id]}"
            user_response = gets.chomp.strip.downcase

            break if can_be_null
        end

        return user_response
    end

    def save(file_name, args)
        return false unless FileActions.file_usable(file_name)

        File.open(file_name, 'a') do |file|
            line = args['group'] + "\t" + args['address'] + "\t" + args['alias'] + "\n"
            puts "Saved: " + args['id'].to_s + "\t" + line
            file.puts line
        end

        return true
    end

    def exist_address(p_address)
        return false unless p_address
        result = false

        @@servers_array.each do |key, value|
            result = value.address == p_address
            break if result
        end

        return result
    end

    def exist_alias(p_alias)
        return false unless p_alias
        result = false

        @@servers_array.each do |key, value|
            result = value.alias == p_alias
            break if result
        end

        return result
    end
end