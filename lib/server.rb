require 'config'
require 'helpers/string_extend'

class Server
    attr_accessor :id, :address, :alias, :group, :status

    def initialize(args={})
        @id      = args["id"]      || ""
        @address = args["address"] || ""
        @alias   = args["alias"]   || ""
        @group   = args["group"]   || ""
        @status  = 'UN'
    end

    def show_info_line
        line =  " " << @id.to_s.ljust(Config.line_tabs[:id])
        line << ""  + @status.titleize.center(Config.line_tabs[:status])
        line << ""  + @group.titleize.ljust(Config.line_tabs[:group])
        line << ""  + @alias.titleize.ljust(Config.line_tabs[:alias])
        line << ""  + @address.ljust(Config.line_tabs[:address])

        puts line
    end

    def show_server_info
        line =  "\n " << Config.line_tabs.keys[0].to_s.ljust(25, ".") + @id.to_s.rjust(10, ".")
        line << "\n "  + Config.line_tabs.keys[1].to_s.ljust(25, ".") + @status.titleize.rjust(10, ".")
        line << "\n "  + Config.line_tabs.keys[2].to_s.ljust(25, ".") + @group.titleize.rjust(10, ".")
        line << "\n "  + Config.line_tabs.keys[3].to_s.ljust(25, ".") + @alias.titleize.rjust(10, ".")
        line << "\n "  + Config.line_tabs.keys[4].to_s.ljust(25, ".") + @address.rjust(10, ".")
        line << "\n"

        puts line
    end
end