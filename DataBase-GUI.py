import random
import customtkinter as ctk
from tkinter import  Canvas,messagebox
import pyodbc
from PIL import Image, ImageTk
from datetime import datetime



# Database connection
def connect_to_db():
    try:
        connection = pyodbc.connect(
            f"DRIVER={{ODBC Driver 18 for SQL Server}};"
            f"SERVER=DESKTOP-99IE66R;"
            f"DATABASE=PROJECT2;"
            f"Trusted_Connection=yes;"
            f"Encrypt=yes;"
            f"TrustServerCertificate=yes;"
        )
        return connection
    except Exception as e:
        messagebox.showerror("Database Error", f"Failed to connect to Database: {e}")
        return None


def validate_digit_input(value):
    if value.isdigit() or value == ""  or value == "Enter User ID":  # Allow digits and empty string
        return True
    return False


# Function to check login credentials
def check_credentials(username, user_id):
    
    connection = connect_to_db()
    if not connection:
        return None
    cursor=connection.cursor()
    try:
        # Check Student table
        query_student = """
        
        SELECT Person.*, Student.Student_ID, Student.Registration_Number, Student.Major, Student.Department_ID, Phone_Number.Phone_Number
        FROM    Student INNER JOIN
                Person ON Student.Person_ID = Person.Person_ID INNER JOIN
                Phone_Number ON Person.Person_ID = Phone_Number.Person_ID
        where Person.First_Name=? and Student.Student_ID =?

"""
        cursor.execute(query_student, (username, user_id))
        result = cursor.fetchone()
        
        if result:
            global student 
            student = {
                    'Person_ID':result[0],
                    'First_Name':f' {result[1]}',
                    'Mid_Name':f' {result[2]}',
                    'Last_Name':f' {result[3]}',
                    'Name':f' {result[1]} {result[2]} {result[3]} ',
                    'Gender':f' {result[4]} ',
                    'Birth_Date':f' {result[5]} ',
                    'Email':f' {result[6]} ',
                    'State':f' {result[7]} ',
                    'City':f' {result[8]} ',
                    'Street':f' {result[9]} ',
                    'Zip_Code':f' {result[10]} ',
                    'Student_ID':result[11],
                    'Registration_Number':result[12],
                    'Major':f' {result[13]} ',
                    'Department_ID':result[14],
                    'Phone_Number':result[15],
                    }
            return "student"

        # Check Instructor table
        query_instructor = """
        SELECT Person.*, Employee.EmployeeID, Employee.Salary, Employee.ManagerID, Instructor.InstructorID, Instructor.Degree, Instructor.StartDate, Instructor.DepartmentID, Phone_Number.Phone_Number
        FROM     Person INNER JOIN
                Employee ON Person.Person_ID = Employee.Person_ID INNER JOIN
                Instructor ON Employee.EmployeeID = Instructor.EmployeeID INNER JOIN
                Phone_Number ON Person.Person_ID = Phone_Number.Person_ID
        where Person.First_Name=? and Instructor.InstructorID =?
        """
        cursor.execute(query_instructor, (username, user_id))
        result = cursor.fetchone()
        
        
        if result:
            global instructor
            instructor = {
                    'Person_ID':result[0],
                    'First_Name':f' {result[1]}',
                    'Mid_Name':f' {result[2]}',
                    'Last_Name':f' {result[3]}',
                    'Name':f' {result[1]} {result[2]} {result[3]} ',
                    'Gender':f' {result[4]} ',
                    'Birth_Date':f' {result[5]} ',
                    'Email':f' {result[6]} ',
                    'State':f' {result[7]} ',
                    'City':f' {result[8]} ',
                    'Street':f' {result[9]} ',
                    'Zip_Code':f' {result[10]} ',
                    'EmployeeID':result[11],
                    'Salary':result[12],
                    'ManagerID':result[13],
                    'InstructorID':result[14],
                    'Degree':f' {result[15]} ',
                    'StartDate':f' {result[16]} ',
                    'Department_ID':result[17],
                    'Phone_Number':f'{result[18]}',
                    }
            return "instructor"

        return None
    finally:
        cursor.close()
        connection.close()

