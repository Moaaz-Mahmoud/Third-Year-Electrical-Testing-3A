class Employee:
    def __init__(self, id, name, hourly_wage):
        self.id = id
        self.name = name
        self.hourly_wage = hourly_wage
    def set_id(self, new_id):
        self.id = new_id
    def set_name(self, new_name):
        self.name = new_name
    def set_hourly_wage(self, new_hourly_wage):
        self.hourly_wage = new_hourly_wage
    
    def display(self):
        print(f"Name:        {self.name}")
        print(f"ID:          {self.id}")
        print(f"Hourly wage: {self.hourly_wage}")
        print('-'*15)

employees = set()

def add_employee():
    employees.add(Employee(
        input("ID\n>>> "),
        input("Name\n>>> "),
        input("Hourly wage\n>>> "),
    ))
def remove_employee():
    id_to_remove = input("ID\n>>> ")
    employee_to_remove = Employee(0, '0', 0)
    for employee in employees:
        if employee.id == id_to_remove:
            employee_to_remove = employee
            break
    if employee_to_remove in employees:
        employees.remove(employee_to_remove)
    else:
        print("Employee does not exist!!!")
    
def promote_employee():
    id_to_promote = input("ID\n>>> ")
    employee_to_promote = Employee(0, '0', 0)
    for employee in employees:
        if employee.id == id_to_promote:
            employee_to_promote = employee
            break
    if employee_to_promote in employees:
        new_wage = input("New wage\n>>> ")
        employee_to_promote.set_hourly_wage(new_hourly_wage=new_wage)
    else:
        print("Employee does not exist!!!")

def display_employees():
    for employee in employees:
        employee.display()

while True:
    cmd = input(
'''1: Add employee
2: Remove employee
3: Promote employee
4: Display employees
5: Exit
>>> ''')
    if cmd == '1':
        add_employee()
    elif cmd == '2':
        remove_employee()
    elif cmd == '3':
        promote_employee()
    elif cmd == '4':
        print()
        display_employees()
        print()
    elif cmd == '5':
        break
    else:
        print("Please enter a valid command!!!")