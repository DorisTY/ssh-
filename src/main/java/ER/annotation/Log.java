package ER.annotation;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * @Title:
 * @Description:
 * @author:
 * @date
 * @update
 */
@Target({ ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface Log {
	String name() default "";

}
