require_relative './Person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom

    belongs_to(@classroom) if classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def belongs_to(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
