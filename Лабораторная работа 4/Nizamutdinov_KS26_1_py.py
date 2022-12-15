class Student:
    def __init__(self, name, gender, grades):
        self.name = name
        self.gender = gender
        self.grades = grades
students = [Student("Danis", "male", "excellent"),
            Student("John", "male", "good"),
            Student("Margarita", "female", "excellent"),
            Student("Susie", "female", "notgood")]
students_by_rule = []
students_by_rule_males = []
if_there_rule = False
def do_rule():
    for i in range(len(students)):
        if students[i].grades == "excellent" or students[i].grades == "good":
            students_by_rule.append(students[i].name)
        if (students[i].grades == "excellent" or students[i].grades == "good") and students[i].gender == "male":
            if_there_rule = True
            students_by_rule_males.append(students[i].name)
    print(*students_by_rule)
    print(if_there_rule)
    print(*students_by_rule_males)
do_rule()