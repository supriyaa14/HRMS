package com.hrms.repository;

import com.hrms.model.PerformanceReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PerformanceReviewRepository extends JpaRepository<PerformanceReview, Long> {
    // Custom query to find performance reviews by employee
    @Query("SELECT pr FROM PerformanceReview pr WHERE pr.employee.id = :employeeId")
    List<PerformanceReview> findReviewsByEmployee(@Param("employeeId") Long employeeId);

    // Custom query to find performance reviews by date range
    @Query("SELECT pr FROM PerformanceReview pr WHERE pr.reviewDate BETWEEN :startDate AND :endDate")
    List<PerformanceReview> findReviewsByDateRange(@Param("startDate") java.util.Date startDate, @Param("endDate") java.util.Date endDate);
}
