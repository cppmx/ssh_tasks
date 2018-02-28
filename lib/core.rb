require 'config'
require 'helpers/file_actions'
require 'servers'

class Core
    @servers_handler = nil

    def initialize
        @servers_handler = Servers.new

        if FileActions.file_usable(Config.servers_file_name)
            total = @servers_handler.load_servers(Config.servers_file_name)
            puts "File servers found: " + total.to_s + " servers loaded"
        elsif FileActions.create_file(Config.servers_file_name)
            puts "File server created and ready"
        else
            puts "A problem found on servers file, exiting ..."
            exit!
        end
    end

    def launch!
        introduction

        result = nil
        until result == :quit
            action, args = get_action
            result = do_action(action, args)
        end

        conclusion
    end

    def get_action
        action = nil

        # Keep asking for user input until we get a valid action
        until Config.actions.include?(action)
            line = "Atcions: " + Config.actions.join(", ")
            puts line.high_magenta
            print " > ".high_red
            user_response = gets.chomp
            args = user_response.downcase.strip.split(' ')
            action = args.shift
        end

        return action, args
    end

    def do_action(action, args=[])
        case action
        when 'list'
            output_action_header("Servers")
            @servers_handler.list_servers(args)
        when 'find'
            output_action_header("Found servers")
            keyword = args.shift
            @servers_handler.find(keyword)
        when 'add'
            output_action_header("Add new server")
            @servers_handler.add(Config.servers_file_name)
        when 'quit'
            return :quit
        else
            puts "\nI don't understand that command.\n"
        end
    end

    def introduction
        banner = File.read(Config.banner_file)
        puts banner.red
        output_action_header("Welcome | Bienvenido | Bonjour".upcase)
    end

    def conclusion
        output_action_header("Bye | Adios | Au revoir".upcase)
    end

    def output_action_header(text)
        puts "\n#{text.upcase.center(Config.line_width)}\n\n".yellow
    end
end
