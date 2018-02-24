class FileActions
    def self.file_exists(file_name)
        # class should know if the restaurant file exists
        return (file_name && File.exists?(file_name))
    end

    def self.file_usable(file_name)
        return false unless file_name
        return false unless File.exists?(file_name)
        return false unless File.readable?(file_name)
        return false unless File.writable?(file_name)

        return true
     end

     def self.create_file(file_name)
        # create the restaurant file
        File.open(file_name, 'w') unless file_exists(file_name)
        return file_usable(file_name)
    end
end