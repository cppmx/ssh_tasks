# This helper is opening up core Ruby String class 
# in order to add a new method to all strings
class String

    # Ruby has a capitalize method (used below) which 
    # capitalizes the first letter of a string. But in 
    # order to capitalize the first letter of EVERY 
    # word we have to write our own.
    def titleize
        self.split.map(&:capitalize).join(' ')
    end

    # *****           Colors code          *****
    #
    # Regular colors
    def black;          "\e[30m#{self}\e[0m" end
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def yellow;         "\e[33m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    def white;          "\e[37m#{self}\e[0m" end

    # High intensty colors
    def high_black;     "\e[90m#{self}\e[0m" end
    def high_red;       "\e[91m#{self}\e[0m" end
    def high_green;     "\e[92m#{self}\e[0m" end
    def high_yellow;    "\e[93m#{self}\e[0m" end
    def high_blue;      "\e[94m#{self}\e[0m" end
    def high_magenta;   "\e[95m#{self}\e[0m" end
    def high_cyan;      "\e[96m#{self}\e[0m" end
    def high_white;     "\e[97m#{self}\e[0m" end

    # Bakcground colors
    def bg_black;       "\e[40m#{self}\e[0m" end
    def bg_red;         "\e[41m#{self}\e[0m" end
    def bg_green;       "\e[42m#{self}\e[0m" end
    def bg_yellow;      "\e[43m#{self}\e[0m" end
    def bg_blue;        "\e[44m#{self}\e[0m" end
    def bg_magenta;     "\e[45m#{self}\e[0m" end
    def bg_cyan;        "\e[46m#{self}\e[0m" end
    def bg_gray;        "\e[47m#{self}\e[0m" end

    # High intensty bakcground colors
    def high_bg_black;  "\e[100m#{self}\e[0m" end
    def high_bg_red;    "\e[101m#{self}\e[0m" end
    def high_bg_green;  "\e[102m#{self}\e[0m" end
    def high_bg_yellow; "\e[103m#{self}\e[0m" end
    def high_bg_blue;   "\e[104m#{self}\e[0m" end
    def high_bg_magenta;"\e[105m#{self}\e[0m" end
    def high_bg_cyan;   "\e[106m#{self}\e[0m" end
    def high_bg_gray;   "\e[107m#{self}\e[0m" end

    # String decorations
    def bold;           "\e[1m#{self}\e[22m" end
    def italic;         "\e[3m#{self}\e[23m" end
    def underline;      "\e[4m#{self}\e[24m" end
    def blink;          "\e[5m#{self}\e[25m" end
    def reverse_color;  "\e[7m#{self}\e[27m" end

end