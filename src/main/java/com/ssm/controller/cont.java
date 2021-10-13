package com.ssm.controller;

import com.ssm.pojo.Access;
import com.ssm.pojo.Buiding;
import com.ssm.service.AccessService;
import com.ssm.service.BuidingService;
import com.ssm.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class cont {
    @Resource
    AccessService service;
    @Resource
    BuidingService service1;


    @RequestMapping(value = "/show",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<Buiding> getAll(){
        List<Buiding> all = service1.getAll();
        return all;
    }

    @RequestMapping("/page")
    public String getPagr(@RequestParam(value = "hospital_id",required = true,defaultValue = "-1")int hospital_id,
                          @RequestParam(value = "pageIndex",required = true,defaultValue = "1")int pageIndex,
                          Model model){
        Page<Access> page = service.getPage(hospital_id, pageIndex, 2);
        model.addAttribute("page",page);
        return "index";
    }

    @RequestMapping("/add")
    public String add(Access a){
        int add = service.add(a);
        if(add>0){
            return "redirect:/index.jsp";
        }else{
            return "redirect:/add.jsp";
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(int id){
        int update = service.update(id);
        if(update>0){
            return "ok";
        }else{
            return "no";
        }

    }



}
