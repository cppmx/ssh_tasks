class Config
    @@banner_file = File.join(APP_ROOT, '.app_intro')
    @@servers_file_name = File.join(File.expand_path('~'), ".servers.txt")
    @@actions = ['list', 'find', 'add', 'quit']
    @@line_width = 80
    @@line_tabs = {id: 3, status: 10, group: 10, alias: 30, address: 30}
    @@status_available = ['Unknown' => 'UN', 'Ok' => 'OK']

    def self.banner_file; @@banner_file; end

    def self.servers_file_name; @@servers_file_name; end

    def self.actions; @@actions; end

    def self.line_width; @@line_width.to_i; end

    def self.status_available; @@status_available; end

    def self.line_tabs; @@line_tabs; end
end