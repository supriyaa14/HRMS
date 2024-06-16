package com.hrms.repository;

import com.hrms.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    // Custom query to find employees by department
    @Query("SELECT e FROM Employee e WHERE e.department.id = :departmentId")
    List<Employee> findEmployeesByDepartment(@Param("departmentId") Long departmentId);

    // Custom query to find employees by role
    @Query("SELECT e FROM Employee e WHERE e.role.id = :roleId")
    List<Employee> findEmployeesByRole(@Param("roleId") Long roleId);

    // Custom query to find employees by name (first name or last name)
    @Query("SELECT e FROM Employee e WHERE e.firstName LIKE %:name% OR e.lastName LIKE %:name%")
    List<Employee> findEmployeesByName(@Param("name") String name);
}
