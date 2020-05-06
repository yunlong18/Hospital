package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TFeedback;

public interface FeedManagerService {
    PageBean<TFeedback> getPageBean(QueryVO queryVO);
    E3Result deleteFeedbackByIds(String ids);
    E3Result deleteFeedbackById(Long id);
}
