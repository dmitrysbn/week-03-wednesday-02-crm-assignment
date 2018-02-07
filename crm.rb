require './contact.rb'

class CRM

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'Enter ID of the contact: '
    id = gets.to_i

    print 'Enter attribute to be modified: '
    print_attribute_menu
    attribute_number = gets.to_i

    attribute_name = call_attribute_option(attribute_number)

    print 'Enter value of the new attribute: '
    value = gets.chomp

    Contact.find(id).update(attribute_name, value)
    main_menu
  end

  def print_attribute_menu
    puts '[1] First name'
    puts '[2] Last name'
    puts '[3] Email'
    puts '[4] Note'
  end

  def call_attribute_option(attribute_number)
    case attribute_number
    when 1 then 'first_name'
    when 2 then 'last_name'
    when 3 then 'email'
    when 4 then 'note'
    end
  end

  def delete_contact

  end

  def display_all_contacts
    puts Contact.all
  end

  def search_by_attribute

  end


end

crm = CRM.new
crm.main_menu