# Main Application Class
class UniversityApp(ctk.CTk):
    def __init__(self):
        super().__init__()

        self.title("University Login System")
        self.geometry("900x700+450+50")
        ctk.set_appearance_mode("dark")  # Options: "light", "dark", "system"
        self.resizable(False, False)

        global validate_command
        validate_command = self.register(validate_digit_input)

        # Configure grid layout
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(0, weight=1)

        # Container for Frames
        self.container = ctk.CTkFrame(self, corner_radius=0)
        self.container.grid(row=0, column=0, sticky="nsew")
        self.container.grid_columnconfigure(0, weight=1)
        self.container.grid_rowconfigure(0, weight=1)

        self.current_frame = None  # To keep track of the current frame
        self.show_frame(LoginFrame)  # Show the Login Frame initially

        self.show_frame(LoginFrame)  # Show the Login Frame initially

    def show_frame(self, frame_class):
        # Destroy the current frame if it exists
        if self.current_frame is not None:
            self.current_frame.destroy()

        # Create the new frame and display it
        self.current_frame = frame_class(self.container, self)
        self.current_frame.grid(row=0, column=0, sticky="nsew")

# Login Frame
class LoginFrame(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)

        self.controller = controller


        self.configure(fg_color="#7AB2D3")

        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0,weight=1)


        # Create a canvas widget inside the window
        canvas = Canvas(self, bg="#35498E", bd=0, highlightthickness=0)
        canvas.pack(fill="both", expand=True)

        # Load the image using PIL (replace the path with your image path)
        image_path = "D:/programming/Tkinter-Designer-master/Tkinter-Designer-master/Build/build4/build/assets/frame0/image_1.png"  # Replace with your image file path
        image = Image.open(image_path)

        # Function to resize the image dynamically and center it
        def resize_image(event):
            # Get the current size of the canvas
            canvas_width = event.width
            canvas_height = event.height

            # Resize the image to match the canvas size
            resized_image = image.resize((canvas_width, canvas_height))
            bg_image = ImageTk.PhotoImage(resized_image)

            # Calculate the position to center the image
            x_center = (canvas_width - resized_image.width) / 2
            y_center = (canvas_height - resized_image.height) / 2

            # Update the canvas with the new image centered
            canvas.create_image(x_center, y_center, image=bg_image, anchor="nw")

            # Store the image reference to prevent garbage collection
            canvas.image = bg_image

        # Bind the canvas resize event to the resize_image function
        canvas.bind("<Configure>", resize_image)

        

        


        self.username_entry = ctk.CTkEntry(
            canvas,
            bg_color="#795FA1",
            fg_color="#795FA1",  # Background color of the entry
            text_color="#000000",  # Text color
            placeholder_text="Enter Username",  # Placeholder text
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=126.0,
            height=27.0,
        )
        self.username_entry .place(
            x=388.5,
            y=331.5
        )

        self.user_id_entry = ctk.CTkEntry(canvas,
            bg_color="#775C97",
            fg_color="#775C97",
            text_color="#000000",  # Text color
            placeholder_text="Enter User ID",  # Placeholder text
            show="*",
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=126.0,
            height=27.0,
            validate="key",
            validatecommand=(validate_command, "%P")
        )
        self.user_id_entry.place(
            x=388.5,
            y=413.5
        )

        login_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            command=self.login,
            width=104.0,
            height=32.0,
            bg_color="#0D0F3B",
            fg_color="#363D81",
            hover_color="#27a551",
            text="Log In",
            font=("Kalam Regular",14)
        )
        login_button.place(
            x=399.0,
            y=487.0
        )

    


    def login(self):
        username = self.username_entry.get()
        user_id = self.user_id_entry.get()

        # self.username_entry.delete(0, 'end')
        # self.user_id_entry.delete(0, 'end')

        if not username or not user_id:
            messagebox.showwarning("Input Error", "Please enter both Username and ID")
            return
        role = check_credentials(username, user_id)
        if role == "student":
            messagebox.showinfo("Login Success", "Welcome Student!")
            self.controller.show_frame(StudentDashboardFrame)
        elif role == "instructor":
            messagebox.showinfo("Login Success", "Welcome Instructor!")
            self.controller.show_frame(InstructorDashboardFrame)
        else:
            messagebox.showerror("Login Failed", "Invalid Username or ID")






