package com.hrmssm.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Employee {
    private int id;
    private String e_no;
    private String name;
    private String password;/*@DateTimeFormat指定请求中日期参数的格式，springmvc默认格式是yyyy/MM/dd */
    private Integer gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private double salary;
    private Department department;
    private String image;

    public Employee() {
    }

    public Employee(int id, String e_no, String name, String password, Integer gender, Date birthday, double salary, Department department, String image) {
        this.id = id;
        this.e_no = e_no;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.birthday = birthday;
        this.salary = salary;
        this.department = department;
        this.image = image;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Department getDepartment() {
        return department;
    }

    public String getImage() {
        return image;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public void setImage(String image) {
        this.image = image;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getE_no() {
        return e_no;
    }

    public void setE_no(String e_no) {
        this.e_no = e_no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" + "e_no='" + e_no + '\'' + ", name='" + name + '\'' + ", password='" + password + '\'' + ", birthday=" + birthday + ", salary=" + salary + '}';
    }
}
