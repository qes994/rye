package edu.wandongli.rye.util;

public class ResultObject {

    private int code;
    private String msg;
    private Object object;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public ResultObject() {
        super();
        // TODO Auto-generated constructor stub
    }

    public ResultObject(int code, String msg, Object object) {
        super();
        this.code = code;
        this.msg = msg;
        this.object = object;
    }

    public ResultObject(int code, Object object) {
        this.code = code;
        this.object = object;
    }

    public ResultObject(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


}
