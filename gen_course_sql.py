import csv

# generate the sql files with course information from the courses.tsv file

current_course = ''

courses_sql = 'INSERT INTO `courses` VALUES'
sections_sql = 'INSERT INTO `sections` VALUES'


def parse_time(time, start):
    offset = 0
    # first check if time is tbd, this will be null in the database
    if time == 'TBD':
        return 'null'

    # if parsing time for beginning time
    elif (start):
        time = time[:8]

    else:
        time = time[9:]

    if time[6:8] == 'pm':
        offset = 12

    hours_str = time[0:2]
    hours = int(hours_str)
    if time[6:8] == 'pm':
        hours += 12

    parsed_time = '"' + str(hours) + ':' + time[3:5] + ':00"'

    return parsed_time


def parse_date(date, start):
    if (date == "TBD"):
        return "null"
    elif (start):
        date = date[:5]
    else:
        date = date[6:]

    date = "2022-" + date[:2] + "-" + date[3:]
    return date


with open('data/courses.tsv', newline='') as tsvfile:
    reader = csv.reader(tsvfile, delimiter='\t')
    next(reader)
    for row in reader:
        start_time = parse_time(row[9], True)
        end_time = parse_time(row[9], False)
        start_date = parse_date(row[17], True)
        end_date = parse_date(row[17], False)
        sections_sql += '\n(' + row[1] + ', "' + row[2] + row[3] + '", ' + row[4] + ', "' + row[16] + '", "' + row[5] + '", "' + row[18] + '", ' + start_time + \
            ', ' + end_time + ', "' + start_date + '", "' + end_date + '", "' + \
            row[8] + '", ' + row[10] + ', ' + row[11] + ', "' + row[19] + '"),'

        # since the tsv file is already sorted by subject and then course number
        # we can assume that once a different subject/course number is present
        # that there are no more sections of that course in the file
        if current_course == row[2] + row[3]:
            continue
        else:
            current_course = row[2] + row[3]
            courses_sql += '\n("' + current_course + '", "' + \
                row[7] + '", "' + row[0] + '", "' + row[2] + \
                '", "' + row[3] + '", ' + row[6][0] + '),'

        # print(row[2] + row[3])

# replace last comma with semi colon
courses_sql = courses_sql[:-1] + ';'
sections_sql = sections_sql[:-1] + ';'

# print(courses_sql)
# print(sections_sql)

# write the sql code to file so it can be easily reused
f = open("data/courses.sql", "w")
f.write(courses_sql)
f.close()
print('Wrote courses.sql')

f = open("data/sections.sql", "w")
f.write(sections_sql)
f.close()
print('Wrote sections.sql')

# create single file that can create all elements of the database
# including creating the tables and populating them
with open('data/SchedMaster.sql', 'r') as template, open('SchedMaster_full.sql', 'w') as full:

    # read content from first file
    for line in template:

        # write content to second file
        full.write(line)

    full.write("\n" + courses_sql + "\n\n" + sections_sql + "\n")
