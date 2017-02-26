package org.prototype.service;

import org.prototype.domain.Test_boardVO;
import org.springframework.web.bind.annotation.CookieValue;

public interface BoardService {

	void insert(Test_boardVO vo);

}