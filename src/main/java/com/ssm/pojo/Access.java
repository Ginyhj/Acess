package com.ssm.pojo;

import lombok.Data;

@Data
public class Access {
    private int id;
    private String  principal;
    private String supplier;
    private String brand;
    private int hospital_id;
    private int status;
    private String  add_time;

    private String name;


}
