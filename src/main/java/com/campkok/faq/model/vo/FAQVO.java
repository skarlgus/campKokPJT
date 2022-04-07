package com.campkok.faq.model.vo;

import lombok.Data;

@Data
public class FAQVO {
	private int faqNo;
	private String userId;
	private String faqUser;
	private String faqTitle;
	private String faqContents;
	private String faqDate;
}
