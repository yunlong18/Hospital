package cn.zhang;

import cn.zhang.common.utils.JsonUtils;

import java.util.List;

public class JsonToListTest {

    public static void main(String[] args) {
        String s = null;
        List<Object> objects = JsonUtils.jsonToList(s, Object.class);
        System.out.println(objects);
    }


}
