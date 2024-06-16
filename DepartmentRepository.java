package com.hrms.repository;

import com.hrms.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {
    // Custom query to find department by name
    @Query("SELECT d FROM Department d WHERE d.name = :name")
    Department findDepartmentByName(@Param("name") String name);
}
