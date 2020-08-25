package com.hrmssm.controller;

import com.hrmssm.pojo.Employee;
import com.hrmssm.service.EmployeeService;
import com.hrmssm.vo.PageInfo;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;


    @RequestMapping(value="/employees",method= RequestMethod.GET)
    @ResponseBody
    public PageInfo<Employee> students(Map<String,Object> map){
        List<Employee> employees = employeeService.getEmployees ();
        PageInfo<Employee> pageInfo = new PageInfo<>();
        pageInfo.setRecordsTotal(employees.size());
        pageInfo.setRecordsFiltered(employees.size());
        pageInfo.setData(employees);
        pageInfo.setDraw(1);
        return pageInfo;
    }
    /*public void students(Map<String,Object> map, HttpServletResponse response){
        List<Employee> employees = employeeService.getEmployees ();
        PageInfo<Employee> pageInfo = new PageInfo<>();
        pageInfo.setRecordsTotal(employees.size());
        pageInfo.setRecordsFiltered(employees.size());
        pageInfo.setData(employees);
        pageInfo.setDraw(1);
        try {
            response.getWriter ().write (pageInfo.toString ());
        } catch (IOException e) {
            e.printStackTrace ();
        }
    }*/

    @RequestMapping(value="/employee/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Employee getEmpById(@PathVariable("id") Integer id){
        Employee employeeById = employeeService.getEmployeeById (id);
        return employeeById;
    }

    @RequestMapping(value="/employee/{id}",method=RequestMethod.DELETE)
    @ResponseBody
    public String del(@PathVariable("id") Integer id){
        boolean isDel = employeeService.deleteEmployee (id);
        if(isDel){
            return "success";
        }else{
            return "fail";
        }
    }

    @RequestMapping(value="/employee",method=RequestMethod.POST)
    @ResponseBody
    public String add(Employee employee,
                      @RequestParam("imageFile") MultipartFile file,
                      HttpServletRequest request) throws IOException{
        /*创建保存图片的文件夹*/
        String uploadPath = request.getServletContext().getRealPath("/upload");
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        if (!file.isEmpty()) {
            /*获取上传图片的原始文件名，例如 XXX.jpg */
            String originalFilename = file.getOriginalFilename();
            /*获取图片的后缀名，例如jpg*/
            String suffix = originalFilename.split("\\.")[1];
            /*获取一个uuid*/
            String uuid = UUID.randomUUID().toString();
            /*拼装保存图片的名字*/
            String imageName = uuid.replace("-", "") + "." + suffix;
            /*保存图片*/
            file.transferTo(new File(uploadPath + File.separator + imageName));
            /*设置保存学生对象中image属性的值，这里保存的是图片名字*/
            employee.setImage(imageName);
        }
        Integer result = employeeService.addEmployee (employee);
        if (result == 1) {
            return "success";
        } else {
            return "failure";
        }
    }
    /*value="/employee/{id}" method=HttpRequestMethod.POST*/
    @RequestMapping(value="/employee/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public String update(Employee employee,
                         @PathVariable("id") Integer id,
                         @RequestParam("imageFile") MultipartFile file,
                         HttpServletRequest request) throws IOException{
        /*创建保存图片的文件夹*/
        String uploadPath = request.getServletContext().getRealPath("/upload");
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        if (!file.isEmpty()) {
            /*获取上传图片的原始文件名，例如 XXX.jpg */
            String originalFilename = file.getOriginalFilename();
            /*获取图片的后缀名，例如jpg*/
            String suffix = originalFilename.split("\\.")[1];
            /*获取一个uuid*/
            String uuid = UUID.randomUUID().toString();
            /*拼装保存图片的名字*/
            String imageName = uuid.replace("-", "") + "." + suffix;
            /*保存图片*/
            file.transferTo(new File(uploadPath + File.separator + imageName));
            /*设置保存学生对象中image属性的值，这里保存的是图片名字*/
            employee.setImage(imageName);
        }
        employee.setId(id);
        Integer result = employeeService.editEmployee (employee);
        if (result == 1) {
            return "success";
        } else {
            return "failure";
        }
    }

    @RequestMapping(value="/toGenerate",method = RequestMethod.GET)
    public String toGenerate(){
        return "generate";
    }

    @RequestMapping(value="/toMain", method=RequestMethod.GET)
    public String toMain(){
        return "main";
    }

    @RequestMapping(value="/toEdit/{id}", method=RequestMethod.GET)
    public String toEdit(@PathVariable("id") Integer id,
                         Map<String,Object> map){
        map.put("varId",id);
        return "edit";
    }
}