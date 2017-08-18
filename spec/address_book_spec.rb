require_relative '../models/address_book'

RSpec.describe AddressBook do
    let(:book) { AddressBook.new }

    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end

    describe "attributes" do
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end

        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end

        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book.add_entry('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com')

            expect(book.entries.size).to eq(1)
        end

        it "adds the correct information to entries" do
            book.add_entry('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com')
            new_entry = book.entries[0]

            expect(new_entry.name).to eq('Ben Morrison')
            expect(new_entry.phone_number).to eq('203.216.1168')
            expect(new_entry.email).to eq('benmorrison0@gmail.com')
        end
    end

    describe "#remove_entry" do
        it "removes only one entry from the address book" do
            book.add_entry('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com')
            book.add_entry('Joe Schmoe', '123.456.7890', 'joeschmoe@gmail.com')
            expect(book.entries.size).to eq(2)

            book.remove_entry('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com')
            expect(book.entries.size).to eq(1)
        end

        it "removes the correct information from entries" do
            book.add_entry('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com')
            removed_entry = book.remove_entry('Ben Morrison', '203.216.1168', 'benmorrison0@gmail.com')

            expect(removed_entry.name).to eq('Ben Morrison')
            expect(removed_entry.phone_number).to eq('203.216.1168')
            expect(removed_entry.email).to eq('benmorrison0@gmail.com')
        end
    end

    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv")
            book_size = book.entries.size

            expect(book_size).to eq 5
        end

        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[0]

            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        end

        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[1]

            check_entry(entry_one, "Bob", "555-555-5415", "bob@blocmail.com")
        end

        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[2]

            check_entry(entry_one, "Joe", "555-555-3660", "joe@blocmail.com")
        end

        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[3]

            check_entry(entry_one, "Sally", "555-555-4646", "sally@blocmail.com")
        end

        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[4]

            check_entry(entry_one, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
    end

    # Assignment 6 work:
    describe "importing entries from entries_2 file" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries_2.csv")
            book_size = book.entries.size

            expect(book_size).to eq 3
        end

        it "imports the 1st entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[0]

            check_entry(entry_one, "Ben", "888-888-1234", "ben@blocmail.com")
        end

        it "imports the 2nd entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[1]

            check_entry(entry_one, "Luka", "888-888-9876", "luka@blocmail.com")
        end

        it "imports the 3rd entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[2]

            check_entry(entry_one, "Michael", "888-888-5678", "michael@blocmail.com")
        end
    end
end
