package com.tyt.bankmanagersystem;


import org.junit.jupiter.api.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.boot.test.context.SpringBootTest;

import javax.jws.Oneway;
import java.util.List;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/8
 */
@SpringBootTest
public class ProductTest {


    @Test
    void test(){

        Animal<Meat> objectAnimal = new Animal<>();
        objectAnimal.setFood(new Meat());
        System.out.println(objectAnimal.getFood().getI());
        Animal<grass> animal = new Animal<>();
        BeanUtils.copyProperties(objectAnimal,animal);
        System.out.println(animal.getFood().getI());

    }
}


class Animal<T>{
    private T food;

    public T getFood() {
        return food;
    }

    public void setFood(T food) {
        this.food = food;
    }
}

class Meat{
    private Integer i = 1;

    public Integer getI() {
        return i;
    }

    public void setI(Integer i) {
        this.i = i;
    }
}

class grass{
    private Integer i = 2;

    public Integer getI() {
        return i;
    }

    public void setI(Integer i) {
        this.i = i;
    }
}