package com.maktub.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回类
 * @author Ddr
 * @create 2021-05-10 16:32
 */
public class Msg {

    //状态码 100-失败    200-成功  101-验证码错误
    private int code;

    //提示信息
    private String msg;

    private long count;

    //用户返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<String, Object>();

    public static Msg vertifyError(){
        Msg result = new Msg();
        result.setCode(101);
        result.setMsg("验证码错误");
        return result;
    }

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理成功");
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理失败");
        return result;
    }

    public Msg add(String key, Object value){
        this.getExtend().put(key,value);
        return this;
    }

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

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", extend=" + extend +
                '}';
    }
}
