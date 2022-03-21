import pandas as pd
import re

file = open('courses_html.txt')
lines = file.readlines()
file.close()

course = {}

df = pd.DataFrame([], columns=["Subject", "CRN", "Subject Abbr", "Course Number", "Section", "Campus", "Credit Hours", "Title", "Days", "Time", "Section Capacity",
                  "Section Actual", "Section Remaining", "Waitlist Capacity", "Waitlist Actual", "Waitlist Remaining", "Instructor(s)", "Date", "Location", "Attributes"])

# since each piece of course information is on a separate line
# this variable keeps track of what line the parsing process is on
# range of 0-18, if line should be skipped course_i = -1
course_i = 0

for line in lines:

    # skip table row lines as they will never contain relevent information
    # print(line[0:4],  line[0:4] == "<tr>" or line[0:4] == "</tr")
    if line[0:4] == "<tr>" or line[0:4] == "</tr":
        course_i = 0

    else:
        # first, look for subject name
        # all lines starting with this string will contain the Subject name
        if line[0:7] == "<th col":
            course['Subject'] = line[51:-6]
            # print(course["Subject"])

        # if line starts with this phrase it does contains table header information
        # since the table headers always stay the same, there is no reason to parse these lines
        elif line[0:20] == '<th CLASS="ddheader"' or course_i == -1:
            continue

        elif line[22:-6] == '&nbsp;' and course_i == 0:
            course_i = -1

        else:
            # replace system n/a symbol with more human readable version
            if line[22:-6] == '&nbsp;':
                course[course_i] = 'N/A'

            # if CRN line, more trimming is needed
            elif course_i == 0:
                course[course_i] = line[-15:-10]

            elif course_i == 8:
                time = line[22:-6]

                # handle case that time is TBD
                if time[0:5] == '<ABBR':
                    time = 'TBD'

                course[course_i] = time

            # instructor line also requires more processing
            elif course_i == 15:
                # courses MAY have multiple professors listed,
                # for the purposes of this project we will disregard the Primary designation
                # separate professors with ,
                instructors = line[22:-6]
                if instructors[0:5] == '<ABBR':
                    instructors = 'TBD'

                # remove (Primary) tag behind professors name
                instructors = re.sub(" \(+.*\)", "", instructors, 1)

                # fix multiple space issue before professors last names
                course[course_i] = re.sub(" + ", " ", instructors, 1)

            elif course_i == 17:
                location = line[22:-6]

                # handle case that location is TBD
                if location[0:5] == '<ABBR':
                    location = 'TBD'

                course[course_i] = location

            else:
                course[course_i] = line[22:-6]

            # if last element of a course, assemble row and add to pd dataframe
            if course_i == 18:
                # create row in dataframe
                df.loc[len(df.index)] = [course['Subject'], course[0], course[1], course[2], course[3], course[4], course[5], course[6], course[7],
                                         course[8], course[9], course[10], course[11], course[12], course[13], course[14], course[15], course[16], course[17], course[18]]

            course_i += 1


print(df)

df.to_csv('courses.tsv', '\t', index=False)
