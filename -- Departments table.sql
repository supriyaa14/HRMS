-- Departments table
CREATE TABLE Departments (
    departmentId INT AUTO_INCREMENT PRIMARY KEY,
    departmentName VARCHAR(100) NOT NULL
);

-- Roles table
CREATE TABLE Roles (
    roleId INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(100) NOT NULL
);

-- Employees table
CREATE TABLE Employees (
    employeeId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    departmentId INT,
    roleId INT,
    FOREIGN KEY (departmentId) REFERENCES Departments(departmentId),
    FOREIGN KEY (roleId) REFERENCES Roles(roleId)
);

-- Performance Reviews table
CREATE TABLE Reviews (
    reviewId INT AUTO_INCREMENT PRIMARY KEY,
    employeeId INT NOT NULL,
    reviewDate DATE NOT NULL,
    comments TEXT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (employeeId) REFERENCES Employees(employeeId)
);

-- Insert sample data

-- Departments sample data
INSERT INTO Departments (departmentName) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

-- Roles sample data
INSERT INTO Roles (roleName) VALUES
('Software Engineer'),
('HR Manager'),
('Accountant'),
('Marketing Specialist');

-- Employees sample data
INSERT INTO Employees (firstName, lastName, email, phone, departmentId, roleId) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 1, 1),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 2, 2),
('Michael', 'Johnson', 'michael.johnson@example.com', '555-123-4567', 3, 3),
('Emily', 'Williams', 'emily.williams@example.com', '333-987-6543', 4, 4),
('David', 'Brown', 'david.brown@example.com', '222-333-4444', 1, 1),
('Sarah', 'Miller', 'sarah.miller@example.com', '777-888-9999', 2, 2),
('Kevin', 'Davis', 'kevin.davis@example.com', '111-222-3333', 3, 3),
('Jessica', 'Garcia', 'jessica.garcia@example.com', '444-555-6666', 4, 4);

-- Performance Reviews sample data
INSERT INTO Reviews (employeeId, reviewDate, comments, rating) VALUES
(1, '2024-06-15', 'Good performance', 4),
(2, '2024-06-16', 'Excellent work!', 5),
(3, '2024-06-17', 'Satisfactory performance', 3),
(4, '2024-06-18', 'Needs improvement in communication skills', 2),
(5, '2024-06-19', 'Met all project deadlines', 5),
(6, '2024-06-20', 'Excellent attention to detail', 4),
(7, '2024-06-21', 'Needs improvement in time management', 2),
(8, '2024-06-22', 'Consistently exceeds expectations', 5);
