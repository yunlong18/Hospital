package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TOrder;

public interface OrderManagerService {
    PageBean<TOrder> getPageBean(QueryVO queryVo);
    TOrder getOrderById(Long id);
    E3Result deleteOrderByIds(String ids);
    void saveOrder(TOrder order);
    E3Result updateState(Integer state, Long id);
    E3Result updateVisitState(Integer visitState, Long id);
    E3Result updateDoctorMessage(Long id, String doctorMessage);
}
