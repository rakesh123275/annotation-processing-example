// File: ExampleProcessor.java
package com.example;

import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import javax.tools.Diagnostic;
import java.util.Set;

@SupportedAnnotationTypes("com.example.ExampleAnnotation")
@SupportedSourceVersion(SourceVersion.RELEASE_17) // adjust to your JDK
public class ExampleProcessor extends AbstractProcessor {

    @Override
    public boolean process(Set<? extends TypeElement> annotations,
                           RoundEnvironment roundEnv) {
        for (Element element : roundEnv.getElementsAnnotatedWith(ExampleAnnotation.class)) {
            ExampleAnnotation annotation = element.getAnnotation(ExampleAnnotation.class);
            processingEnv.getMessager().printMessage(
                Diagnostic.Kind.NOTE,
                "Found @ExampleAnnotation with value: " + annotation.value()
            );
        }
        return true; // we handled this annotation
    }
}