# Student Dashboard Frame
class StudentDashboardFrame(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)

        self.controller = controller

        self.configure(fg_color="#B9E5E8")


    
        # Create a canvas widget inside the window
        canvas = Canvas(self, bg="#35498E", bd=0, highlightthickness=0)
        canvas.pack(fill="both", expand=True)

        # Load the image using PIL (replace the path with your image path)
        image_path = "D:/Downloads/Frame 1 (1).png"  # Replace with your image file path
        image = Image.open(image_path)

        # Function to resize the image dynamically and center it
        def resize_image(event):
            # Get the current size of the canvas
            canvas_width = event.width
            canvas_height = event.height

            # Resize the image to match the canvas size
            resized_image = image.resize((canvas_width, canvas_height))
            bg_image = ImageTk.PhotoImage(resized_image)

            # Calculate the position to center the image
            x_center = (canvas_width - resized_image.width) / 2
            y_center = (canvas_height - resized_image.height) / 2

            # Update the canvas with the new image centered
            canvas.create_image(x_center, y_center, image=bg_image, anchor="nw")

            # Store the image reference to prevent garbage collection
            canvas.image = bg_image

        # Bind the canvas resize event to the resize_image function
        canvas.bind("<Configure>", resize_image)



        hello_label=ctk.CTkLabel(canvas,text=f"Hello,{student['First_Name']}",font=("Irish Grover",20),fg_color="#506291",bg_color="#506291")
        hello_label.place(x=12,y=119)

        
        # Load the image using PIL (replace the path with your image path)
        image_path2 = "D:\Downloads\image 1.png"  # Replace with your image file path
        image2 = Image.open(image_path2)
        resized_image2=image2.resize((35,35))

        student_icon = ImageTk.PhotoImage(resized_image2)


        student_icon_label=ctk.CTkLabel(canvas,image=student_icon,text="",fg_color="#506291",bg_color="#506291")
        student_icon_label.place(x=141,y=119)

        info_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=96,
            height=38,
            bg_color="#506291",
            fg_color="#363D81",
            hover_color="#27a551",
            text="Info",
            font=("Irish Grover",14),
            command=self.show_info
        )
        info_button.place(
            x=30,
            y=200
        )
        courses_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=96,
            height=38,
            bg_color="#506291",
            fg_color="#363D81",
            hover_color="#27a551",
            text="Courses",
            font=("Irish Grover",14),
            command=self.courses
        )
        courses_button.place(
            x=30,
            y=250
        )
        registration_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=96,
            height=38,
            bg_color="#506291",
            fg_color="#363D81",
            hover_color="#27a551",
            text="Registration",
            font=("Irish Grover",14),
            command=self.registration
        )
        registration_button.place(
            x=30,
            y=300
        )
        logOut_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=96,
            height=38,
            bg_color="#506291",
            fg_color="#363D81",
            hover_color="#27a551",
            text="LogOut",
            command=lambda: controller.show_frame(LoginFrame),
            font=("Irish Grover",14)
        )
        logOut_button.place(
            x=30,
            y=350
        )

        self.content_frame =ctk.CTkFrame(canvas,fg_color="#929DBB",bg_color="transparent",width=725,height=605)
        self.content_frame.place(x=177,y=95,anchor="nw")
        self.show_info()


    def show_info(self):
        for widget in self.content_frame.winfo_children():
            widget.destroy()

        info_frame=ctk.CTkFrame(self.content_frame,fg_color="#929DBB",bg_color="transparent",width=725,height=605)
        info_frame.pack(fill="both", expand=True)

        info_label = ctk.CTkLabel(info_frame, text=f"Name: {student['Name']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=120)
    
    
        info_label = ctk.CTkLabel(info_frame, text=f"ID: {student['Student_ID']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=160)
    
        info_label = ctk.CTkLabel(info_frame, text=f"Email: {student['Email']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=200)

        info_label = ctk.CTkLabel(info_frame, text=f"Major: {student['Major']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=240)
    
        info_label = ctk.CTkLabel(info_frame, text=f"Phone: {student['Phone_Number']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=280)
    
    def courses(self):
        for widget in self.content_frame.winfo_children():
            widget.destroy()

        courses_frame=ctk.CTkScrollableFrame(self.content_frame,fg_color="#929DBB",bg_color="transparent",width=725,height=605)
        courses_frame.pack(fill="both", expand=True)

        connection = connect_to_db()
        if not connection:
            return
        cursor = connection.cursor()
        query = """
        SELECT Course.Name, Course.CreditHours, Person.First_Name + ' '+ Person.Last_Name As instructor_name, Enrollment.Grade
        FROM     Enrollment INNER JOIN
                Course ON Enrollment.Course_ID = Course.Course_ID INNER JOIN
                Instructor ON Enrollment.Instructor_ID = Instructor.InstructorID INNER JOIN
                Employee ON Instructor.EmployeeID = Employee.EmployeeID INNER JOIN
                Person ON Employee.Person_ID = Person.Person_ID
				where Enrollment.Student_ID=?
        """
        cursor.execute(query, (student['Student_ID'],))
        courses = cursor.fetchall()
        cursor.close()
        connection.close()

        for course in courses:

            course_frame2 = ctk.CTkFrame(courses_frame, fg_color="#7AB2D3")
            course_frame2.pack(pady=10,ipadx=5,fill="x")

            course_label = ctk.CTkLabel(course_frame2,fg_color="#7AB2D3" ,text=f"Course: {course[0]}\nCredit Hours: {course[1]}\nInstructor: {course[2]}\nGrade: {course[3]}", font=("Irish Grover", 18), text_color="#000000")
            course_label.pack(pady=10)

    def registration(self):
        for widget in self.content_frame.winfo_children():
            widget.destroy()
        
        registration_frame=ctk.CTkScrollableFrame(self.content_frame,fg_color="#929DBB",bg_color="transparent",width=725,height=605)
        registration_frame.pack(fill="both", expand=True)


        connection = connect_to_db()
        if not connection:
            return
        cursor = connection.cursor()
        query = """
        SELECT c.Course_ID, c.Name, c.CreditHours,
        CASE WHEN e.Course_ID IS NOT NULL THEN 'Delete' ELSE 'Add' END AS Action
        FROM Course c
        LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID AND e.Student_ID = ?
        """
        cursor.execute(query, (student['Student_ID'],))
        courses = cursor.fetchall()
        cursor.close()
        connection.close()

        for course in courses:
            course_frame = ctk.CTkFrame(registration_frame, fg_color="#7AB2D3")
            course_frame.pack(pady=10, padx=10, fill="x")

            course_label = ctk.CTkLabel(course_frame, text=f"Course: {course[1]}\nCredit Hours: {course[2]}", font=("Irish Grover", 18), text_color="#000000")
            course_label.pack(side="left", padx=10)

            action = course[3]
            button_text = "Add" if action == "Add" else "Delete"
            button_color = "#35498E" if action == "Add" else "#FF0000"
            button_command = lambda c_id=course[0], act=action.lower(): self.toggle_course(c_id, act)

            action_button = ctk.CTkButton(course_frame, text=button_text, fg_color=button_color, command=button_command)
            action_button.pack(side="right", padx=10)
        

    def toggle_course(self, course_id, action):
        current_time = datetime.now()
        connection = connect_to_db()
        if not connection:
            return
        cursor = connection.cursor()
        if action == "add":
            instructors_id_query = """
        SELECT Instructor.InstructorID
        FROM Instructor
        INNER JOIN Department ON Instructor.DepartmentID = Department.DepartmentID
        INNER JOIN Belonging ON Department.DepartmentID = Belonging.DepartmentID
        WHERE Belonging.CourseID =?
    """
            cursor.execute(instructors_id_query, (course_id))
            instructors_id = cursor.fetchall()
    
            # Ensure there are instructors available
            if instructors_id:
                # Select a random instructor ID
                random_instructor_id = random.choice(instructors_id)[0]  # [0] to get the first element from the tuple
    
                query = """INSERT INTO Enrollment (Enroll_Date,Course_ID, Student_ID,Instructor_ID) VALUES (?,?,?,?)"""
    
                cursor.execute(query, (current_time ,course_id, student['Student_ID'],random_instructor_id))
    
                connection.commit()
                messagebox.showinfo("Success", "Course added successfully!")
    
        elif action == "delete":
            query = "DELETE FROM Enrollment WHERE Course_ID = ? AND Student_ID = ?"
            cursor.execute(query, (course_id, student['Student_ID']))
            connection.commit()
            messagebox.showinfo("Success", "Course deleted successfully!")
        
        cursor.close()
        connection.close()
        self.registration()


# Instructor Dashboard Frame
class InstructorDashboardFrame(ctk.CTkFrame):
    def __init__(self, parent, controller):
        super().__init__(parent)

        self.controller = controller

                # Create a canvas widget inside the window
        canvas = Canvas(self, bg="#35498E", bd=0, highlightthickness=0)
        canvas.pack(fill="both", expand=True)

        # Load the image using PIL (replace the path with your image path)
        image_path = "D:/Downloads/Frame 1 (1).png"  # Replace with your image file path
        image = Image.open(image_path)

        # Function to resize the image dynamically and center it
        def resize_image(event):
            # Get the current size of the canvas
            canvas_width = event.width
            canvas_height = event.height

            # Resize the image to match the canvas size
            resized_image = image.resize((canvas_width, canvas_height))
            bg_image = ImageTk.PhotoImage(resized_image)

            # Calculate the position to center the image
            x_center = (canvas_width - resized_image.width) / 2
            y_center = (canvas_height - resized_image.height) / 2

            # Update the canvas with the new image centered
            canvas.create_image(x_center, y_center, image=bg_image, anchor="nw")

            # Store the image reference to prevent garbage collection
            canvas.image = bg_image

        # Bind the canvas resize event to the resize_image function
        canvas.bind("<Configure>", resize_image)



        hello_label=ctk.CTkLabel(canvas,text=f"Hello,{instructor['First_Name']}",font=("Irish Grover",20),fg_color="#506291",bg_color="#506291")
        hello_label.place(x=12,y=119)

        
        # Load the image using PIL (replace the path with your image path)
        image_path2 = "D:/Downloads/image.png"  # Replace with your image file path
        image2 = Image.open(image_path2)
        resized_image2=image2.resize((35,35))

        instructor_icon = ImageTk.PhotoImage(resized_image2)


        instructor_icon_label=ctk.CTkLabel(canvas,image=instructor_icon,text="",fg_color="#506291",bg_color="#506291")
        instructor_icon_label.place(x=141,y=119)

        info_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=96,
            height=38,
            bg_color="#506291",
            fg_color="#363D81",
            hover_color="#27a551",
            text="Info",
            font=("Irish Grover",14),
            command=self.show_info
        )
        info_button.place(
            x=30,
            y=200
        )
        courses_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=96,
            height=38,
            bg_color="#506291",
            fg_color="#363D81",
            hover_color="#27a551",
            text="Courses",
            font=("Irish Grover",14),
            command=self.show_courses
        )
        courses_button.place(
            x=30,
            y=250
        )
        
        logOut_button = ctk.CTkButton(
            canvas,
            corner_radius=20,  # Rounded corners
            border_width=0,  # No border stroke
            width=96,
            height=38,
            bg_color="#506291",
            fg_color="#363D81",
            hover_color="#27a551",
            text="LogOut",
            command=lambda: controller.show_frame(LoginFrame),
            font=("Irish Grover",14)
        )
        logOut_button.place(
            x=30,
            y=300
        )

        self.content_frame =ctk.CTkFrame(canvas,fg_color="#929DBB",bg_color="transparent",width=725,height=605)
        self.content_frame.place(x=177,y=95,anchor="nw")
        self.show_info()


    def show_info(self):
        for widget in self.content_frame.winfo_children():
            widget.destroy()

        info_frame=ctk.CTkFrame(self.content_frame,fg_color="#929DBB",bg_color="transparent",width=725,height=605)
        info_frame.pack(fill="both", expand=True)

        info_label = ctk.CTkLabel(info_frame, text=f"Name: {instructor['Name']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=120)
    
    
        info_label = ctk.CTkLabel(info_frame, text=f"ID: {instructor['InstructorID']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=160)

    
        info_label = ctk.CTkLabel(info_frame, text=f"Degree: {instructor['Degree']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=200)
        
    
        info_label = ctk.CTkLabel(info_frame, text=f"Email: {instructor['Email']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=240)

        info_label = ctk.CTkLabel(info_frame, text=f"Salary: {instructor['Salary']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=280)

        info_label = ctk.CTkLabel(info_frame, text=f"StartDate: {instructor['StartDate']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=320)

        info_label = ctk.CTkLabel(info_frame, text=f"State: {instructor['State']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=360)

        info_label = ctk.CTkLabel(info_frame, text=f"City: {instructor['City']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=400)

        info_label = ctk.CTkLabel(info_frame, text=f"Phone: {instructor['Phone_Number']}", font=("Irish Grover", 25), text_color="#363D81")
        info_label.place(x=60,y=440)


    def show_courses(self):
        """Display a list of courses taught by the instructor."""
        for widget in self.content_frame.winfo_children():
            widget.destroy()


        courses_frame=ctk.CTkScrollableFrame(self.content_frame,fg_color="#929DBB",bg_color="transparent",width=725,height=605)
        courses_frame.pack(fill="both", expand=True)

        connection = connect_to_db()
        if not connection:
            return
        cursor = connection.cursor()

        query = """
        SELECT c.Name, c.CreditHours, COUNT(e.Student_ID) AS EnrolledStudents
        FROM Course c
        JOIN Enrollment e ON c.Course_ID = e.Course_ID
        WHERE e.Instructor_ID = ?
        GROUP BY c.Name, c.CreditHours
        """
        cursor.execute(query, (instructor['InstructorID'],))
        courses = cursor.fetchall()
        cursor.close()
        connection.close()

        for course in courses:
            course_frame = ctk.CTkFrame(courses_frame, fg_color="#7AB2D3", corner_radius=10)
            course_frame.pack(pady=10, padx=10, fill="x")

            course_label = ctk.CTkLabel(
                course_frame,
                text=f"Course: {course[0]}\nCredit Hours: {course[1]}\nEnrolled Students: {course[2]}",
                font=("Irish Grover", 16),
                text_color="#000000",
            )
            course_label.pack(padx=10, pady=5)




# Run the App

app = UniversityApp()
app.mainloop()


