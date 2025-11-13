//
//  BannerView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class BannerView: BaseUIView {
    
    // MARK: - Properties
    
    private let bannerImages = ["img_banner_1", "img_banner_2", "img_banner_3"]
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.bounces = false
        $0.isDirectionalLockEnabled = true
    }
    
    private let pageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = .baeminBlack
        $0.pageIndicatorTintColor = .baeminGray300
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        addSubviews(scrollView, pageControl)
        setupBanners()
        scrollView.delegate = self
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview() 
        }
        
        pageControl.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupBanners() {
        pageControl.numberOfPages = bannerImages.count
        
        var previousView: UIView?
        for imageName in bannerImages {
            let imageView = UIImageView().then {
                $0.image = UIImage(named: imageName)
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
            }
            
            scrollView.addSubview(imageView)
            imageView.snp.makeConstraints {
                $0.height.equalTo(114)
                $0.width.equalTo(self.snp.width)
                
                if let prev = previousView {
                    $0.leading.equalTo(prev.snp.trailing)
                } else {
                    $0.leading.equalToSuperview()
                }
            }
            previousView = imageView
        }
        
        previousView?.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }
    }
}

// MARK: - UIScrollViewDelegate

extension BannerView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        pageControl.currentPage = pageIndex
    }
}
