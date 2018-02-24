require 'server'
require 'helpers/file_actions'

class Servers
    @@texts_new_server = ["Group name: ", "IP Address or hostname: ", "Alias name (Optional): "]
    @@servers_array = {}

    def add(file_name)
        args = {}

        # TODO: Validate user input
        args['id']      = @@servers_array.count
        args['group']   = request_data(0, false)
        args['address'] = request_data(1, false)
        args['alias']   = request_data(2, true)

        @@servers_array[@@servers_array.count] = Server.new(args) if save(file_name, args)
    end

    def load_servers(file_name)
        if FileActions.file_usable(file_name)
            @@servers_array = {}

            file = File.new(file_name, 'r')

            file.each_line do |line|
                line_array = line.split("\t")
                args = {}
                args['id']      = @@servers_array.count
                args['group']   = line_array[0]
                args['address'] = line_array[1]
                args['alias']   = line_array[2]

                @@servers_array[@@servers_array.count] = Server.new(args)
            end

            file.close
        end

        return @@servers_array.count
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