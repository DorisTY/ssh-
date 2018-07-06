package ER.annotation;

import java.lang.annotation.Annotation;

/**
 * @Title:
 * @Description:
 * @author:
 * @date
 * @update
 */
public class AbsTestComponent implements TestComponent {
	@Override
	public String value() {
		return null;
	}

	/**
	 * Returns the annotation type of this annotation.
	 */
	@Override
	public Class<? extends Annotation> annotationType() {
		return null;
	}
}
