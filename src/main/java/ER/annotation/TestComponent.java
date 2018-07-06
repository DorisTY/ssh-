package ER.annotation;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * @Title: 自定义注解
 * @Description:
 * @author:
 * @date
 * @update
 */
@Target({ ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface TestComponent {
	String value() default "";

}
