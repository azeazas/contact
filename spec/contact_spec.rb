require('rspec')
require('contact')
require('email')
require('mail_address')
require('phone_number')

describe (Contact) do
  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it("returns a first name") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      expect(test_contact.first_name()).to(eq("Betty"))
    end
  end

  describe('#last_name') do
    it("returns a last name") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      expect(test_contact.last_name()).to(eq("Boop"))
    end
  end

  describe('#job_title') do
    it("returns a job title") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      expect(test_contact.job_title()).to(eq("actress"))
    end
  end

  describe('#company') do
    it("returns a company") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      expect(test_contact.company()).to(eq("Television Studio"))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves new contact into the array of contacts") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.clear') do
    it("empties the array of contacts") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      test_contact.save()
      expect(Contact.clear()).to(eq([]))
    end
  end

  describe('#id') do
    it("returns the id of the contact") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      test_contact.save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('.find') do
    it("finds a contact by its id") do
      test_contact = Contact.new({:first_name => "Betty",:last_name => "Boop", :job_title => "actress", :company => "Television Studio"})
      test_contact.save()
      test_contact2 = Contact.new({:first_name => "Luigi",:last_name => "Bro", :job_title => "plumber", :company => "Super Mario Bros."})
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end
end
