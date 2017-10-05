class Student

  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def name
    @first_name + " " + @last_name
  end

  def courses
    @courses
  end


  def enroll(course)
    raise "THERE'S A CONFLICT!!!" if has_conflict?(course)
    return if course.students.include?(self)

    @courses.push(course)
    course.students << self
  end


  def course_load
    result = Hash.new
    @courses.each do |obj|
      if result[obj.department] == nil
        result[obj.department] = obj.credits
      else
        result[obj.department]+= obj.credits
      end
    end

    result
  end




  def has_conflict?(course)

    courses.any? do |ele|
      ele.time_block == course.time_block
    end
  end


end
