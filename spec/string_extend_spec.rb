DATASET = {"hola"               => "Hola",
           "hola mundo"         => "Hola Mundo",
           " hola "             => "Hola",
           "h o l a"            => "H O L A",
           "what is your name?" => "What Is Your Name?",
           "hello\tworld"       => "Hello World",
           "hEllo WORLD"        => "Hello World",
           "h.o.l.a m.u.n.d.o"  => "H.o.l.a M.u.n.d.o"}

RSpec.describe 'String' do

    describe 'string_extended' do

        it "capitalizes the first letter of a string" do
            DATASET.each do |d, r|
                expect(d.titleize).to eq(r)
            end
        end

    end

end