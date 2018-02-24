require 'server'

RSpec.describe 'Server' do

    describe 'attributes' do

        it "allows reading and writing for :id" do
            server = Server.new
            server.id = 200
            expect(server.id).to eq(200)
        end

        it "allows reading and writing for :address" do
            server = Server.new
            server.address = "255.255.255.255"
            expect(server.address).to eq("255.255.255.255")
        end

        it "allows reading and writing for :alias" do
            server = Server.new
            server.alias = "localhost"
            expect(server.alias).to eq("localhost")
        end

        it "allows reading and writing for :group" do
            server = Server.new
            server.group = "Other"
            expect(server.group).to eq("Other")
        end

        it "allows reading and writing for :status" do
            server = Server.new
            server.status = "OK"
            expect(server.status).to eq("OK")
        end

    end

    describe '.show_info_line' do

        it "returns a formated line with server information" do
            expect do
                @svr1 = Server.new(:id => 2, :address => "127.0.0.1", :alias => "localhost", :group => "Local").show_info_line
            end.to output(" 2   Un         Local      Localhost                      127.0.0.1                     \n").to_stdout
        end

        context "when initialized with no arguments" do
            it "returns a string with default values" do
                expect do
                    @svr2 = Server.new.show_info_line
                end.to output("     Un                                                                                 \n").to_stdout
            end
        end

    end

    describe '.show_server_info' do

        it "returns server information" do
            expect do
                @svr1 = Server.new(:id => 2, :address => "127.0.0.1", :alias => "localhost", :group => "Local").show_server_info
            end.to output("\n id................................2\n status...........................Un\n group.........................Local\n alias.....................Localhost\n address...................127.0.0.1\n").to_stdout
        end

        context "when initialized with no arguments" do
            it "returns a string with default values" do
                expect do
                    @svr2 = Server.new.show_server_info
                end.to output("\n id.................................\n status...........................Un\n group..............................\n alias..............................\n address............................\n").to_stdout
            end
        end

    end
end