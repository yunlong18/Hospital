package cn.zhang.service.impl;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.mapper.TFeedbackMapper;
import cn.zhang.pojo.*;
import cn.zhang.service.FeedManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedManagerServiceImpl implements FeedManagerService {

    @Autowired
    private TFeedbackMapper feedbackMapper;

    @Override
    public PageBean<TFeedback> getPageBean(QueryVO queryVO) {
        TFeedbackExample example = new TFeedbackExample();
        if (queryVO != null) {
            if (queryVO.getCurrentPage() == null || "".equals(queryVO.getCurrentPage())) {
                queryVO.setCurrentPage(1);
            }
            if (queryVO.getPageSize() == null || "".equals(queryVO.getPageSize())) {
                queryVO.setPageSize(10);
            }
            if (StringUtils.isNotBlank(queryVO.getUserTel())){
                example.createCriteria().andPhoneEqualTo(queryVO.getUserTel());
            }
            PageBean<TFeedback> pageBean = new PageBean(queryVO.getCurrentPage(), queryVO.getPageSize());
            PageHelper pageHelper = new PageHelper();
            pageHelper.startPage(queryVO.getCurrentPage(), queryVO.getPageSize());
            List<TFeedback> list = feedbackMapper.selectByExampleWithBLOBs(example);
            pageBean.setList(list);
            PageInfo<TFeedback> pageInfo = new PageInfo<>(list);
            long total = pageInfo.getTotal();
            pageBean.setTotalCount(total);
            pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount()) / pageBean.getPageSize()));
            return pageBean;
        } else {
            PageBean<TFeedback> pageBean = new PageBean(1, 10);
            PageHelper pageHelper = new PageHelper();
            pageHelper.startPage(1, 10);
            List<TFeedback> list = feedbackMapper.selectByExample(example);
            pageBean.setList(list);
            PageInfo<TFeedback> pageInfo = new PageInfo<>(list);
            long total = pageInfo.getTotal();
            pageBean.setTotalCount(total);
            pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount()) / pageBean.getPageSize()));
            return pageBean;
        }
    }

    @Override
    public E3Result deleteFeedbackByIds(String ids) {
        String[] feedbackIds = ids.split(",");
        for (String feedbackId : feedbackIds) {
            feedbackMapper.deleteByPrimaryKey(Long.valueOf(feedbackId));
        }
        return E3Result.ok();
    }

    @Override
    public E3Result deleteFeedbackById(Long id) {
        feedbackMapper.deleteByPrimaryKey(id);
        return E3Result.ok();
    }

}
