class Course(object):
    def __init__(self, id, title, subject, subjectAbbr, courseNum, creditHours, preReqsOf):
        self.id = if
        self.title = title
        self.subject = subject
        self.subjectAbbr = subjectAbbr
        self.courseNum = courseNum
        self.creditHours = creditHours
        self.preReqOf = preReqsOf
        self.classValue = 0
    
    def calculateCourseValue(self):
        numberOfPreReq = len(self.preReqOf)
        self.classValue = self.creditHours + numberOfPreReq
        return self.classValue
    #defines method to calculate a courses values
    #simply adds the number of courses which have the given course as preReq to the number of credit hours provided by the course
    def compareCourseValues(course1, course2):
        if(course1.classValue > course2.classValue):
            return course1
        elif(course1.classValue < course2.classValue):
            return course2
        elif(course1.classValue == course2.classValue):
            return None
    #defines the method for comparing the value of two courses to determine which one is more "Valuable"
    #returns the Course object with the greatest courseValue, or None/null in the cases the course are equal



#Test for when A>B       
courseA = Course(3,["CPEN3700", "CPEN4700", "CPSC4900"])
courseB = Course(3,["CPSC3220"])

print("Course A value: ", courseA.calculateCourseValue())
print("Course B value: ", courseB.calculateCourseValue())


if(Course.compareCourseValues(courseA, courseB) == courseA):
    print("A>B")



#Test for when A<B       
courseA = Course(3,["CPSC3220"])
courseB = Course(3,["CPEN3700", "CPEN4700", "CPSC4900"])

print("Course A value: ", courseA.calculateCourseValue())
print("Course B value: ", courseB.calculateCourseValue())

if(Course.compareCourseValues(courseA, courseB) == courseB):
    print("A<B")



#Test for when A=B       
courseA = Course(3,["CPEN3700", "CPEN4700", "CPSC4900"])
courseB = Course(3,["CPEN3700", "CPEN4700", "CPSC4900"])

print("Course A value: ", courseA.calculateCourseValue())
print("Course B value: ", courseB.calculateCourseValue())


if(Course.compareCourseValues(courseA, courseB) == None):
    print("A=B")

