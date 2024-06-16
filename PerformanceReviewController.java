package com.hrms.controller;

import com.hrms.model.PerformanceReview;
import com.hrms.service.PerformanceReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class PerformanceReviewController {

    @Autowired
    private PerformanceReviewService performanceReviewService;

    @GetMapping
    public List<PerformanceReview> getAllReviews() {
        return performanceReviewService.getAllReviews();
    }

    @GetMapping("/{id}")
    public ResponseEntity<PerformanceReview> getReviewById(@PathVariable Long id) {
        PerformanceReview review = performanceReviewService.getReviewById(id);
        return ResponseEntity.ok(review);
    }

    @PostMapping
    public PerformanceReview createReview(@RequestBody PerformanceReview review) {
        return performanceReviewService.createReview(review);
    }

    @PutMapping("/{id}")
    public ResponseEntity<PerformanceReview> updateReview(@PathVariable Long id, @RequestBody PerformanceReview reviewDetails) {
        PerformanceReview updatedReview = performanceReviewService.updateReview(id, reviewDetails);
        return ResponseEntity.ok(updatedReview);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteReview(@PathVariable Long id) {
        performanceReviewService.deleteReview(id);
        return ResponseEntity.noContent().build();
    }
}
