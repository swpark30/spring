package com.spring_boot.projectEx.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot.projectEx.model.ProductVO;
import com.spring_boot.projectEx.service.ProductService;

@Controller
public class ProductComtroller {
	@Autowired
	ProductService prdService;
	
	// 카테고리별 상품 조회 요청 
	@RequestMapping("product/productListCtg/{ctgId}")
	public String viewProductCtgList(@PathVariable String ctgId, Model model) {
		ArrayList<ProductVO> prdList = prdService.listCtgProduct(ctgId);
		model.addAttribute("prdList", prdList);
		return "product/productListCtgView";
	}
	
	// 상품 상세 정보 조회 /product/productDetailView
	@RequestMapping("/product/productDetailView/{prdNo}")
	public String detailViewProduct(@PathVariable String prdNo, Model model) {
		//상품 번호 전달, 해당 상품의 정보 반환
		ProductVO prd = prdService.detailViewProduct(prdNo);
		model.addAttribute("prd", prd);
		
		return "product/productDetailView";
	}
}
