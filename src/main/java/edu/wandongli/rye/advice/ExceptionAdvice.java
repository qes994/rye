package edu.wandongli.rye.advice;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import edu.wandongli.rye.exception.ServiceException;
import edu.wandongli.rye.util.ResultObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.List;
import java.util.Set;

@Slf4j
@RestControllerAdvice
public class ExceptionAdvice {

    @ExceptionHandler({MethodArgumentNotValidException.class})
    public ResultObject mothodResultNotValidException(Exception ex, HttpServletRequest request) {
        MethodArgumentNotValidException c = (MethodArgumentNotValidException) ex;
        List<ObjectError> errors = c.getBindingResult().getAllErrors();
        log.error(errors.get(0).getDefaultMessage());
        return new ResultObject(0, errors.get(0).getDefaultMessage());
    }

    @ExceptionHandler({ConstraintViolationException.class})
    public ResultObject ConstraintViolationException(Exception ex, HttpServletRequest request) {
        ConstraintViolationException cve = (ConstraintViolationException) ex;
        Set<ConstraintViolation<?>> set = cve.getConstraintViolations();
        ConstraintViolation<?> next = set.iterator().next();
        String msg = next.getMessage();
        return new ResultObject(0, msg);
    }

    @ExceptionHandler({ServiceException.class})
    public ResultObject handleException(Exception ex, HttpServletRequest request) {

        return new ResultObject(0, ex.getMessage());
    }

    @ExceptionHandler({InvalidFormatException.class})
    public ResultObject InvalidFormatException(InvalidFormatException ex, HttpServletRequest request) {
        return new ResultObject(0, ex.getMessage());
    }


}
