require_relative '../models/entry'

RSpec.describe Entry do
    describe "attributes" do
        let(:entry) { Entry.new('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com') }

        it "responds to name" do
            expect(entry).to respond_to(:name)
        end

        it "reports its name" do
            expect(entry.name).to eq('Ben Morrison')
        end

        it "responds to phone number" do
            expect(entry).to respond_to(:phone_number)
        end

        it "reports its phone_number" do
            expect(entry.phone_number).to eq('203.216.1168')
        end

        it "responds to email" do
            expect(entry).to respond_to(:email)
        end

        it "reports its email" do
            expect(entry.email).to eq('benmorrison0@gmail.com')
        end
    end

    describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com')
            expected_string = "Name: Ben Morrison\nPhone Number: 203.216.1168\nEmail: benmorrison0@gmail.com"

            expect(entry.to_s).to eq(expected_string)
        end
    end
end
