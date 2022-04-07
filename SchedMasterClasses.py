# -*- coding: utf-8 -*-
"""
Created on Thu Apr  7 11:46:44 2022

@author: teddy
"""

class CourseSect(object):
    def __init__(self, crn, courseId, sectNum, instructor, campus, location, startTime, endTime, startDate, endDate, days, cap, registered, attributes):
        self.crn = crn
        self.courseId = courseId
        self.sectNum = sectNum
        self.instructor = instructor
        self.campus = campus
        self.location = location
        self.startTime = startTime
        self.endTime = endTime
        self.startDate = startDate
        self.endDate = endDate
        self.days = days
        self.cap = cap
        self.registered = registered
        self.attributes = attributes
        # Note that the final version of this class will have other fields too.
    def conflictsWith(self, course):
        timeOverlap = False
        dayOverlap = False
        if ((self.startTime < course.startTime and self.endTime > course.startTime) 
            or (self.startTime > course.startTime and self.startTime < course.endTime) 
            or self.startTime == course.startTime or self.endTime == course.endTime):
            timeOverlap = True
        for day in self.days:
            if (day in course.days): dayOverlap = True
        if (timeOverlap and dayOverlap): return True
        else: return False
        
class Student(object):
    def __init__(self, id, firstName, lastName, major, minor, requiredHours):
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.major = major
        self.minor = minor
        self.requiredHours = requiredHours
        
class Registration(object):
    def __init__(self, studentId, crn, semester, gradeRcvd):
        self.studentId = studentId
        self.crn = crn
        self.semester = semester
        self.gradeRcvd = gradeRcvd

class Major(object):
    def __init__(self, name, reqCourses, reqHrs, minorReq):
        self.name = name
        self.requiredCourses = reqCourses
        self.requiredHours = reqHrs
        self.minorRequired = minorReq
        
