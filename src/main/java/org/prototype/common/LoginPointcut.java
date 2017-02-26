package org.prototype.common;

import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
public class LoginPointcut {

	// within명시자는 특정 타입에 속하는 메서드를 Pointcut으로 설정할 때 사용된다
	@Pointcut("within(org.prototype.service.*)")
	public void loginPoint(){};
	
}
