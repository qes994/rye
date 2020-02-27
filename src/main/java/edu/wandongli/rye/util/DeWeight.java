package edu.wandongli.rye.util;

import java.util.ArrayList;
import java.util.List;

public class DeWeight {

    public static List removeDuplicate(List list) {
        for (int i = 0; i < list.size() - 1; i++) {
            for (int j = list.size() - 1; j > i; j--) {
                if (list.get(j).equals(list.get(i))) {
                    list.remove(j);
                }
            }
        }
        return list;
    }

    public static void main(String[] args) {
        List books = new ArrayList();
        //向books集合中添加三个元素
        books.add(new String("轻量级J2EE企业应用实战"));
        books.add(new String("Struts2权威指南"));
        books.add(new String("Struts2权威指南"));
        books.add(new String("基于J2EE的Ajax宝典"));
        books.add(new String("基于J2EE的Ajax宝典"));
        books.add(new String("基于J2EE的Ajax宝典"));
        List list = DeWeight.removeDuplicate(books);
        System.out.println(list.toString());
    }


}
