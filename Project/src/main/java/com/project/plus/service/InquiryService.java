package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.InquiryVO;

public interface InquiryService {
   
   void inquiryForm(InquiryVO vo);
   void writeInquiry(InquiryVO vo);
   InquiryVO editInquiryForm(InquiryVO vo);
   void editInquiry(InquiryVO vo);
   void deleteInquiry(InquiryVO vo);

   InquiryVO getInquiry(InquiryVO vo);

   public List<InquiryVO> getInquiryList(CriteriaMem cri) throws Exception;
   public int inquiryListCount(CriteriaMem cri) throws Exception;
}