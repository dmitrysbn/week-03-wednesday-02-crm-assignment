class Contact

  @@contacts = []
  @@id = 1

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @note       = note

    @id         = @@id
    @@id       += 1
  end

  # CLASS METHODS

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  def self.all
    @@contacts
  end

  def self.find(id)
    @@contacts.find do |contact|
      contact.id == id
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(name_of_attribute, value_of_attribute)
    if name_of_attribute == 'first_name'
      @@contacts.find do |contact|
        contact.name_of_attribute == value_of_attribute
      end
    elsif name_of_attribute == 'last_name'
      @@contacts.find do |contact|
        contact.last_name == value_of_attribute
      end
    elsif name_of_attribute == 'email'
      @@contacts.find do |contact|
        contact.email == value_of_attribute
      end
    else
      @@contacts.find do |contact|
        contact.note == value_of_attribute
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  # READER METHODS

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  # WRITER METHODS

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  # METHODS

  def full_name
    "#{ @first_name } #{ @last_name }"
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(name_of_attribute, value)
    if name_of_attribute == 'first_name'
      @first_name = value

    elsif name_of_attribute == 'last_name'
      @last_name = value

    elsif name_of_attribute == 'email'
      @email = value

    else
      @note = value
    end
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

end

bob = Contact.create('bob', 'dole', 'bob@gmail.com', 'yyyep')
sue = Contact.create('sue', 'dole', 'sue@gmail.com', 'nnope')
meg = Contact.create('meg', 'dole', 'meg@gmail.com', 'mmmmk')

# puts Contact.all.inspect

# puts Contact.find_by('first_name', 'sue').inspect
# puts Contact.find_by('last_name', 'dole').inspect
# puts Contact.find_by('note', 'mmmmk').inspect
puts Contact.find_by('last_name', 'dole').first_name

meg.update('first_name', 'dre')
# puts meg.inspect
meg.update('last_name', 'mc. daddy')
meg.update('email', 'lol')
meg.update('note', 'aummm')
# puts meg.inspect
puts Contact.all.inspect
bob.delete
puts Contact.all.inspect
