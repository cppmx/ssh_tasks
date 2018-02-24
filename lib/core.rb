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
          puts "Actions: " + Config.actions.join(", ")
          print "> "
          user_response = gets.chomp
          args = user_response.downcase.strip.split(' ')
          action = args.shift
        end

        return action, args
    end

    def do_action(action, args=[])
        case action
        when 'list'
            # TODO: Add list method
            #list(args)
            puts "Listing ..."
        when 'find'
            # TODO: Add find method
            keyword = args.shift
            #find(keyword)
            puts "Finding ..."
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
        output_action_header("Welcome | Bienvenido | Bonjour".upcase)

        # TODO: Create a nice interface
    end

    def conclusion
        output_action_header("Bye | Adios | Au revoir".upcase)
    end

    def output_action_header(text)
        puts "\n#{text.upcase.center(Config.line_width)}\n\n"
    end
end
