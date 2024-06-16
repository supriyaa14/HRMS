package com.hrms.service;

import com.hrms.model.PerformanceReview;
import com.hrms.repository.PerformanceReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PerformanceReviewService {

    @Autowired
    private PerformanceReviewRepository performanceReviewRepository;

    public List<PerformanceReview> getAllReviews() {
        return performanceReviewRepository.findAll();
    }

    public PerformanceReview getReviewById(Long id) {
        return performanceReviewRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Review not found"));
    }

    public PerformanceReview createReview(PerformanceReview review) {
        return performanceReviewRepository.save(review);
    }

    public PerformanceReview updateReview(Long id, PerformanceReview reviewDetails) {
        PerformanceReview review = getReviewById(id);
        review.setReviewDate(reviewDetails.getReviewDate());
        review.setComments(reviewDetails.getComments());
        return performanceReviewRepository.save(review);
    }

    public void deleteReview(Long id) {
        PerformanceReview review = getReviewById(id);
        performanceReviewRepository.delete(review);
    }
}
